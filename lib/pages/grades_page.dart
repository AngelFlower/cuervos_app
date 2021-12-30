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
                  //reverse: true,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //controller: ScrollController(initialScrollOffset: 50000.0),
                  itemCount:
                      snapshot.data['estudiante']['cuatrimestres'].length,
                  itemBuilder: (BuildContext context, int index) {
                    dynamic materias;
                    List<Widget> materiasWidget = [];
                    List<Widget> calificacionesWidgets = [];

                    //print(
                    //    'index ${snapshot.data['estudiante']['cuatrimestres'][(index + 1).toString()]}');

                    var longitud =
                        snapshot.data['estudiante']['cuatrimestres'].length;
                    //print((snapshot.data['estudiante']['cuatrimestres']
                    //    .toString()));
                    //print('longitud ${longitud}');
                    //for (var i = 1; i < longitud; i++) {
                    //print(((index + 1)).toString());
                    //print((index + 1).toString());
                    //print('---');
                    // print(
                    //    'index ${snapshot.data['estudiante']['cuatrimestres'][(index + 1).toString()]['materias']}');
                    materias = snapshot.data['estudiante']['cuatrimestres']
                        //[(index + 1).toString()]['materias'];
                        [(longitud - index).toString()]['materias'];
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
                        elevation: 1.5,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/comentarios',
                                      arguments: {
                                        'profesor':
                                            '${materias['${j + 1}']['profesor']}'
                                      });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(0.1),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.grey.shade100),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2)),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
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
                                          color: calificacionColor(
                                              '${materias['${j + 1}']['calificacion']}'),
                                        ),
                                        //textAlign: TextAlign.center
                                      ),
                                      //alignment: Alignment(-1.1, 0),

                                      // subtitle:
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(
                                          left: 16.0, top: 1.0, bottom: 10.0),
                                      child: Text(
                                          '${materias['${j + 1}']['profesor']}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade500),
                                          textAlign: TextAlign.start),
                                    )
                                  ],
                                ),
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

                    // var expanded = ((index - 1) ==
                    //     (snapshot
                    //         .data['estudiante']['cuatrimestres']
                    //             [(index + 1).toString()]
                    //         .length));
                    var expanded = index == 0;
                    //materiasWidget
                    //  ..add(
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                        child: ExpansionTile(
                          initiallyExpanded: expanded,
                          title: Text(
                              //'Cuatrimestre ${(longitud - index).toString()}',
                              '${snapshot.data['estudiante']['cuatrimestres'][(longitud - (index)).toString()]['nombre']}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600)),
                          // leading: Icon(
                          //   Icons.calendar_today,
                          //   color: Colors.green.shade500,
                          // ),
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${snapshot.data['estudiante']['cuatrimestres'][(longitud - (index)).toString()]['promedio']}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
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
                    );
                    // ..add(ListTile(
                    //   title:
                    //       Text('Promedio', style: TextStyle(fontSize: 20)),
                    //   subtitle: Text(
                    //       '${snapshot.data['estudiante']['cuatrimestres'][(index + 1).toString()]['promedio']}'),
                    // ));
                    //}

                    // materiasWidget.reversed.toList();
                    // print('materiasWidget ${materiasWidget.length}');

                    // return Column(children: [
                    //   for (var i = 0; i < materiasWidget.length; i++)
                    //     materiasWidget[i]
                    // ]);
                    // return ListTile(
                    //   title: Text('index.toStrings()'),
                    //   //subtixtle: Text(snapshot2.data[index]['grade']),
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

  Color calificacionColor(String calificacion) {
    if (calificacion == '10.0') {
      return Colors.blue;
    } else {
      return Colors.grey.shade900;
    }
  }
}
