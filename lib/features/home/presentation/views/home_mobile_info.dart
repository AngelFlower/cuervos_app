import 'package:flutter/material.dart';

Widget buildInfoCardMobile(BuildContext context, dynamic data, bool isMobile) {
  return Card(
    elevation: 8,
    shadowColor: Colors.black.withOpacity(0.1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildInfoItemMobile('Matrícula', '${data["estudiante"]["datos"]["matricula"]}'),
              buildInfoItemMobile('Grupo', '${data["estudiante"]["datos"]["grupo"]}'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildInfoItemMobile('Cuatrimestre', '${data["estudiante"]["datos"]["cuatrimiestre"]}'),
              buildInfoItemMobile('Promedio', '${data["estudiante"]["datos"]["promedio_general"]}', highlight: true),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Text(
                'Carrera',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${data["estudiante"]["datos"]["carrera"]}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildInfoItemMobile(String label, String value, {bool highlight = false}) {
  return Expanded(
    child: Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Container(
          padding: highlight ? const EdgeInsets.symmetric(horizontal: 12, vertical: 4) : null,
          decoration: highlight
              ? BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                )
              : null,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: highlight ? FontWeight.bold : FontWeight.w600,
              color: highlight ? Colors.green.shade700 : Colors.grey.shade800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
