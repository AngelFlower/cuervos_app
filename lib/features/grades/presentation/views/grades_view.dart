import 'package:flutter/material.dart';
import '../widgets/cuatrimestre_card_widget.dart';

class GradesView extends StatelessWidget {
  final dynamic data;

  const GradesView({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1024;
        final isTablet = constraints.maxWidth > 600;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 1200 : double.infinity,
            ),
            child: ListView.builder(
              padding: EdgeInsets.all(isDesktop ? 32 : (isTablet ? 24 : 10)),
              itemCount: data['estudiante']['cuatrimestres'].length,
              itemBuilder: (BuildContext context, int index) {
                var longitud = data['estudiante']['cuatrimestres'].length;
                var cuatrimestre = data['estudiante']['cuatrimestres'][(longitud - index).toString()];
                var materias = cuatrimestre['materias'];
                var expanded = index == 0;

                return CuatrimestreCardWidget(
                  cuatrimestre: cuatrimestre,
                  materias: materias,
                  expanded: expanded,
                  isDesktop: isDesktop,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
