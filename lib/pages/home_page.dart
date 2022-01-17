import 'package:cuervos_app/helpers/ad_helper.dart';
import 'package:cuervos_app/libs/shimmer_animation.dart';
import 'package:cuervos_app/saiiut/get_data.dart';
import 'package:cuervos_app/saiiut/login.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
                      // return const ShimmerLoading();
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBar(
                  // You can add title here
                  actions: [
                    GestureDetector(
                        onTap: () {
                          Login().deleteCookie();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => false);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.exit_to_app, color: Colors.white70),
                        )),
                  ],

                  backgroundColor: Colors.blue
                      .withOpacity(0.0), //You can make this transparent
                  elevation: 0.0, //No shadow
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: AdmobBanner(
            adUnitId: AdHelper.bannerAdUnitId,
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, Map<String, dynamic>? args) {},
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
                  informacionWidget(context, data),
                  consultaWidget(context),
                ],
              ),
            ),
          ),
        );
      }),
    ],
  );
}

Container consultaWidget(BuildContext context) {
  return Container(
    color: Colors.grey.shade200,
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Center(
        child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            margin: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 45.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Consulta",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
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
                  _botonCalificaciones(context),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  _botonCalendario(context),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ))),
  );
}

ElevatedButton _botonCalificaciones(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.green.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10.0,
    ),
    onPressed: () {
      Navigator.pushNamed(context, '/grades');
    },
    child: const ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.school,
          size: 35,
        ),
      ),
      dense: true,
      contentPadding: EdgeInsets.all(0.0),
      horizontalTitleGap: 20.0,
      visualDensity: VisualDensity(horizontal: 0, vertical: -1),
      title: Text(
        'Calificaciones',
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        'Consulta por cuatrimestre.',
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.white70,
        ),
      ),
    ),
  );
}

ElevatedButton _botonCalendario(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.green.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10.0,
    ),
    onPressed: () {
      Navigator.pushNamed(context, '/calendario');
    },
    child: const ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.calendar_today,
          size: 35,
        ),
      ),
      dense: true,
      contentPadding: EdgeInsets.all(0.0),
      horizontalTitleGap: 20.0,
      visualDensity: VisualDensity(horizontal: 0, vertical: -1),
      title: Text(
        'Calendario',
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        'Calendario escolar.',
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.white70,
        ),
      ),
    ),
  );
}

Container informacionWidget(BuildContext context, data) {
  return Container(
    width: MediaQuery.of(context).size.width,
    //height: MediaQuery.of(context).size.height * 0.46,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.red,
        style: BorderStyle.none,
      ),
      gradient: LinearGradient(
        colors: [
          Colors.green.shade600,
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
      const SizedBox(
        height: 10.0,
      ),
      Text(
          '${data["estudiante"]["datos"]["nombre"]} ${data["estudiante"]["datos"]["apellido_paterno"]} ${data["estudiante"]["datos"]["apellido_materno"]}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          )),
      const SizedBox(
        height: 10.0,
      ),
      const Text(
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
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // No border
          border: Border.all(
            style: BorderStyle.none,
          ),

          gradient: LinearGradient(
            colors: [
              Colors.green.shade600,
              Colors.green.shade700,
              Colors.green.shade800,
            ],
          ),
        ),
        child: Card(
            margin: const EdgeInsets.only(
                top: 0.0, bottom: 10.0, left: 0.0, right: 0.0),
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Matrícula',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '${data["estudiante"]["datos"]["matricula"]}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                      Column(children: [
                        Text(
                          'Grupo',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${data["estudiante"]["datos"]["grupo"]}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ]),
                      Column(
                        children: [
                          Text(
                            'Cuatrimestre',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '${data["estudiante"]["datos"]["cuatrimiestre"]}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Promedio General',
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            child: Text(
                              '${data["estudiante"]["datos"]["promedio_general"]}',
                              //'9.6',
                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Estatus',
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            child: Text(
                              '${data["estudiante"]["datos"]["situacion_academica"]}',
                              //'9.6',
                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Carrera',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              '${data["estudiante"]["datos"]["carrera"]}',
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    ]),
  );
}
