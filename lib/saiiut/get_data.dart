import 'package:html/parser.dart';

dynamic obtenerDatosEstudiante(responses) {
  var documento = parse(responses.body);

  var tabla1 = documento.querySelector('.Tabla');
  var calificacionesTabla = documento.querySelectorAll('.textoForma')[14];

  var cuatrimestesLista = calificacionesTabla.querySelectorAll('table');
  var promedio = '';

  Map<String, dynamic> cuatrimestesMap = {};

  for (var i = 1; i < cuatrimestesLista.length; i++) {
    Map<String, dynamic> materiasMap = {};
    var cuatrimestre = cuatrimestesLista[i];

    var materias = cuatrimestre.querySelectorAll('tr');
    for (var j = 1; j < materias.length; j++) {
      var materia = materias[j];
      var materiaNombre = materia.querySelectorAll('td')[0].text;
      var materiaProfesor = materia.querySelectorAll('td')[1].text;
      var materiaCalificacion = '';
      if (materia.querySelectorAll('td').length > 4) {
        materiaCalificacion = materia.querySelectorAll('td')[5].text;
        if (j != 1) {
          materiasMap.addEntries([
            MapEntry(materiaNombre, {
              'profesor': materiaProfesor,
              'calificacion': materiaCalificacion
            }),
          ]);
        }

        //print('materia');
      }
      if (materias.length - 1 == j) {
        promedio = materia.querySelectorAll('td')[1].text;
      }
      //print('$materiaNombre $materiaCalificacion, $materiaProfesor');
    }
    cuatrimestesMap.addEntries([
      MapEntry('$i', {'materias': materiasMap, 'promedio': promedio}),
    ]);
  }

  //print(cuatrimestesMap);

  var datos = tabla1!.querySelectorAll('.textoConsulta');

  Map<String, String> datosEstudiante = {
    'Matricula': datos[0].text,
    'Nombre': datos[1].text,
    'Apellido Paterno': datos[2].text,
    'Apellido Materno': datos[3].text,
    'Fecha Nacimiento': datos[4].text,
    'Estado civil': datos[5].text,
    'CURP': datos[7].text,
    'Carrera': datos[9].text,
    'Turno': datos[10].text,
    'Cuatrimiestre': datos[11].text,
    'Grupo': datos[12].text,
    'Situacion Academica': datos[13].text,
  };
  //print(datosAlumno);

  Map<String, dynamic> estudiante = {
    'estudiante': {'datos': datosEstudiante, 'cuatrimestres': cuatrimestesMap}
  };

  print(estudiante);
  return estudiante;
}
