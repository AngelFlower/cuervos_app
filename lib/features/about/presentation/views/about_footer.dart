import 'package:flutter/material.dart';

class AboutFooter extends StatelessWidget {
  const AboutFooter();

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return Card(
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.favorite, color: Colors.red.shade400, size: 24),
            const SizedBox(height: 12),
            Text(
              'Hecho por y para la comunidad UTVT',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '© $year Cuervos App',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
