import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const String _urlAngel = 'https://github.com/AngelFlower';
const String _urlAngelImage =
    'https://avatars.githubusercontent.com/u/29155062?v=4';
const String _urlErick = 'https://github.com/ErickMUOSD';
const String _urlErickImage =
    'https://avatars.githubusercontent.com/u/54825317?v=4';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Acerca de',
            style: TextStyle(fontWeight: FontWeight.w400)),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Desarrolladores',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade800),
            ),
            const SizedBox(height: 20),
            // image avatar and name
            _desarrolladorWidget('Angel Flores', 'Desarrollador principal',
                _urlAngel, _urlAngelImage),
            const SizedBox(height: 20),
            _desarrolladorWidget(
                'Erick Emiliano', 'Colaborador', _urlErick, _urlErickImage),
          ],
        ),
      ),
    );
  }

  Row _desarrolladorWidget(nombre, puesto, url, urlImage) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(urlImage),
          radius: 40,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey.shade800),
              ),
              const SizedBox(height: 4),
              Text(
                puesto,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey.shade700),
              ),
              const SizedBox(height: 3),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.black54,
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () async {
                    await _launchURL(url);
                  },
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    FaIcon(FontAwesomeIcons.github, size: 20),
                    SizedBox(width: 8),
                    Text('Github'),
                  ]))
            ],
          ),
        ),
      ],
    );
  }
}

Future<void> _launchURL(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}
