import 'package:cuervos_app/saiiut/login.dart';
import 'package:flutter/material.dart';
import 'package:cuervos_app/libs/fade_animation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController matriculaController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  final _form = GlobalKey<FormState>();

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
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12),
              child: FadeAnimation(
                2,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
          Expanded(
              child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
            child: _formulario(),
          ))
        ],
      ),
    );
  }

  Widget _formulario() {
    return SingleChildScrollView(
      // ignore: sized_box_for_whitespace
      child: Container(
        height: MediaQuery.of(context).size.height * 0.68,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 32,
            ),
            Container(
                // color: Colors.red,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 13),
                child: const FadeAnimation(
                  1,
                  Text(
                    "Inicia sesión",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
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
                  const SizedBox(
                    height: 5,
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
              height: 40.0,
            ),
            FadeAnimation(
              2,
              _botonIniciarSesion(),
            ),
            const Spacer(),
            FadeAnimation(
              2,
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 40),
                  child: const Text(
                    "No almacenamos ninguna información",
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputMatricula() {
    return Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade600, width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.green.shade800,
                  blurRadius: 2,
                  offset: const Offset(1, 1))
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
                    if (!(text!.length > 5)) {
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
                      label: const Text("Matrícula",
                          style: TextStyle(fontSize: 15)),
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
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade600, width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.green.shade800,
                  blurRadius: 2,
                  offset: const Offset(1, 1)),
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
                    if (text!.isEmpty) {
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
                      label: const Text("Contraseña",
                          style: TextStyle(fontSize: 15)),
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
        if (_form.currentState!.validate()) {
          Login().login(
              context: context,
              matricula: matriculaController.text.toString(),
              contrasena: contrasenaController.text.toString());
        }

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
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
