import 'package:cuervos_app/saiiut/get_data.dart';
import 'package:cuervos_app/saiiut/login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get future map
  Future<dynamic> obtenerInfo() async {
    return await GetData().obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // back button
        body: Container(
      color: Colors.grey.shade200,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          FutureBuilder<dynamic>(
              future: obtenerInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _perfil(context, snapshot.data);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: Text(''), // You can add title here
              leading: IconButton(
                tooltip: 'Cerrar sesión',
                icon: Icon(Icons.exit_to_app, color: Colors.white70),
                onPressed: () {
                  Login().deleteCookie();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                },
              ),
              backgroundColor:
                  Colors.blue.withOpacity(0.0), //You can make this transparent
              elevation: 0.0, //No shadow
            ),
          ),
        ],
      ),
    ));
  }
}

Widget _perfil(BuildContext context, data) {
  return Stack(
    children: [
      LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(0.0),
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height * 0.46,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        style: BorderStyle.none,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.shade700,
                          Colors.green.shade800,
                        ],
                      ),
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.07,
                        child: Image.asset('assets/images/cuervo_perfil.png'),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                          '${data["estudiante"]["datos"]["nombre"]} ${data["estudiante"]["datos"]["apellido_paterno"]} ${data["estudiante"]["datos"]["apellido_materno"]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Cuervo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          // No border
                          border: Border.all(
                            style: BorderStyle.none,
                          ),

                          gradient: LinearGradient(
                            colors: [
                              Colors.green.shade700,
                              Colors.green.shade800,
                            ],
                          ),
                        ),
                        child: Card(
                            margin: EdgeInsets.only(
                                top: 0.0, bottom: 10.0, left: 0.0, right: 0.0),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          child: Column(
                                        children: [
                                          Text(
                                            'Matrícula',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 14.0),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            '${data["estudiante"]["datos"]["matricula"]}',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          )
                                        ],
                                      )),
                                      Container(
                                        child: Column(children: [
                                          Text(
                                            'Grupo',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 14.0),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            '${data["estudiante"]["datos"]["grupo"]}',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          )
                                        ]),
                                      ),
                                      Container(
                                          child: Column(
                                        children: [
                                          Text(
                                            'Cuatrimestre',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 14.0),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            '${data["estudiante"]["datos"]["cuatrimiestre"]}',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          )
                                        ],
                                      )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Promedio General',
                                              style: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 14.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            SizedBox(
                                              child: Text(
                                                '${data["estudiante"]["datos"]["promedio_general"]}',
                                                //'9.6',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Estatus',
                                              style: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 14.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            SizedBox(
                                              child: Text(
                                                '${data["estudiante"]["datos"]["situacion_academica"]}',
                                                //'9.6',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Carrera',
                                              style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 14.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child: Text(
                                                '${data["estudiante"]["datos"]["carrera"]}',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ]),
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                        child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 45.0),
                            child: Container(
                                //height: ,
                                child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Consulta",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.0,
                                  ),
                                  Text(
                                    "Toca un botón para consultar",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green.shade400,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 10.0,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/grades');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.school,
                                            color: Colors.black45,
                                            size: 35.0,
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Calificaciones",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2.0,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                child: Text(
                                                  "Consulta por cuatrimestre",
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  /*

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.auto_awesome,
                                              color: Colors.yellowAccent[400],
                                              size: 35,
                                            ),
                                            SizedBox(
                                              width: 20.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Magic",
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                Text(
                                                  "Spatial & Sword Magic, Telekinesis",
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey[400],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.favorite,
                                              color: Colors.pinkAccent[400],
                                              size: 35,
                                            ),
                                            SizedBox(
                                              width: 20.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Loves",
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                Text(
                                                  "Eating cakes",
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey[400],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.people,
                                              color: Colors.lightGreen[400],
                                              size: 35,
                                            ),
                                            SizedBox(
                                              width: 20.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Team",
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                Text(
                                                  "Team Natsu",
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey[400],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        */
                                ],
                              ),
                            )))),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ],
  );
}
