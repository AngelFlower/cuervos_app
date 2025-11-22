import 'package:flutter/material.dart';
import 'views/app_info_card.dart';
import 'views/section_header.dart';
import 'views/developer_card.dart';
import 'views/tech_stack.dart';
import 'views/about_footer.dart';

const String _urlAngel = 'https://github.com/AngelFlower';
const String _urlAngelImage = 'https://avatars.githubusercontent.com/u/29155062?v=4';
const String _urlErick = 'https://github.com/ErickMUOSD';
const String _urlErickImage = 'https://avatars.githubusercontent.com/u/54825317?v=4';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade800),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade600, Colors.green.shade700],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.info, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            const Text(
              'Acerca de',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 1024;
          final isTablet = constraints.maxWidth > 600;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 1000 : double.infinity,
                ),
                child: Padding(
                  padding: EdgeInsets.all(isDesktop ? 32 : (isTablet ? 24 : 20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const AppInfoCard(),
                      const SizedBox(height: 32),
                      const SectionHeader(
                        icon: Icons.people_outline,
                        title: 'Equipo de Desarrollo',
                      ),
                      const SizedBox(height: 20),
                      isDesktop
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: DeveloperCard(
                                    nombre: 'Angel Flores',
                                    puesto: 'Desarrollador Principal',
                                    url: _urlAngel,
                                    urlImage: _urlAngelImage,
                                    isPrincipal: true,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: DeveloperCard(
                                    nombre: 'Erick Emiliano',
                                    puesto: 'Colaborador',
                                    url: _urlErick,
                                    urlImage: _urlErickImage,
                                    isPrincipal: false,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                DeveloperCard(
                                  nombre: 'Angel Flores',
                                  puesto: 'Desarrollador Principal',
                                  url: _urlAngel,
                                  urlImage: _urlAngelImage,
                                  isPrincipal: true,
                                ),
                                const SizedBox(height: 16),
                                DeveloperCard(
                                  nombre: 'Erick Emiliano',
                                  puesto: 'Colaborador',
                                  url: _urlErick,
                                  urlImage: _urlErickImage,
                                  isPrincipal: false,
                                ),
                              ],
                            ),
                      const SizedBox(height: 32),
                      const TechStack(),
                      const SizedBox(height: 32),
                      const AboutFooter(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
