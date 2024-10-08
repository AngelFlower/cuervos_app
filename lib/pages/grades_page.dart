import 'package:cuervos_app/saiiut/get_data.dart';
import 'package:flutter/material.dart';

class GradesPage extends StatefulWidget {
  const GradesPage({Key? key}) : super(key: key);

  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  Future<dynamic> obtenerInfo() async {
    return await GetData().obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: const Text('Calificaciones'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: obtenerInfo(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data['estudiante']['cuatrimestres'].length,
                itemBuilder: (BuildContext context, int index) {
                  dynamic materias;
                  List<Widget> calificacionesWidgets = [];

                  var longitud =
                      snapshot.data['estudiante']['cuatrimestres'].length;

                  materias = snapshot.data['estudiante']['cuatrimestres']
                      [(longitud - index).toString()]['materias'];

                  for (var j = 0; j < materias.length; j++) {
                    calificacionesWidgets.add(_cardMateria(materias, j));
                  }

                  var expanded = index == 0;

                  return _cardCuatrimestre(expanded, snapshot, longitud, index,
                      calificacionesWidgets);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Card _cardCuatrimestre(bool expanded, AsyncSnapshot<dynamic> snapshot,
      longitud, int index, List<Widget> calificacionesWidgets) {
    return Card(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
        child: Theme(
          data: ThemeData(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: expanded,
            collapsedBackgroundColor: Colors.white70,
            backgroundColor: const Color.fromARGB(204, 255, 255, 255),
            title: Text(
                '${snapshot.data['estudiante']['cuatrimestres'][(longitud - (index)).toString()]['nombre']}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600)),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '${snapshot.data['estudiante']['cuatrimestres'][(longitud - (index)).toString()]['promedio']}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400)),
            ),
            children: <Widget>[
              SafeArea(
                minimum: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: SizedBox(
                  child: Column(
                    children: calificacionesWidgets,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardMateria(materias, int j) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/detalleMateria', arguments: {
            'materia': materias['${j + 1}']['nombre'],
            'parciales': materias['${j + 1}']['parciales'],
            'extras': materias['${j + 1}']['extras'],
            'existenExtras': materias['${j + 1}']['existenExtras'],
          });
        },
        subtitle: Text(
          '${materias['${j + 1}']['profesor']}',
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: _colorExtra(materias['${j + 1}']['existenExtras']),
        ),
        title: Text(
          '${materias['${j + 1}']['nombre']}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade700,
          ),
        ),
        leading: Text(
          '${materias['${j + 1}']['calificacion']}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: calificacionColor('${materias['${j + 1}']['calificacion']}'),
          ),
        ),
      ),
    );
  }

  Color _colorExtra(var extras) {
    if (extras == true) {
      return Colors.orange.shade500;
    }
    return Colors.green.shade500;
  }

  Color calificacionColor(String calificacion) {
    if (calificacion == '10.0') {
      return Colors.blue;
    } else {
      return Colors.grey.shade900;
    }
  }
}
