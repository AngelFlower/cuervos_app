import 'package:flutter/material.dart';
import 'package:cuervos_app/libs/fade_animation.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _contenedores());
  }

  Widget _contenedores() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.green.shade700,
            Colors.green.shade800,
          ])),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 80),
              child: const FadeAnimation(
                2,
                Text(
                  "Cuervos",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
              )),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            margin: const EdgeInsets.only(top: 55),
            child: _formulario(),
          ))
        ],
      ),
    );
  }

  Widget _formulario() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 37,
          ),
          Container(
              // color: Colors.red,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 15),
              child: const FadeAnimation(
                1,
                Text(
                  "Inicia sesión",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              )),
          FadeAnimation(
            1,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _inputCorreo(),
            ),
          ),
          FadeAnimation(
              1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _inputContrasena(),
              )),
          const SizedBox(
            height: 20,
          ),
          FadeAnimation(
            2,
            _botonIniciarSesion(),
          ),
          FadeAnimation(
            2,
            Container(
                width: double.infinity,
                height: 70,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Más información sobre esta App",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                )),
          ),
        ],
      ),
    );
  }

  Widget _inputCorreo() {
    return Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade600, width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.green.shade800,
                  blurRadius: 2,
                  offset: Offset(1, 1))
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.email_outlined),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  cursorColor: Colors.green.shade600,
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green.shade600),
                    label: Text("Matrícula"),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _inputContrasena() {
    return Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade600, width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.green.shade800,
                  blurRadius: 2,
                  offset: Offset(1, 1)),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.password_outlined),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green.shade600),
                    label: Text("Contraseña"),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _botonIniciarSesion() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.greenAccent,
          shadowColor: Colors.green,
          elevation: 5,
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.green.shade700,
              Colors.green.shade800,
            ]),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: 250.00,
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            'Enviar',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
