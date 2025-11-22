import 'package:flutter/material.dart';
import '../widgets/grade_detail_app_bar.dart';
import '../widgets/grade_detail_header.dart';
import '../widgets/parciales_section.dart';
import '../widgets/extras_section.dart';

class GradeDetailView extends StatelessWidget {
  final Map arguments;

  const GradeDetailView({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1024;
        final isTablet = constraints.maxWidth > 600;

        return CustomScrollView(
          slivers: [
            GradeDetailAppBar(
              arguments: arguments,
              isDesktop: isDesktop,
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isDesktop ? 1000 : double.infinity,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(isDesktop ? 32 : (isTablet ? 24 : 20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const GradeDetailHeader(),
                        const SizedBox(height: 32),
                        ParcialesSection(
                          parciales: arguments['parciales'],
                          isDesktop: isDesktop,
                        ),
                        const SizedBox(height: 24),
                        ExtrasSection(
                          arguments: arguments,
                          isDesktop: isDesktop,
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
