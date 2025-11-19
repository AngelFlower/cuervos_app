import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import '../../env/env.dart';

class Login {
  final storage = const FlutterSecureStorage();
  final dio = Dio();

  Login() {
    // Configurar Dio para NO seguir redirects
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      // Aceptar cualquier status code, incluyendo 302
      return status != null && status < 500;
    };
  }

  void login({required String matricula, required String contrasena, required BuildContext context}) async {
    String respuesta = '';
    String loginUrl =
        '${Env.proxyUrl}https://saiiut.utvtol.edu.mx/jsp/acceso.jsp?xUsuario=$matricula&xContrasena=$contrasena&xUniversidad=22';

    try {
      // Hacer POST request con Dio
      final response = await dio.post(loginUrl);

      print('Status Code: ${response.statusCode}');
      print('Headers: ${response.headers}');

      // Leer el status code original del servidor
      String? originalStatus = response.headers.value('x-final-status');
      print('Status original del servidor: $originalStatus');
      print('Status del proxy: ${response.statusCode}'); // Siempre será 200

// El resto del código sigue igual...
      String? setCookieJson = response.headers.value('x-final-set-cookie');
      String? location = response.headers.value('x-final-location');

      print('x-final-set-cookie (raw): $setCookieJson');
      print('x-final-location: $location');

      // Parsear las múltiples cookies del JSON array
      List<String> allCookies = [];
      if (setCookieJson != null && setCookieJson.isNotEmpty) {
        try {
          final dynamic decoded = jsonDecode(setCookieJson);
          if (decoded is List) {
            allCookies = decoded.map((e) => e.toString()).toList();
            print('Cookies parseadas (${allCookies.length}): $allCookies');
          } else if (decoded is String) {
            allCookies = [decoded];
            print('Cookie única: $allCookies');
          }
        } catch (e) {
          print('Error parsing cookies JSON: $e');
          // Si falla el parseo JSON, intentar usar el string directo
          if (setCookieJson.startsWith('[')) {
            // Es un array pero falló el parseo, intentar manual
            print('Intentando parseo manual del array');
          } else {
            // Es un string simple
            allCookies = [setCookieJson];
          }
        }
      }

      // BACKUP: Si no está en x-final-set-cookie, intentar desde cors-received-headers
      if ((allCookies.isEmpty || location == null) && response.headers.value('cors-received-headers') != null) {
        final corsHeaders = response.headers.value('cors-received-headers');

        try {
          Map<String, dynamic> receivedHeaders = jsonDecode(corsHeaders!);

          // Intentar obtener cookies del backup
          if (allCookies.isEmpty && receivedHeaders.containsKey('set-cookie')) {
            final cookieData = receivedHeaders['set-cookie'];
            if (cookieData is List) {
              allCookies = cookieData.map((e) => e.toString()).toList();
            } else if (cookieData is String) {
              allCookies = [cookieData];
            }
          }

          // Intentar obtener location del backup
          location ??= receivedHeaders['location']?.toString();

          print('From cors-received-headers:');
          print('cookies (${allCookies.length}): $allCookies');
          print('location: $location');
        } catch (e) {
          print('Error parsing cors-received-headers: $e');
        }
      }

      // Validar que tengamos los datos necesarios
      respuesta = getResult(location);

      if (respuesta != 'Inicio de sesión exitoso') {
        if (context.mounted) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Mensaje'),
              content: Text(respuesta),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Aceptar'),
                ),
              ],
            ),
          );
        }
      } else {
        // Guardar TODAS las cookies juntas
        if (allCookies.isNotEmpty) {
          // Opción 1: Guardar como JSON array (recomendado para múltiples cookies)
          String cookiesJson = jsonEncode(allCookies);
          await storeCookie(cookiesJson);
          print('✓ Cookies guardadas exitosamente como JSON');
          print('Total de cookies: ${allCookies.length}');

          // Mostrar cada cookie individualmente
          for (int i = 0; i < allCookies.length; i++) {
            print('Cookie $i: ${allCookies[i]}');
          }

          // Opción 2: También puedes guardar como string separado por "; "
          // String cookiesString = allCookies.join('; ');
          // await storeCookie(cookiesString);
        } else {
          print('⚠ Advertencia: No se recibieron cookies del servidor');
        }

        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      }
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      print('Response: ${e.response}');
      print('Response Headers: ${e.response?.headers}');

      if (context.mounted) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: Text('Error de conexión: ${e.message}'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      print('❌ Error en login: $error');
      if (context.mounted) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: Text('Error inesperado: $error'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
      }
    }
  }

  /// Guarda las cookies en storage (formato JSON array)
  Future<void> storeCookie(String cookie) async {
    await storage.write(key: 'auth', value: cookie);
  }

  /// Obtiene las cookies desde storage
  Future<String?> getCookie() async {
    return await storage.read(key: 'auth');
  }

  /// Obtiene las cookies como lista
  Future<List<String>> getCookiesAsList() async {
    final cookieData = await storage.read(key: 'auth');
    if (cookieData == null || cookieData.isEmpty) {
      return [];
    }

    try {
      // Intentar parsear como JSON array
      final decoded = jsonDecode(cookieData);
      if (decoded is List) {
        return decoded.map((e) => e.toString()).toList();
      }
    } catch (e) {
      print('Cookie no es JSON, retornando como string único');
    }

    // Si no es JSON, retornar como string único
    return [cookieData];
  }

  /// Obtiene un valor específico de cookie por nombre
  Future<String?> getCookieValue(String cookieName) async {
    final cookies = await getCookiesAsList();

    for (final cookie in cookies) {
      // Parsear formato: "nombre=valor; Path=..."
      final parts = cookie.split(';');
      if (parts.isNotEmpty) {
        final nameValue = parts[0].trim().split('=');
        if (nameValue.length >= 2 && nameValue[0] == cookieName) {
          return nameValue[1];
        }
      }
    }

    return null;
  }

  /// Elimina las cookies
  Future<void> deleteCookie() async {
    await storage.delete(key: 'auth');
  }

  String getResult(String? location) {
    if (location == null || location.isEmpty) {
      return 'Error de conexión: No se recibió respuesta del servidor';
    }

    switch (location) {
      case 'https://saiiut.utvtol.edu.mx/jsp/login.jsp?mensaje=usuario':
        return 'El usuario no existe';
      case 'https://saiiut.utvtol.edu.mx/jsp/login.jsp?mensaje=passwd':
        return 'La contraseña es incorrecta';
      case 'https://saiiut.utvtol.edu.mx/jsp/menu.jsp':
        return 'Inicio de sesión exitoso';
      default:
        return 'Error desconocido: $location';
    }
  }
}
