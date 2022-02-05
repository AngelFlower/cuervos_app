import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../libs/fade_animation.dart';
import '../../saiiut/login.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController matriculaController = TextEditingController();

  TextEditingController contrasenaController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.68,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              // color: Colors.red,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 13),
              child: FadeAnimation(
                1,
                Text(
                  "Inicia sesión",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
              height: 30.0,
            ),
            FadeAnimation(
              2,
              _botonIniciarSesion(),
            ),
            FadeAnimation(
              2,
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 15.0, bottom: 40),
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
                  maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
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
            onPrimary: Colors.transparent,
            elevation: 2,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Center(
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.green.shade600,
                  Colors.green.shade700,
                  Colors.green.shade800,
                ]),
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                'Enviar',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
