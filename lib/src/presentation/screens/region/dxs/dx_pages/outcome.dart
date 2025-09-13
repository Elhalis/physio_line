import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_page.dart';
import 'package:physio_line/src/presentation/widget/text/bullet_text.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model

import '../../../../../core/constants/app_sizes.dart';
// No longer needed
import '../../../../widget/text/text.dart';

class OutcomesPage extends StatelessWidget {
  final String
  dxName; // Keep for breadcrumb, or modify BasePage to use Diagnosis.name
  final Diagnosis diagnosis;

  const OutcomesPage({
    super.key,
    required this.dxName,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return _buildOutcomesContent(context, diagnosis);
  }

  Widget _buildOutcomesContent(BuildContext context, Diagnosis diagnosis) {
    final outcomeMeasuresData = diagnosis.outcomeMeasures;

    return BasePage(
      heading: 'Outcomes',
      subTitle: diagnosis.name,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Outcome Measures Section
            if (outcomeMeasuresData.isNotEmpty) ...[
              BoldSubtitle(title: 'Outcome Measures'),
              const SizedBox(height: AppDimensions.spacingS),
              ...outcomeMeasuresData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Fallback if no data available
            if (outcomeMeasuresData.isEmpty) ...[
              BoldSubtitle(title: 'Outcomes'),
              const SizedBox(height: AppDimensions.spacingS),
              BodyMediumText(
                text: 'No outcome measures available for ${diagnosis.name}',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
