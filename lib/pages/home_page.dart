import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _fondoApp(),
      ],
    ));
  }

  Widget _contenido() {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          _titulos(),
        ],
      ),
    ));
  }

  Widget _titulos() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Classify transaction',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('Classify this transaction into a particular category',
              style: TextStyle(color: Colors.white, fontSize: 18.0))
        ],
      ),
    );
  }

  Widget _fondoApp() {
    final cajaRosada = Transform.rotate(
      angle: -3.14 / 4.5,
      child: Container(
        height: 260.0,
        width: 260.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(85.0),
          color: Colors.pink,
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(42, 157, 143, 1.0),
            Color.fromRGBO(87, 107, 104, 1.0)
          ]),
        ),
      ),
    );

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        ),
        Positioned(top: -100, right: 0, child: cajaRosada)
      ],
    );
  }
}
