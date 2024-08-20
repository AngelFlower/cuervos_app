import 'package:flutter/material.dart';
// import 'package:admob_flutter/admob_flutter.dart';
import 'pages/detalle_grade_page.dart';
import 'saiiut/login.dart';
import 'pages/about_pasge.dart';
import 'pages/calendario_page.dart';
import 'pages/login_page.dart';
import 'pages/grades_page.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without
  // Admob.initialize();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

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
              themeMode: ThemeMode.light,
              theme: ThemeData(
                useMaterial3: true,
                primarySwatch: Colors.green,
                primaryColor: Colors.green.shade600,
                hintColor: Colors.grey.shade400,
                secondaryHeaderColor: Colors.green.shade500,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors
                      .green, // Color base para generar el esquema de colores
                ),
                fontFamily: 'Roboto',
                buttonTheme: ButtonThemeData(
                  buttonColor: Colors.green.shade500,
                  textTheme: ButtonTextTheme.primary,
                ),
                appBarTheme: const AppBarTheme(
                    foregroundColor: Color.fromARGB(255, 241, 241, 241)),
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: initialRoute,
              routes: {
                '/login': (BuildContext context) => const LoginPage(),
                '/home': (BuildContext context) => const HomePage(),
                '/grades': (BuildContext context) => const GradesPage(),
                '/calendario': (BuildContext context) => const CalendarioPage(),
                '/detalleMateria': (BuildContext context) =>
                    const DetalleGradePage(),
                '/about': (BuildContext context) => const AboutPage(),
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
