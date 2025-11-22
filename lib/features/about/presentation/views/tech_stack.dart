import 'package:flutter/material.dart';
import 'section_header.dart';

class TechStack extends StatelessWidget {
  const TechStack();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionHeader(
          icon: Icons.code,
          title: 'Tecnologías Utilizadas',
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TechChip(label: 'Flutter', color: Colors.blue),
                SizedBox(height: 12),
                TechChip(label: 'Dart', color: Colors.teal),
                SizedBox(height: 12),
                TechChip(label: 'Material Design', color: Colors.green),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TechChip extends StatelessWidget {
  final String label;
  final MaterialColor color;
  const TechChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color.shade600,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
