import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_page.dart';
import 'package:physio_line/src/presentation/widget/text/bullet_text.dart'; // Added for bullet text
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model
import 'package:physio_line/src/presentation/widget/text/text.dart'; // Added for BoldSubtitle and BodyMediumText

class DifferentialPage extends StatelessWidget {
  final String dxName;
  final Diagnosis diagnosis;

  const DifferentialPage({
    super.key,
    required this.dxName,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return _buildDifferentialContent(context, diagnosis);
  }

  Widget _buildDifferentialContent(BuildContext context, Diagnosis diagnosis) {
    final assessmentsData = diagnosis.differentialDiagnosis.assessments;

    return BasePage(
      heading: 'Differential Diagnosis',
      subTitle: diagnosis.name,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (assessmentsData.isNotEmpty) ...[
              BoldSubtitle(title: 'Assessments'),
              const SizedBox(height: 8),
              ...assessmentsData.map(
                (assessment) => BulletText(text: assessment),
              ),
              const SizedBox(height: 16),
            ],
            if (assessmentsData.isEmpty) ...[
              BoldSubtitle(title: 'Differential Diagnosis'),
              const SizedBox(height: 8),
              BodyMediumText(
                text:
                    'No differential diagnosis data available for ${diagnosis.name}',
              ),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }
}
