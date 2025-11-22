import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final String title;
  final String score;
  final MaterialColor color;
  final IconData icon;
  final bool isDesktop;

  const ScoreCard({
    Key? key,
    required this.title,
    required this.score,
    required this.color,
    required this.icon,
    required this.isDesktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (score == '-' || score.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      elevation: 3,
      shadowColor: color.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isDesktop ? 16 : 12),
      ),
      child: Container(
        padding: EdgeInsets.all(isDesktop ? 20 : 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isDesktop ? 16 : 12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.shade50,
              color.shade100,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(isDesktop ? 10 : 6),
              decoration: BoxDecoration(
                color: color.shade100,
                borderRadius: BorderRadius.circular(isDesktop ? 12 : 8),
                border: Border.all(
                  color: color.shade200,
                  width: 2,
                ),
              ),
              child: Icon(
                icon,
                color: color.shade700,
                size: isDesktop ? 28 : 20,
              ),
            ),
            SizedBox(height: isDesktop ? 12 : 8),
            Text(
              score,
              style: TextStyle(
                fontSize: isDesktop ? 28 : 22,
                fontWeight: FontWeight.bold,
                color: color.shade800,
              ),
            ),
            SizedBox(height: isDesktop ? 6 : 4),
            Text(
              title,
              style: TextStyle(
                fontSize: isDesktop ? 13 : 11,
                fontWeight: FontWeight.w600,
                color: color.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
