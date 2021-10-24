import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void login(
    {required String matricula,
    required String contrasena,
    required BuildContext context}) {
  String respuesta = '';
  var url =
      'http://saiiut.utvtol.edu.mx/jsp/acceso.jsp?xUsuario=$matricula&xContrasena=$contrasena&xUniversidad=22';
  //'http://saiiut.utvtol.edu.mx/jsp/acceso.jsp?xUsuario=222010681&xContrasena=15101997Gg&xUniversidad=22';

  // string to uri
  var uri = Uri.parse(url);

  // http post request and get headers
  http.post(uri).then((response) {
    //print(response.headers);
    //print(response.body);
    respuesta = getResult(response);
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Mensaje'),
              content: Text(respuesta.toString()),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  });

  //http.Response response = await http.post(uri);
  //respuesta = getResult(response);
  //print(respuesta);
  //return respuesta;
}

String getResult(http.Response response) {
  print(response.headers['location']);
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
  //return response.headers['location'].toString();
}
