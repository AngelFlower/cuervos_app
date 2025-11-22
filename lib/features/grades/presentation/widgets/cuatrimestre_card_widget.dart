import 'package:flutter/material.dart';
import 'materia_card_widget.dart';

class CuatrimestreCardWidget extends StatelessWidget {
  final dynamic cuatrimestre;
  final dynamic materias;
  final bool expanded;
  final bool isDesktop;

  const CuatrimestreCardWidget({
    Key? key,
    required this.cuatrimestre,
    required this.materias,
    required this.expanded,
    required this.isDesktop,
  }) : super(key: key);

  Color _getCuatrimestreColor(int numero) {
    final colors = [
      Colors.green.shade600,
      Colors.blue.shade600,
      Colors.purple.shade600,
      Colors.orange.shade600,
      Colors.teal.shade600,
      Colors.pink.shade600,
      Colors.indigo.shade600,
      Colors.amber.shade700,
      Colors.cyan.shade600,
      Colors.deepOrange.shade600,
      Colors.lightGreen.shade700,
      Colors.deepPurple.shade600,
      Colors.lime.shade700,
      Colors.red.shade600,
      Colors.blueGrey.shade600,
      Colors.brown.shade600,
      Colors.lightBlue.shade700,
      Colors.yellow.shade800,
      Colors.pinkAccent.shade700,
      Colors.indigoAccent.shade700,
    ];
    return colors[(numero - 1) % colors.length];
  }

  Color _getPromedioColor(String promedio) {
    final promedioNum = double.tryParse(promedio) ?? 0.0;
    if (promedioNum >= 9.5) return Colors.blue.shade600;
    if (promedioNum >= 9.0) return Colors.green.shade600;
    if (promedioNum >= 8.0) return Colors.teal.shade600;
    if (promedioNum >= 7.0) return Colors.orange.shade600;
    return Colors.red.shade600;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> materiasWidgets = [];
    for (var j = 0; j < materias.length; j++) {
      materiasWidgets.add(
        MateriaCardWidget(
          materia: materias['${j + 1}'],
          isDesktop: isDesktop,
        ),
      );
    }

    final cuatrimestreNum =
        int.tryParse(cuatrimestre['nombre'].toString().replaceAll(RegExp(r'[^0-9]'), '').substring(0, 1)) ?? 0;
    final cardColor = _getCuatrimestreColor(cuatrimestreNum);

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ExpansionTile(
            initiallyExpanded: expanded,
            tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            childrenPadding: const EdgeInsets.only(bottom: 12),
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            iconColor: cardColor,
            collapsedIconColor: Colors.grey.shade600,
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [cardColor, cardColor.withOpacity(0.8)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cuatrimestre['nombre'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${materias.length} materias',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: _getPromedioColor(cuatrimestre['promedio']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _getPromedioColor(cuatrimestre['promedio']).withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: _getPromedioColor(cuatrimestre['promedio']),
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        cuatrimestre['promedio'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: _getPromedioColor(cuatrimestre['promedio']),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: materiasWidgets,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
