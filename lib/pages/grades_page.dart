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
          backgroundColor: Colors.green.shade600),
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
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 1.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.shade50,
                                    Colors.white10,
                                    Colors.white,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpansionTile(
                                  initiallyExpanded: true,
                                  trailing: Icon(
                                    Icons.class__outlined,
                                    color: Colors.green.shade500,
                                  ),
                                  title: Text(
                                    '${materias['${j + 1}']['nombre']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade700,
                                      //height: 1.2,
                                    ),

                                    //textAlign: TextAlign.center,
                                  ),
                                  leading: Text(
                                    '${materias['${j + 1}']['calificacion']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: CalificacionColor(
                                          '${materias['${j + 1}']['calificacion']}'),
                                    ),
                                    //textAlign: TextAlign.center
                                  ),
                                  //alignment: Alignment(-1.1, 0),

                                  children: [
                                    // subtitle:
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(
                                          left: 15.0, top: 1.0, bottom: 10.0),
                                      child: Text(
                                          '${materias['${j + 1}']['profesor']}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade500),
                                          textAlign: TextAlign.start),
                                    )
                                  ],
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(bottom: 3.0),
                                //   child:

                                //),
                              ],
                            ),
                          ),
                        ));
                      }

                      var expanded = ((index - 1) ==
                          (snapshot
                              .data['estudiante']['cuatrimestres']
                                  [(index + 1).toString()]
                              .length));
                      materiasWidget
                        ..add(Card(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                            child: ExpansionTile(
                              initiallyExpanded: expanded,
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
                                    child: Column(
                                      children: calificacionesWidgets,
                                    ),
                                    // GridView.count(
                                    //   shrinkWrap: true,
                                    //   physics: NeverScrollableScrollPhysics(),
                                    //   crossAxisCount: 2,
                                    //   childAspectRatio: 1.3,
                                    //   children: calificacionesWidgets,
                                    // ),
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
    return Colors.grey.shade900;
    if (calificacion == '10.0') {
      return Colors.blue;
    } else if (calificacion == '9.0') {
      return Colors.blue.shade400;
    } else if (calificacion == '8.0') {
      return Colors.blue.shade300;
    } else if (calificacion == '7.0') {
      return Colors.red.shade500;
    } else {
      return Colors.grey.shade500;
    }
  }
}
