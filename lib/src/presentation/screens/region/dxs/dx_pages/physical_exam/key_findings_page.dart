import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_page.dart';
import 'package:physio_line/src/presentation/widget/text/bullet_text.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model

import '../../../../../../core/constants/app_sizes.dart';
// No longer needed
import '../../../../../widget/text/text.dart';

class KeyFindingsPage extends StatelessWidget {
  final String dxName;
  final Diagnosis diagnosis;

  const KeyFindingsPage({
    super.key,
    required this.dxName,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return _buildKeyFindingsContent(context, diagnosis);
  }

  Widget _buildKeyFindingsContent(BuildContext context, Diagnosis diagnosis) {
    final testsData = diagnosis.physicalExam.keyFindings.tests;
    final observationAndPalpationData =
        diagnosis.physicalExam.keyFindings.observationAndPalpation;
    final rangeOfMotionData = diagnosis.physicalExam.keyFindings.rangeOfMotion;
    final irritabilityData = diagnosis.physicalExam.keyFindings.irritability;

    return BasePage(
      heading: 'Key Findings',
      subTitle: diagnosis.name,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tests Section
            if (testsData.isNotEmpty) ...[
              BoldSubtitle(title: 'Tests'),
              const SizedBox(height: AppDimensions.spacingS),
              ...testsData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Observation and Palpation Section
            if (observationAndPalpationData.isNotEmpty) ...[
              BoldSubtitle(title: 'Observation and Palpation'),
              const SizedBox(height: AppDimensions.spacingS),
              ...observationAndPalpationData.map(
                (text) => BulletText(text: text),
              ),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Range of Motion Section
            if (rangeOfMotionData.isNotEmpty) ...[
              BoldSubtitle(title: 'Range of Motion'),
              const SizedBox(height: AppDimensions.spacingS),
              ...rangeOfMotionData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Irritability Section
            if (irritabilityData.isNotEmpty) ...[
              BoldSubtitle(title: 'Irritability'),
              const SizedBox(height: AppDimensions.spacingS),
              ...irritabilityData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Fallback if no data available
            if (testsData.isEmpty &&
                observationAndPalpationData.isEmpty &&
                rangeOfMotionData.isEmpty &&
                irritabilityData.isEmpty) ...[
              BoldSubtitle(title: 'Key Findings'),
              const SizedBox(height: AppDimensions.spacingS),
              BodyMediumText(
                text: 'No key findings data available for ${diagnosis.name}',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
