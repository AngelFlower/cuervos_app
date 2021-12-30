import 'package:comment_box/comment/comment.dart';
import 'package:cuervos_app/comentarios/comentario.dart';
import 'package:cuervos_app/comentarios/obtener_comentarios.dart';
import 'package:flutter/material.dart';

class ComentariosPage extends StatefulWidget {
  ComentariosPage({Key? key}) : super(key: key);

  @override
  _ComentariosPageState createState() => _ComentariosPageState();
}

class _ComentariosPageState extends State<ComentariosPage> {
  var comentarios = <Comentario>[];

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;

    if (arguments != null) print(arguments['profesor']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Comentarios'),
            Text('${arguments['profesor']}',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade100,
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ),
      body: Center(
          child: FutureBuilder<dynamic>(
        future: ObtenerComentarios().fetchAlbum(maestro: arguments['profesor']),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return CommentBox(
              userImage:
                  "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 15.0),
                        title: Text(snapshot.data[index]['comentario']),
                        subtitle: Text(snapshot.data[index]['fecha']),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400"),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length),
              labelText: 'Escribe un comentario...',
              withBorder: false,
              errorText: 'Comment cannot be blank',
              sendButtonMethod: () {
                if (formKey.currentState!.validate()) {
                  print(commentController.text);
                  setState(() {
                    var value = {
                      'name': 'New User',
                      'pic':
                          'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                      'message': commentController.text
                    };
                    //filedata.insert(0, value);
                  });
                  commentController.clear();
                  FocusScope.of(context).unfocus();
                } else {
                  print("Not validated");
                }
              },
              formKey: formKey,
              commentController: commentController,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
