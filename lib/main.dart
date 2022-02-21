import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'pages/detalle_grade_page.dart';
import 'saiiut/login.dart';
import 'pages/about_pasge.dart';
import 'pages/calendario_page.dart';
import 'pages/login_page.dart';
import 'pages/grades_page.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids.
  Admob.initialize();
  runApp(App());
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Future<dynamic> obtenerCookie() async {
    return await Login().getCookie() != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: obtenerCookie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var initialRoute = '/login';
            if (snapshot.data != false) {
              initialRoute = '/home';
            }
            return MaterialApp(
              darkTheme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              initialRoute: initialRoute,
              routes: {
                '/login': (BuildContext context) => LoginPage(),
                '/home': (BuildContext context) => HomePage(),
                '/grades': (BuildContext context) => GradesPage(),
                '/calendario': (BuildContext context) => const CalendarioPage(),
                '/detalleMateria': (BuildContext context) =>
                    const DetalleGradePage(),
                '/about': (BuildContext context) => const AboutPage(),
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
