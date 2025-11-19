import 'package:cuervos_app/core/services/saiiut/login.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../env/env.dart';

class GetData {
  Future<dynamic> obtenerDatos() async {
    String datosUrl = '${Env.proxyUrl}https://saiiut.utvtol.edu.mx/jsp/Escolar/muestra_datos_alumno.jsp';
    var datosUri = Uri.parse(datosUrl);

    // Obtener las cookies guardadas
    var cookieJson = await Login().getCookie();

    if (cookieJson == null || cookieJson.isEmpty) {
      print('❌ No hay cookies guardadas');
      return null;
    }

    // Convertir el JSON array de cookies a formato Cookie header
    String cookieHeader = '';
    try {
      final dynamic decoded = jsonDecode(cookieJson);

      if (decoded is List) {
        // Parsear cada cookie y extraer solo nombre=valor
        List<String> cookiePairs = [];

        for (var cookie in decoded) {
          String cookieStr = cookie.toString();
          // Extraer solo la parte "nombre=valor" antes del primer ";"
          var parts = cookieStr.split(';');
          if (parts.isNotEmpty) {
            cookiePairs.add(parts[0].trim());
          }
        }

        // Unir todas las cookies con "; "
        cookieHeader = cookiePairs.join('; ');
        print('✓ Cookie header construido: $cookieHeader');
      } else if (decoded is String) {
        cookieHeader = decoded;
      }
    } catch (e) {
      print('⚠️ Las cookies no están en formato JSON, usando string directo');
      cookieHeader = cookieJson;
    }

    if (cookieHeader.isEmpty) {
      print('❌ No se pudo construir el header de cookies');
      return null;
    }

    print('Haciendo petición con cookies...');
    print('URL: $datosUrl');
    print('Cookie: $cookieHeader');

    http.Response? respuesta;

    try {
      // CRÍTICO: Usar x-cors-headers para enviar cookies a través del proxy
      final corsHeaders = jsonEncode({
        'Cookie': cookieHeader,
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'es-MX,es;q=0.9',
      });

      respuesta = await http.get(
        datosUri,
        headers: {
          'x-cors-headers': corsHeaders, // Enviar headers a través del proxy
        },
      );

      print('Status: ${respuesta.statusCode}');
      print('Response headers: ${respuesta.headers}');
      print('Response body length: ${respuesta.body.length}');

      // Verificar si la respuesta contiene error del servidor
      if (respuesta.body.contains('NullPointerException') || respuesta.body.contains('error interno')) {
        print('❌ El servidor retornó un error. Posibles causas:');
        print('   1. Las cookies no son válidas o expiraron');
        print('   2. El formato de cookies es incorrecto');
        print('   3. Necesitas hacer login nuevamente');

        // Debug: Mostrar parte de la respuesta
        print('Inicio de respuesta: ${respuesta.body.substring(0, 200)}');
        return null;
      }

      return obtenerDatosEstudiante(respuesta);
    } catch (e) {
      print('❌ Error en la petición: $e');
      return null;
    }
  }

