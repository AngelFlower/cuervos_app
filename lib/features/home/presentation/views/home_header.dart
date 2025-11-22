import 'package:flutter/material.dart';

Widget buildStudentHeader(BuildContext context, dynamic data, bool isDesktop) {
  return Card(
    elevation: 2,
    shadowColor: Colors.black.withOpacity(0.05),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green.shade600,
            Colors.green.shade700,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(isDesktop ? 32 : 24),
      child: Row(
        children: [
          // Avatar
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: CircleAvatar(
              radius: isDesktop ? 55 : 45,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/images/cuervo_perfil.png'),
              ),
            ),
          ),
          SizedBox(width: isDesktop ? 32 : 20),

          // Información del estudiante
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data["estudiante"]["datos"]["nombre"]} ${data["estudiante"]["datos"]["apellido_paterno"]} ${data["estudiante"]["datos"]["apellido_materno"]}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isDesktop ? 24 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${data["estudiante"]["datos"]["carrera"]}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: isDesktop ? 16 : 14,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    buildChip('Cuervo', Icons.badge),
                    buildChip('${data["estudiante"]["datos"]["situacion_academica"]}', Icons.verified),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildChip(String label, IconData icon) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white.withOpacity(0.3)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
