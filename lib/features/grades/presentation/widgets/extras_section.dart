import 'package:flutter/material.dart';
import 'score_card.dart';
import 'empty_extras_state.dart';

class ExtrasSection extends StatelessWidget {
  final Map arguments;
  final bool isDesktop;

  const ExtrasSection({
    Key? key,
    required this.arguments,
    required this.isDesktop,
  }) : super(key: key);

  String _getValue(dynamic value) {
    if (value == null || value == '') {
      return '-';
    } else {
      return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final existenExtras = arguments['existenExtras'] == true;

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
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.warning_amber_outlined,
                  color: Colors.orange.shade700,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Calificaciones Extraordinarias',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (!existenExtras)
          const EmptyExtrasState()
        else
          Row(
            children: [
              Expanded(
                child: ScoreCard(
                  title: 'Extra 1',
                  score: _getValue(arguments['extras']['extra1']),
                  color: Colors.orange,
                  icon: Icons.looks_one_outlined,
                  isDesktop: isDesktop,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ScoreCard(
                  title: 'Extra 2',
                  score: _getValue(arguments['extras']['extra2']),
                  color: Colors.red,
                  icon: Icons.looks_two_outlined,
                  isDesktop: isDesktop,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ScoreCard(
                  title: 'Extra 3',
                  score: _getValue(arguments['extras']['extra3']),
                  color: Colors.deepOrange,
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
