import 'package:flutter/material.dart';

Widget buildAcademicGrid(BuildContext context, dynamic data, bool isDesktop) {
  final crossAxisCount = isDesktop ? 4 : 2;

  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: crossAxisCount,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    childAspectRatio: isDesktop ? 1.8 : 1.5,
    children: [
      buildInfoCard(
        'Matrícula',
        '${data["estudiante"]["datos"]["matricula"]}',
        Icons.badge,
        Colors.blue,
      ),
      buildInfoCard(
        'Grupo',
        '${data["estudiante"]["datos"]["grupo"]}',
        Icons.group,
        Colors.purple,
      ),
      buildInfoCard(
        'Cuatrimestre',
        '${data["estudiante"]["datos"]["cuatrimiestre"]}',
        Icons.calendar_today,
        Colors.orange,
      ),
      buildInfoCard(
        'Promedio',
        '${data["estudiante"]["datos"]["promedio_general"]}',
        Icons.star,
        Colors.green,
        highlight: true,
      ),
    ],
  );
}

Widget buildInfoCard(
  String label,
  String value,
  IconData icon,
  MaterialColor color, {
  bool highlight = false,
}) {
  return Card(
    elevation: highlight ? 4 : 2,
    shadowColor: highlight ? color.shade200 : Colors.black.withOpacity(0.05),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: highlight
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.shade50, color.shade100],
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color.shade700,
              size: 24,
            ),
          ),
          const Spacer(),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: highlight ? color.shade800 : Colors.grey.shade800,
            ),
          ),
        ],
      ),
    ),
  );
}
