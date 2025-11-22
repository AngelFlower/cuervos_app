import 'package:flutter/material.dart';

class CalendarFABs extends StatelessWidget {
  final VoidCallback onShare;
  final VoidCallback onHelp;
  const CalendarFABs({Key? key, required this.onShare, required this.onHelp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
          onPressed: onShare,
          backgroundColor: Colors.green.shade600,
          elevation: 4,
          icon: const Icon(Icons.share_rounded, color: Colors.white),
          label: const Text('Compartir', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 12),
        FloatingActionButton.extended(
          onPressed: onHelp,
          backgroundColor: Colors.blue.shade600,
          elevation: 4,
          icon: const Icon(Icons.info_outline, color: Colors.white),
          label: const Text('Ayuda', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