  Future<dynamic> obtenerDatosEstudiante(responses) async {
    try {
      var documento = parse(responses.body);

      // Verificar que el documento tenga la estructura esperada
      var tabla1 = documento.querySelector('.Tabla');

      if (tabla1 == null) {
        print('❌ No se encontró la tabla principal. Posible sesión expirada.');
        return false;
      }

      if (!(documento.querySelectorAll('.textoForma').length > 13)) {
        print('❌ Estructura HTML inesperada. Posible sesión expirada.');
        return false;
      }

      var calificacionesTabla = documento.querySelectorAll('.textoForma')[14];
      var cuatrimestesLista = calificacionesTabla.querySelectorAll('table');
      var promedio = '';
      var promedioGeneral = '';

      Map<String, dynamic> cuatrimestesMap = {};

      for (var i = (cuatrimestesLista.length - 1); i > 0; i--) {
        Map<String, dynamic> materiasMap = {};
        var cuatrimestre = cuatrimestesLista[i];

        var materias = cuatrimestre.querySelectorAll('tr');
        for (var j = 1; j < materias.length; j++) {
          var materia = materias[j];

          var materiaNombre = materia.querySelectorAll('td')[0].text;
          var materiaProfesor = materia.querySelectorAll('td')[1].text;
          var materiaCalificacion = '';

          if (materia.querySelectorAll('td').length > 4) {
            var parciales = {
              'parcial1': materia.querySelectorAll('td')[2].text,
              'parcial2': materia.querySelectorAll('td')[3].text,
              'parcial3': materia.querySelectorAll('td')[4].text,
            };

            var extras = {
              'extra1': materia.querySelectorAll('td')[6].text,
              'extra2': null,
              'extra3': null,
            };

            if (materia.querySelectorAll('td').length == 9) {
              extras['extra2'] = materia.querySelectorAll('td')[7].text;
            }

            materiaCalificacion = materia.querySelectorAll('td').last.text;
            if (j != 1) {
              materiasMap.addEntries([
                MapEntry('${j - 1}', {
                  'nombre': materiaNombre.replaceFirst(RegExp(r"\s+\b|\b\s"), ''),
                  'profesor': materiaProfesor.replaceFirst(RegExp(r"\s+\b|\b\s"), ''),
                  'calificacion': materiaCalificacion.toString(),
                  'parciales': parciales,
                  'extras': extras,
                  'existenExtras': _existenExtras(extras),
                }),
              ]);
            }
          }

          if (i == cuatrimestesLista.length - 1) {
            if (j == materias.length - 1) {
              promedioGeneral = materia.querySelectorAll('td')[1].text;
            }
            if (materias.length - 2 == j) {
              promedio = materia.querySelectorAll('td')[1].text;
            }
          } else if (materias.length - 1 == j) {
            promedio = materia.querySelectorAll('td')[1].text;
          }
        }

        String cuatrimestreNombre = materias[0].querySelectorAll('td')[0].text;
        cuatrimestreNombre = cuatrimestreNombre.replaceFirst(RegExp(r"\s+\b|\b\s"), '');
        cuatrimestreNombre = cuatrimestreNombre.replaceAll('&nbsp;', '');
        cuatrimestreNombre = cuatrimestreNombre.replaceAll('\n', '');
        cuatrimestreNombre = cuatrimestreNombre.replaceAll('        ', '\n');

        cuatrimestesMap.addEntries([
          MapEntry('$i', {'nombre': cuatrimestreNombre, 'materias': materiasMap, 'promedio': promedio}),
        ]);
      }

      var datos = tabla1.querySelectorAll('.textoConsulta');

      Map<String, String> datosEstudiante = {
        'matricula': datos[0].text,
        'nombre': datos[1].text,
        'apellido_paterno': datos[2].text,
        'apellido_materno': datos[3].text,
        'fecha_nacimiento': datos[4].text,
        'estado_civil': datos[5].text,
        'curp': datos[7].text,
        'carrera': datos[9].text,
        'turno': datos[10].text,
        'cuatrimiestre': datos[11].text,
        'grupo': datos[12].text,
        'situacion_academica': datos[13].text,
        'promedio_general': promedioGeneral,
      };

      Map<String, dynamic> estudiante = {
        'estudiante': {'datos': datosEstudiante, 'cuatrimestres': cuatrimestesMap}
      };

      print('✓ Datos obtenidos exitosamente');
      return estudiante;
    } catch (e) {
      print('❌ Error parseando datos del estudiante: $e');
      return null;
    }
  }

  dynamic _existenExtras(dynamic extras) {
    if (_isNull(extras['extra1']) && _isNull(extras['extra2']) && _isNull(extras['extra3'])) {
      return false;
    }
    return true;
  }

  dynamic _isNull(dynamic value) {
    if (value == null || value == '') {
      return true;
    }
    return false;
  }
}
