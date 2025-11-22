import 'package:flutter/material.dart';

class MateriaCardWidget extends StatelessWidget {
  final dynamic materia;
  final bool isDesktop;

  const MateriaCardWidget({
    Key? key,
    required this.materia,
    required this.isDesktop,
  }) : super(key: key);

  Color _getCalificacionColor(String calificacion) {
    final calificacionNum = double.tryParse(calificacion) ?? 0.0;
    if (calificacionNum == 10.0) return Colors.blue.shade700;
    if (calificacionNum >= 9.0) return Colors.green.shade700;
    if (calificacionNum >= 8.0) return Colors.teal.shade700;
    if (calificacionNum >= 7.0) return Colors.orange.shade700;
    if (calificacionNum >= 6.0) return Colors.grey.shade700;
    return Colors.red.shade700;
  }

  Widget _buildDesktopLayout(String calificacion, bool existenExtras) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: _getCalificacionColor(calificacion).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _getCalificacionColor(calificacion).withOpacity(0.3),
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              calificacion,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _getCalificacionColor(calificacion),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      materia['nombre'],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  if (existenExtras)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warning_amber, size: 14, color: Colors.orange.shade700),
                          const SizedBox(width: 4),
                          Text(
                            'Extraordinario',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.person_outline, size: 14, color: Colors.grey.shade500),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      materia['profesor'],
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey.shade400,
          size: 18,
        ),
      ],
    );
  }

  Widget _buildMobileLayout(String calificacion, bool existenExtras) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: _getCalificacionColor(calificacion).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _getCalificacionColor(calificacion).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  calificacion,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _getCalificacionColor(calificacion),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    materia['nombre'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.person_outline, size: 12, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          materia['profesor'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade400,
              size: 16,
            ),
          ],
        ),
        if (existenExtras) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning_amber, size: 16, color: Colors.orange.shade700),
                const SizedBox(width: 6),
                Text(
                  'Tiene calificación extraordinaria',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final calificacion = materia['calificacion'];
    final existenExtras = materia['existenExtras'] == true;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/detalleMateria', arguments: {
              'materia': materia['nombre'],
              'parciales': materia['parciales'],
              'extras': materia['extras'],
              'existenExtras': materia['existenExtras'],
            });
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
              border: existenExtras ? Border.all(color: Colors.orange.shade200, width: 2) : null,
            ),
            child: isDesktop
                ? _buildDesktopLayout(calificacion, existenExtras)
                : _buildMobileLayout(calificacion, existenExtras),
          ),
        ),
      ),
    );
  }
}
