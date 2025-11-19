import 'package:flutter/material.dart';
// import 'package:admob_flutter/admob_flutter.dart';
import 'core/services/saiiut/login.dart';
import 'core/theme/theme_data.dart';
import 'core/router/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without
  // Admob.initialize();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
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
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
            routes: AppRoutes.routes,
            builder: (context, child) {
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: child,
                ),
              );
            },
          );
        } else {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
