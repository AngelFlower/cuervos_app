import 'dart:convert';

import 'package:cuervos_app/comentarios/comentario.dart';
import 'package:http/http.dart' as http;

class ObtenerComentarios {
  Future fetchAlbum({required String maestro}) async {
    final response = await http
        .get(Uri.parse('http://192.168.0.124:8000/api/maestros/$maestro'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return (jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Error al cargar comentarios');
    }
  }
}
