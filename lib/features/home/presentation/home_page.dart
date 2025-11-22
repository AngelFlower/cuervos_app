import 'package:cuervos_app/core/services/saiiut/get_data.dart';
import 'package:cuervos_app/core/services/saiiut/login.dart';
import 'package:flutter/material.dart';
import 'views/home_header.dart';
import 'views/home_academic_grid.dart';
import 'views/home_actions.dart';
import 'views/home_mobile_info.dart';
import 'widgets/donation_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<dynamic> obtenerInfo() async {
    return await GetData().obtenerDatos();
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange.shade700,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Cerrar sesión',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text(
            '¿Estás seguro que deseas cerrar sesión?',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar diálogo
                Login().deleteCookie();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login',
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: MediaQuery.of(context).size.width > 600
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
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
                    child: const Icon(Icons.school, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Portal Estudiante',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton.icon(
                  onPressed: () => Navigator.of(context).pushNamed('/about'),
                  icon: const Icon(Icons.info, size: 18),
                  label: const Text('Acerca de', style: TextStyle(fontSize: 14)),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () => _showLogoutDialog(context),
                  icon: const Icon(Icons.exit_to_app, size: 18),
                  label: const Text('Salir', style: TextStyle(fontSize: 14)),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(width: 16),
              ],
            )
          : null,
      body: FutureBuilder<dynamic>(
        future: obtenerInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _perfil(context, snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green.shade600,
              ),
            );
          }
        },
      ),
    );
  }
}

void _showLogoutDialogGlobal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange.shade700,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Cerrar sesión',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: const Text(
          '¿Estás seguro que deseas cerrar sesión?',
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancelar',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Login().deleteCookie();
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login',
                (Route<dynamic> route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Cerrar sesión',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget _perfil(BuildContext context, data) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final isDesktop = constraints.maxWidth > 1024;
      final isTablet = constraints.maxWidth > 600 && constraints.maxWidth <= 1024;

      if (isDesktop) {
        return SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildStudentHeader(context, data, true),
                    const SizedBox(height: 32),
                    buildAcademicGrid(context, data, true),
                    const SizedBox(height: 24),
                    buildActionsSection(context, true),
                    const SizedBox(height: 24),
                    const DonationCard(isDesktop: true),
                  ],
                ),
              ),
            ),
          ),
        );
      } else if (isTablet) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildStudentHeader(context, data, false),
                const SizedBox(height: 24),
                buildAcademicGrid(context, data, false),
                const SizedBox(height: 20),
                buildActionsSection(context, false),
                const SizedBox(height: 20),
                const DonationCard(isDesktop: false),
              ],
            ),
          ),
        );
      } else {
        final isMobile = constraints.maxWidth <= 600;
        final padding = isMobile ? 20.0 : 40.0;
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade600,
                      Colors.green.shade700,
                      Colors.green.shade800,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(padding, 16, padding, padding),
                    child: Column(
                      children: [
                        // Botones de acción en la parte superior
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.of(context).pushNamed('/about'),
                              icon: const Icon(Icons.info, color: Colors.white),
                              tooltip: 'Acerca de',
                            ),
                            IconButton(
                              onPressed: () => _showLogoutDialogGlobal(context),
                              icon: const Icon(Icons.exit_to_app, color: Colors.white),
                              tooltip: 'Salir',
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: isMobile ? 50 : 60,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset('assets/images/cuervo_perfil.png'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '${data["estudiante"]["datos"]["nombre"]} ${data["estudiante"]["datos"]["apellido_paterno"]} ${data["estudiante"]["datos"]["apellido_materno"]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Cuervo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        buildInfoCardMobile(context, data, isMobile),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  children: [
                    buildActionCard(
                      context: context,
                      icon: Icons.school,
                      title: 'Calificaciones',
                      subtitle: 'Consulta por cuatrimestre',
                      route: '/grades',
                      gradient: [Colors.green.shade600, Colors.green.shade700],
                    ),
                    const SizedBox(height: 16),
                    buildActionCard(
                      context: context,
                      icon: Icons.calendar_today,
                      title: 'Calendario',
                      subtitle: 'Calendario escolar',
                      route: '/calendario',
                      gradient: [Colors.blue.shade600, Colors.blue.shade700],
                    ),
                    const SizedBox(height: 16),
                    const DonationCard(isDesktop: false),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}
