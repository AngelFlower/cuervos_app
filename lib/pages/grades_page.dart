import 'package:cuervos_app/saiiut/get_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          title: const Text('Calificaciones'),
          backgroundColor: Colors.green.shade700),
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
        child: ExpansionTile(
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
          Icons.arrow_forward,
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

  Widget _cardMateria1(materias, int j) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detalleMateria', arguments: {
          'materia': materias['${j + 1}']['nombre'],
          'parciales': materias['${j + 1}']['parciales'],
          'extras': materias['${j + 1}']['extras'],
          'existenExtras': materias['${j + 1}']['existenExtras'],
        });
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.grey.shade50,
            Colors.white10,
            Colors.white,
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: Icon(
                Icons.book,
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
                  color: calificacionColor(
                      '${materias['${j + 1}']['calificacion']}'),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding:
                  const EdgeInsets.only(left: 15.0, top: 1.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${materias['${j + 1}']['profesor']}',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      textAlign: TextAlign.start),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey.shade600,
                    size: 20.0,
                  ),
                ],
              ),
            ),
          ],
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
