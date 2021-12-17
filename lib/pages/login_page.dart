import 'package:cuervos_app/pages/grades_page.dart';
import 'package:cuervos_app/saiiut/login.dart';
import 'package:flutter/material.dart';
import 'package:cuervos_app/libs/fade_animation.dart';

import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController matriculaController = new TextEditingController();
  TextEditingController contrasenaController = new TextEditingController();
  final _form = GlobalKey<FormState>();

  bool _saveForm() {
    final isValid = _form.currentState!.validate();
    print(isValid);
    if (!isValid) {
      return false;
    }
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _contenedores());
  }

  Widget _contenedores() {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
              margin: const EdgeInsets.only(top: 90),
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
            height: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            margin: const EdgeInsets.only(top: 70),
            child: _formulario(),
          ))
        ],
      ),
    );
  }

  Widget _formulario() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Form(
            key: _form,
            child: Column(
              children: [
                FadeAnimation(
                  1,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _inputMatricula(),
                  ),
                ),
                FadeAnimation(
                    1,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _inputContrasena(),
                    )),
              ],
            ),
          ),
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

  Widget _inputMatricula() {
    return Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
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
                margin: const EdgeInsets.only(left: 10, top: 6),
                child: TextFormField(
                  controller: matriculaController,
                  validator: (text) {
                    if (!(matriculaController.text.length > 5)) {
                      return "Matrícula demasiado corta";
                    }
                    return null;
                  },
                  cursorColor: Colors.green.shade600,
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.green.shade600),
                      label: const Text("Matrícula"),
                      border: InputBorder.none,
                      focusedErrorBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
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
                margin: const EdgeInsets.only(left: 10, top: 5),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: contrasenaController,
                  validator: (text) {
                    if (contrasenaController.text.isEmpty) {
                      return "La contraseña no puede estar vacia";
                    }
                    return null;
                  },
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.green.shade600),
                      label: const Text("Contraseña"),
                      border: InputBorder.none,
                      focusedErrorBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _botonIniciarSesion() {
    return ElevatedButton(
      onPressed: () {
        //Navigator.push(
        //    context, MaterialPageRoute(builder: (context) => GradesPage()));

        Login().login(
            context: context,
            matricula: matriculaController.text.toString(),
            contrasena: contrasenaController.text.toString());
        //Navigator.pushNamed(context, '/home');
      },
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
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
