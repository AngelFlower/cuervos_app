import 'package:cuervos_app/saiiut/get_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

void login(
    {required String matricula,
    required String contrasena,
    required BuildContext context}) {
  String respuesta = '';
  String loginUrl =
      'http://saiiut.utvtol.edu.mx/jsp/acceso.jsp?xUsuario=$matricula&xContrasena=$contrasena&xUniversidad=22';
  String datosUrl =
      'http://saiiut.utvtol.edu.mx/jsp/Escolar/muestra_datos_alumno.jsp';

  var loginUri = Uri.parse(loginUrl);
  var datosUri = Uri.parse(datosUrl);

  // http post request and get headers
  http.post(loginUri).then((response) {
    respuesta = getResult(response);
    if (respuesta.toString() != 'Inicio de sesión exitoso') {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Mensaje'),
                content: Text(respuesta.toString()),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('Aceptar'),
                  ),
                ],
              ));
    } else {
      http.get(datosUri, headers: {
        'Cookie': response.headers['set-cookie'].toString(),
      }).then((responses) {
        obtenerDatosEstudiante(responses);
      });
      Navigator.pushReplacementNamed(context, '/home');
    }
  });
}

String getResult(http.Response response) {
  //print(response.headers['location']);
  switch (response.headers['location']) {
    case 'http://saiiut.utvtol.edu.mx/jsp/login.jsp?mensaje=usuario':
      return 'El usuario no existe';
    case 'http://saiiut.utvtol.edu.mx/jsp/login.jsp?mensaje=passwd':
      return 'La contraseña es incorrecta';
    case 'http://saiiut.utvtol.edu.mx/jsp/menu.jsp':
      return 'Inicio de sesión exitoso';
    default:
      return 'Error';
  }
}
