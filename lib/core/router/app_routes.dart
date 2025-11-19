import 'package:flutter/material.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/grades/presentation/grades_page.dart';
import '../../features/calendar/presentation/calendario_page.dart';
import '../../features/grades/presentation/detalle_grade_page.dart';
import '../../features/about/presentation/about_pasge.dart';

abstract class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
        '/login': (BuildContext context) => const LoginPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/grades': (BuildContext context) => const GradesPage(),
        '/calendario': (BuildContext context) => const CalendarioPage(),
        '/detalleMateria': (BuildContext context) => const DetalleGradePage(),
        '/about': (BuildContext context) => const AboutPage(),
      };
}
