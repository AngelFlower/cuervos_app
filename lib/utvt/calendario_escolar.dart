import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class CalendarioEscolar {
  Future<String> obtenerCalendario() async {
    var peticion = await _peticionCalendario();
    if (peticion != 'Error al obtener el calendario') {
      peticion = 'https://utvt.edomex.gob.mx/$peticion';
    }
    print(peticion);
    return peticion;
  }

  Future<String> _peticionCalendario() async {
    String retorno = '';
    await http
        .get(Uri.parse('https://utvt.edomex.gob.mx/calendario-escolar'))
        .then((response) {
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var contenido = document.querySelector('.region-content');
        var calendario = contenido?.getElementsByTagName('img')[0];
        var url = calendario?.attributes['src'];
        //print(url);
        retorno = url.toString();
      } else {
        retorno = 'Error al obtener el calendario';
      }
    });
    return retorno;
  }
}
