import 'package:cuervos_app/saiiut/login.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class GetData {
  Future<dynamic> obtenerDatos() async {
    String datosUrl =
        'http://saiiut.utvtol.edu.mx/jsp/Escolar/muestra_datos_alumno.jsp';
    var datosUri = Uri.parse(datosUrl);

    var cookie = await Login().getCookie();

    if (cookie == null) {
      return null;
    }
    http.Response? respuesta;
    //print('cookie: $cookie');
    await http.get(datosUri, headers: {
      'Cookie': cookie,
    }).then((responses) {
      respuesta = responses;
    });
    return obtenerDatosEstudiante(respuesta);
    //return dynamic;
    //Navigator.pushReplacementNamed(context, '/home');
  }

  Future<dynamic> obtenerDatosEstudiante(responses) async {
    var documento = parse(responses.body);
    //print(responses.body);
    var tabla1 = documento.querySelector('.Tabla');
    if (!(documento.querySelectorAll('.textoForma').length > 13)) {
      return false;
    }
    var calificacionesTabla = documento.querySelectorAll('.textoForma')[14];

    var cuatrimestesLista = calificacionesTabla.querySelectorAll('table');
    var promedio = '';
    var promedioGeneral = '';

    Map<String, dynamic> cuatrimestesMap = {};

    //print('cuatrimestesLista: ${cuatrimestesLista.length}');

    //for (var i = 1; i < cuatrimestesLista.length; i++) {
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
                'profesor':
                    materiaProfesor.replaceFirst(RegExp(r"\s+\b|\b\s"), ''),
                'calificacion': materiaCalificacion.toString(),
                'parciales': parciales,
                'extras': extras,
                'existenExtras': _existenExtras(extras),
              }),
            ]);
          }

          //print('materia');
        }
        if (i == cuatrimestesLista.length - 1) {
          if (j == materias.length - 1) {
            promedioGeneral = materia.querySelectorAll('td')[1].text;
          }
          if (materias.length - 2 == j) {
            promedio = materia.querySelectorAll('td')[1].text;
          }
          //print('Cuatri ultimo ${materia.text}');
        } else if (materias.length - 1 == j) {
          promedio = materia.querySelectorAll('td')[1].text;
        }
        //print('$materiaNombre $materiaCalificacion, $materiaProfesor');
      }

      String cuatrimestreNombre = materias[0].querySelectorAll('td')[0].text;
      cuatrimestreNombre =
          cuatrimestreNombre.replaceFirst(RegExp(r"\s+\b|\b\s"), '');
      cuatrimestreNombre = cuatrimestreNombre.replaceAll('&nbsp;', '');
      cuatrimestreNombre = cuatrimestreNombre.replaceAll('\n', '');
      cuatrimestreNombre = cuatrimestreNombre.replaceAll('        ', '\n');

      cuatrimestesMap.addEntries([
        MapEntry('$i', {
          'nombre': cuatrimestreNombre,
          'materias': materiasMap,
          'promedio': promedio
        }),
      ]);
    }

    //print(cuatrimestesMap);

    var datos = tabla1!.querySelectorAll('.textoConsulta');

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
    //print(datosEstudiante);

    Map<String, dynamic> estudiante = {
      'estudiante': {'datos': datosEstudiante, 'cuatrimestres': cuatrimestesMap}
    };

    //print(estudiante);
    //print('cuatrimestres: ${cuatrimestesMap.length}');
    return estudiante;
  }

  dynamic _existenExtras(dynamic extras) {
    if (_isNull(extras['extra1']) &&
        _isNull(extras['extra2']) &&
        _isNull(extras['extra3'])) {
      return false;
    }
    return true;
  }

  dynamic _isNull(dynamic value) {
    if (value == null || value == '') {
      return true;
    } else
      return false;
  }
}
