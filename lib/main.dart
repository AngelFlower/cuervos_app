import 'package:cuervos_app/pages/grades_page.dart';
import 'package:cuervos_app/saiiut/get_data.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() async => runApp(App());

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Future<dynamic> obtenerInfo() async {
    return await getData().obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: obtenerInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print('esto es del login, etc ${snapshot.data}');
            var initialRoute = '/login';
            if (snapshot.hasData != false) {
              initialRoute = '/home';
            }
            print('ruta inicial $initialRoute');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: initialRoute,
              routes: {
                '/login': (BuildContext context) => LoginPage(),
                '/home': (BuildContext context) => HomePage(),
                '/grades': (BuildContext context) => GradesPage(),
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
