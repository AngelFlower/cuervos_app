import 'package:cuervos_app/pages/grades_page.dart';
import 'package:cuervos_app/saiiut/get_data.dart';
import 'package:cuervos_app/saiiut/login.dart';
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
  Future<dynamic> obtenerCookie() async {
    var cookie = await Login().getCookie();
    print('cookie $cookie');
    return await Login().getCookie() != null;
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return FutureBuilder(
        future: obtenerCookie(),
        builder: (context, snapshot) {
          print('builder');
          print(snapshot.data);
          if (snapshot.hasData) {
            print('esto es del login, etc ${snapshot.data}');
            var initialRoute = '/login';
            if (snapshot.data != false) {
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
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
