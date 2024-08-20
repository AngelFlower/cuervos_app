import 'dart:io';

import 'package:cuervos_app/utvt/calendario_escolar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class CalendarioPage extends StatelessWidget {
  const CalendarioPage({Key? key}) : super(key: key);

  Future<String> get _calendarioEscolar async {
    return await CalendarioEscolar().obtenerCalendario();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _calendarioEscolar,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: getAppBarCalendar(context),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.green.shade600,
                  onPressed: () async {
                    final imageurl = snapshot.data.toString();
                    final uri = Uri.parse(imageurl);
                    final response = await http.get(uri);
                    final bytes = response.bodyBytes;
                    final temp = await getTemporaryDirectory();
                    final path = '${temp.path}/image.jpg';
                    File(path).writeAsBytesSync(bytes);
                    await Share.shareXFiles([XFile(path)],
                        text: 'Imagen del calendario escolar');
                  },
                  child: const Icon(Icons.share, color: Colors.white),
                ),
                body: PhotoView(
                  backgroundDecoration:
                      BoxDecoration(color: Colors.grey.shade100),
                  imageProvider: NetworkImage(snapshot.data.toString()),
                ));
          } else {
            return Scaffold(
              appBar: getAppBarCalendar(context),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today,
                            size: 50, color: Colors.grey.shade400),
                        const SizedBox(height: 20),
                        const LinearProgressIndicator(),
                        const SizedBox(
                            height:
                                20), // Espacio entre el indicador y el texto
                        const Text('Cargando, por favor espere...'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }

  AppBar getAppBarCalendar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green.shade700,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Calendario Escolar',
              style: TextStyle(fontWeight: FontWeight.w400)),
          Text(
            'Puedes utilizar gestos',
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade100,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
