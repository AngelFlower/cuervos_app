import 'package:flutter/material.dart';

Widget buildActionsSection(BuildContext context, bool isDesktop) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 16),
        child: Text(
          'Acciones Rápidas',
          style: TextStyle(
            fontSize: isDesktop ? 20 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      isDesktop
          ? Row(
              children: [
                Expanded(
                  child: buildActionCard(
                    context: context,
                    icon: Icons.school,
                    title: 'Calificaciones',
                    subtitle: 'Consulta tus calificaciones por cuatrimestre',
                    route: '/grades',
                    gradient: [Colors.green.shade600, Colors.green.shade700],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: buildActionCard(
                    context: context,
                    icon: Icons.calendar_today,
                    title: 'Calendario',
                    subtitle: 'Consulta el calendario escolar completo',
                    route: '/calendario',
                    gradient: [Colors.blue.shade600, Colors.blue.shade700],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                buildActionCard(
                  context: context,
                  icon: Icons.school,
                  title: 'Calificaciones',
                  subtitle: 'Consulta tus calificaciones por cuatrimestre',
                  route: '/grades',
                  gradient: [Colors.green.shade600, Colors.green.shade700],
                ),
                const SizedBox(height: 12),
                buildActionCard(
                  context: context,
                  icon: Icons.calendar_today,
                  title: 'Calendario',
                  subtitle: 'Consulta el calendario escolar completo',
                  route: '/calendario',
                  gradient: [Colors.blue.shade600, Colors.blue.shade700],
                ),
              ],
            ),
    ],
  );
}

Widget buildActionCard({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String subtitle,
  required String route,
  required List<Color> gradient,
}) {
  return Card(
    elevation: 3,
    shadowColor: Colors.black.withOpacity(0.08),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradient),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                size: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.8),
              size: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
