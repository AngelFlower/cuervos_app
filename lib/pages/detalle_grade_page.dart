import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetalleGradePage extends StatelessWidget {
  const DetalleGradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;

    // ignore: unnecessary_null_comparison
    if (arguments != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.green.shade600,
                Colors.green.shade800,
              ])),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Icon(Icons.emoji_events,
                        size: 200.0, color: Color.fromARGB(255, 241, 241, 241)),
                  )),
              Card(
                color: Colors.white.withOpacity(0.99),
                elevation: 1.0,
                margin: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SingleChildScrollView(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            'Detalle de calificaciones',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text('${arguments['materia']}',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600)),
                          const SizedBox(
                            height: 10.0,
                          ),
                          DefaultTabController(
                            length: 2,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const TabBar(
                                    labelColor: Colors.black87,
                                    indicatorColor: Colors.green,
                                    tabs: [
                                      Tab(
                                        text: 'Parciales',
                                      ),
                                      Tab(
                                        text: 'Extras',
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: TabBarView(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            _parcialWidget(
                                                context,
                                                'Parcial 1',
                                                arguments['parciales']
                                                    ['parcial1'],
                                                Colors.purple.shade50),
                                            _parcialWidget(
                                                context,
                                                'Parcial 2',
                                                arguments['parciales']
                                                    ['parcial2'],
                                                Colors.amber.shade50),
                                            _parcialWidget(
                                                context,
                                                'Parcial 3',
                                                arguments['parciales']
                                                    ['parcial3'],
                                                Colors.green.shade50),
                                          ],
                                        ),
                                        _extrasWidget(context, arguments),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      )),
                    )),
              ),
            ],
          ),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  dynamic _isEmpty(dynamic value) {
    if (value == null || value == '') {
      return '-';
    } else {
      return value;
    }
  }

  Row _extrasWidget(BuildContext context, arguments) {
    if (arguments['existenExtras'] == false) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No hay extras'),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _parcialWidget(context, 'Extra 1',
              _isEmpty(arguments['extras']['extra1']), Colors.purple.shade50),
          _parcialWidget(context, 'Extra 2',
              _isEmpty(arguments['extras']['extra2']), Colors.orange.shade50),
          _parcialWidget(context, 'Extra 3',
              _isEmpty(arguments['extras']['extra3']), Colors.green.shade50),
        ],
      );
    }
  }

  Container _parcialWidget(
      BuildContext context, String parcial, String calificacion, Color color) {
    if (calificacion == '-') {
      return Container();
    } else {
      return Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              calificacion,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              parcial,
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }
  }
}
