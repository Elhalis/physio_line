import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_page.dart';
import 'package:physio_line/src/presentation/widget/text/bullet_text.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model

import '../../../../../../core/constants/app_sizes.dart';
// No longer needed
import '../../../../../widget/text/text.dart';

class AssociatedImpairmentsPage extends StatelessWidget {
  final String dxName;
  final Diagnosis diagnosis;

  const AssociatedImpairmentsPage({
    super.key,
    required this.dxName,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return _buildAssociatedImpairmentsContent(context, diagnosis);
  }

  Widget _buildAssociatedImpairmentsContent(
    BuildContext context,
    Diagnosis diagnosis,
  ) {
    final assessmentsData = diagnosis.associatedImpairments.assessments;

    return BasePage(
      heading: 'Associated Impairments',
      subTitle: diagnosis.name,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Assessments Section
            if (assessmentsData.isNotEmpty) ...[
              BoldSubtitle(title: 'Assessments'),
              const SizedBox(height: AppDimensions.spacingS),
              ...assessmentsData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Fallback if no data available
            if (assessmentsData.isEmpty) ...[
              BoldSubtitle(title: 'Associated Impairments'),
              const SizedBox(height: AppDimensions.spacingS),
              BodyMediumText(
                text:
                    'No associated impairments data available for ${diagnosis.name}',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
