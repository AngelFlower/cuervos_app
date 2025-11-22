import 'package:flutter/material.dart';
import 'views/grade_detail_view.dart';

class DetalleGradePage extends StatelessWidget {
  const DetalleGradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: GradeDetailView(arguments: arguments),
    );
  }
}
