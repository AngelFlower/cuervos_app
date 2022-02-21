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
                appBar: AppBar(
                  backgroundColor: Colors.green.shade500,
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
                ),
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.share),
                  backgroundColor: Colors.green.shade600,
                  onPressed: () async {
                    final imageurl = snapshot.data.toString();
                    final uri = Uri.parse(imageurl);
                    final response = await http.get(uri);
                    final bytes = response.bodyBytes;
                    final temp = await getTemporaryDirectory();
                    final path = '${temp.path}/image.jpg';
                    File(path).writeAsBytesSync(bytes);
                    await Share.shareFiles([path], text: 'Image Shared');
                  },
                ),
                body: PhotoView(
                  backgroundDecoration:
                      BoxDecoration(color: Colors.grey.shade100),
                  imageProvider: NetworkImage(snapshot.data.toString()),
                ));
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
