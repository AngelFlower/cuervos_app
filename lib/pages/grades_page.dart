import 'package:cuervos_app/saiiut/get_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradesPage extends StatefulWidget {
  GradesPage({Key? key}) : super(key: key);

  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  Future<dynamic> obtenerInfo() async {
    return await GetData().obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    bool _expanded = true;
    return Scaffold(
      appBar: AppBar(
          title: Text('Calificaciones'),
          backgroundColor: Colors.green.shade500),
      body: Container(
        //color: Colors.grey[100],
        child: SafeArea(
          child: FutureBuilder(
            future: obtenerInfo(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                //print(
                //
                //   'tiene datos ${snapshot.data['estudiante']['cuatrimestres'].length}');

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:
                      snapshot.data['estudiante']['cuatrimestres'].length,
                  itemBuilder: (BuildContext context, int index) {
                    dynamic materias;
                    List<Widget> materiasWidget = [];
                    List<Widget> calificacionesWidgets = [];

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
                      //print('materias $materias');
                      // materiasWidget
                      //   ..add(
                      //     ListTile(
                      //       title: Text(
                      //         'Cuatrimestre ${index + 1}',
                      //         style: TextStyle(fontSize: 20),
                      //       ),
                      //     ),
                      //   );

                      for (var j = 0; j < materias.length; j++) {
                        //print('materias ${materias['${j + 1}']['nombre']}');

                        calificacionesWidgets.add(Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white10,
                                  Colors.grey.shade50
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Text(
                                    '${materias['${j + 1}']['nombre']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade700,
                                      //height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  //alignment: Alignment(-1.1, 0),

                                  // subtitle: Text(
                                  //     '${materias['${j + 1}']['profesor']}',
                                  //     style: TextStyle(
                                  //         fontSize: 14,
                                  //         color: Colors.grey.shade400),
                                  //     textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3.0),
                                  child: Text(
                                      '${materias['${j + 1}']['calificacion']}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: CalificacionColor(
                                            '${materias['${j + 1}']['calificacion']}'),
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        ));
                      }

                      materiasWidget
                        ..add(Card(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                            child: ExpansionTile(
                              title: Text('Cuatrimestre ${index + 1}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700)),
                              // leading: Icon(
                              //   Icons.calendar_today,
                              //   color: Colors.green.shade500,
                              // ),
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    '${snapshot.data['estudiante']['cuatrimestres'][(index + 1).toString()]['promedio']}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ),
                              children: <Widget>[
                                SafeArea(
                                  minimum: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: SizedBox(
                                    child: GridView.count(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.3,
                                      children: calificacionesWidgets,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                      // ..add(ListTile(
                      //   title:
                      //       Text('Promedio', style: TextStyle(fontSize: 20)),
                      //   subtitle: Text(
                      //       '${snapshot.data['estudiante']['cuatrimestres'][(index + 1).toString()]['promedio']}'),
                      // ));
                    }
                    return Column(children: [
                      for (var i = 0; i < materiasWidget.length; i++)
                        materiasWidget[i]
                    ]);
                    // return ListTile(
                    //   title: Text('index.toStrings()'),
                    //   //subtitle: Text(snapshot2.data[index]['grade']),
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
        ),
      ),
    );
  }

  Color CalificacionColor(String calificacion) {
    if (calificacion == '10.0') {
      return Colors.greenAccent.shade700;
    } else if (calificacion == '9.0') {
      return Colors.lightGreen.shade600;
    } else if (calificacion == '8.0') {
      return Colors.yellow.shade800;
    } else if (calificacion == '7.0') {
      return Colors.red.shade500;
    } else {
      return Colors.grey.shade500;
    }
  }
}
