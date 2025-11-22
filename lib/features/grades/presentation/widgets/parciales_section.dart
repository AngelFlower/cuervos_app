import 'package:flutter/material.dart';
import 'score_card.dart';

class ParcialesSection extends StatelessWidget {
  final dynamic parciales;
  final bool isDesktop;

  const ParcialesSection({
    Key? key,
    required this.parciales,
    required this.isDesktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.assessment_outlined,
                  color: Colors.green.shade700,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Calificaciones Parciales',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ScoreCard(
                title: 'Parcial 1',
                score: parciales['parcial1'],
                color: Colors.purple,
                icon: Icons.looks_one_outlined,
                isDesktop: isDesktop,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ScoreCard(
                title: 'Parcial 2',
                score: parciales['parcial2'],
                color: Colors.blue,
                icon: Icons.looks_two_outlined,
                isDesktop: isDesktop,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ScoreCard(
                title: 'Parcial 3',
                score: parciales['parcial3'],
                color: Colors.green,
                icon: Icons.looks_3_outlined,
                isDesktop: isDesktop,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
