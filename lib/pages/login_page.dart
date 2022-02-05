import 'package:cuervos_app/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:cuervos_app/libs/fade_animation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _contenedores(context));
  }

  Widget _contenedores(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.green.shade600,
        Colors.green.shade700,
        Colors.green.shade800,
      ])),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12),
              child: FadeAnimation(
                2,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Cuervos",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                    Text('Consulta tus calificaciones',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.9),
                          letterSpacing: 0.6,
                        )),
                  ],
                ),
              )),
          Flexible(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.13),
              child: const FormWidget(),
            ),
          )
        ],
      ),
    );
  }
}
