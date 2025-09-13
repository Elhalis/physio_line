import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_page.dart';
import 'package:physio_line/src/presentation/widget/text/bullet_text.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model

import '../../../../../../core/constants/app_sizes.dart';
// No longer needed
import '../../../../../widget/text/text.dart';

class InterventionsPage extends StatelessWidget {
  final String
  dxName; // Keep for breadcrumb, or modify BasePage to use Diagnosis.name
  final Diagnosis diagnosis;

  const InterventionsPage({
    super.key,
    required this.dxName,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return _buildInterventionsContent(context, diagnosis);
  }

  Widget _buildInterventionsContent(BuildContext context, Diagnosis diagnosis) {
    final manualTherapyData = diagnosis.interventions.manualTherapy;
    final therapeuticExercisesData =
        diagnosis.interventions.therapeuticExercises;
    final functionalMovementData = diagnosis.interventions.functionalMovement;

    return BasePage(
      heading: 'Interventions',
      subTitle: diagnosis.name,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Manual Therapy Section
            if (manualTherapyData.jointMobilizations.isNotEmpty ||
                manualTherapyData.softTissueTechniques.isNotEmpty) ...[
              BoldSubtitle(title: 'Manual Therapy'),
              const SizedBox(height: AppDimensions.spacingS),
              if (manualTherapyData.jointMobilizations.isNotEmpty)
                ...manualTherapyData.jointMobilizations.map(
                  (text) => BulletText(text: text),
                ),
              if (manualTherapyData.softTissueTechniques.isNotEmpty)
                ...manualTherapyData.softTissueTechniques.map(
                  (text) => BulletText(text: text),
                ),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Therapeutic Exercises Section
            if (therapeuticExercisesData.irritabilityLevels.high.isNotEmpty ||
                therapeuticExercisesData
                    .irritabilityLevels
                    .moderate
                    .isNotEmpty ||
                therapeuticExercisesData.irritabilityLevels.low.isNotEmpty) ...[
              BoldSubtitle(title: 'Therapeutic Exercises'),
              const SizedBox(height: AppDimensions.spacingS),
              if (therapeuticExercisesData.irritabilityLevels.high.isNotEmpty)
                ...therapeuticExercisesData.irritabilityLevels.high.map(
                  (text) => BulletText(text: 'High Irritability: $text'),
                ),
              if (therapeuticExercisesData
                  .irritabilityLevels
                  .moderate
                  .isNotEmpty)
                ...therapeuticExercisesData.irritabilityLevels.moderate.map(
                  (text) => BulletText(text: 'Moderate Irritability: $text'),
                ),
              if (therapeuticExercisesData.irritabilityLevels.low.isNotEmpty)
                ...therapeuticExercisesData.irritabilityLevels.low.map(
                  (text) => BulletText(text: 'Low Irritability: $text'),
                ),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Functional Movement Section
            if (functionalMovementData.isNotEmpty) ...[
              BoldSubtitle(title: 'Functional Movement'),
              const SizedBox(height: AppDimensions.spacingS),
              ...functionalMovementData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Fallback if no data available
            if (manualTherapyData.jointMobilizations.isEmpty &&
                manualTherapyData.softTissueTechniques.isEmpty &&
                therapeuticExercisesData.irritabilityLevels.high.isEmpty &&
                therapeuticExercisesData.irritabilityLevels.moderate.isEmpty &&
                therapeuticExercisesData.irritabilityLevels.low.isEmpty &&
                functionalMovementData.isEmpty) ...[
              BoldSubtitle(title: 'Interventions'),
              const SizedBox(height: AppDimensions.spacingS),
              BodyMediumText(
                text: 'No intervention data available for ${diagnosis.name}',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
