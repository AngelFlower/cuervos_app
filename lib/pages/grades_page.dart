import 'package:cuervos_app/saiiut/get_data.dart';
import 'package:flutter/material.dart';

class GradesPage extends StatefulWidget {
  GradesPage({Key? key}) : super(key: key);

  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  Future<dynamic> obtenerInfo() async {
    return await getData().obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Calificaciones'),
          backgroundColor: Colors.green.shade500),
      body: FutureBuilder(
        future: obtenerInfo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            print(
                'tiene datos ${snapshot.data['estudiante']['cuatrimestres'].length}');
            return ListView.builder(
              itemCount: snapshot.data['estudiante']['cuatrimestres'].length,
              itemBuilder: (BuildContext context, int index) {
                dynamic materias;
                List<Widget> materiasWidget = [];
                //print(
                //    'index ${snapshot.data['estudiante']['cuatrimestres'][(index + 1).toString()]}');
                for (var i = 1;
                    i <
                        snapshot
                            .data['estudiante']['cuatrimestres']
                                [(index + 1).toString()]
                            .length;
                    i++) {
                  // print(
                  //    'index ${snapshot.data['estudiante']['cuatrimestres'][(index + 1).toString()]['materias']}');
                  materias = snapshot.data['estudiante']['cuatrimestres']
                      [(index + 1).toString()]['materias'];
                  print('materias $materias');
                  materiasWidget.add(
                    ListTile(
                      title: Text(
                        'Cuatrimestre ${index + 1}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                  for (var j = 0; j < materias.length; j++) {
                    print('materias ${materias['${j + 1}']['nombre']}');
                    materiasWidget
                      ..add(ListTile(
                        title: Text('${materias['${j + 1}']['nombre']}'),
                        subtitle:
                            Text('${materias['${j + 1}']['calificacion']}'),
                      ))
                      ..add(Divider());
                  }
                  materiasWidget
                    ..add(ListTile(
                      title: Text('Promedio', style: TextStyle(fontSize: 20)),
                      subtitle: Text(
                          '${snapshot.data['estudiante']['cuatrimestres'][(index + 1).toString()]['promedio']}'),
                    ))
                    ..add(Divider());
                }
                return Column(children: [
                  for (var i = 0; i < materiasWidget.length; i++)
                    materiasWidget[i]
                ]);
                // return ListTile(
                //   title: Text('index.toStrings()'),
                //   //subtitle: Text(snapshot.data[index]['grade']),
                // );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
