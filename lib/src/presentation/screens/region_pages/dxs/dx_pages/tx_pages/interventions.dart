import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/utils/data_helper.dart';
import 'package:physio_line/src/logic/cubit.dart';
import 'package:physio_line/src/logic/state.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/bullet_text.dart';

import '../../../../../../core/constants/app_sizes.dart';
import '../../../../../widget/text.dart';

class InterventionsPage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const InterventionsPage({
    super.key,
    required this.dxName,
    required this.diseaseName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrthoCubit, OrthoState>(
      builder: (context, state) {
        if (state is OrthoLoading) {
          return BaseRegionSectionPage(
            regionName: dxName,
            sectionTitle: 'Interventions',
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is OrthoError) {
          return BaseRegionSectionPage(
            regionName: dxName,
            sectionTitle: 'Interventions',
            body: Center(child: Text('Error: ${state.message}')),
          );
        } else if (state is OrthoLoaded) {
          return _buildInterventionsContent(context, state.data);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OrthoCubit>().loadOrthoData();
          });
          return BaseRegionSectionPage(
            regionName: dxName,
            sectionTitle: 'Interventions',
            body: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildInterventionsContent(BuildContext context, dynamic orthoData) {
    final regionName = dxName.toLowerCase();
    final manualTherapyData = DataHelper.getInterventions(
      orthoData,
      regionName,
      diseaseName,
      'manual_therapy',
    );
    final therapeuticExercisesData = DataHelper.getInterventions(
      orthoData,
      regionName,
      diseaseName,
      'therapeutic_exercises',
    );
    final functionalMovementData = DataHelper.getInterventions(
      orthoData,
      regionName,
      diseaseName,
      'functional_movement',
    );

    return BaseRegionSectionPage(
      regionName: dxName,
      sectionTitle: 'Interventions',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Manual Therapy Section
            if (manualTherapyData != null && manualTherapyData.isNotEmpty) ...[
              BoldSubtitle(title: 'Manual Therapy'),
              const SizedBox(height: AppDimensions.spacingS),
              ...manualTherapyData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Therapeutic Exercises Section
            if (therapeuticExercisesData != null &&
                therapeuticExercisesData.isNotEmpty) ...[
              BoldSubtitle(title: 'Therapeutic Exercises'),
              const SizedBox(height: AppDimensions.spacingS),
              ...therapeuticExercisesData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Functional Movement Section
            if (functionalMovementData != null &&
                functionalMovementData.isNotEmpty) ...[
              BoldSubtitle(title: 'Functional Movement'),
              const SizedBox(height: AppDimensions.spacingS),
              ...functionalMovementData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Fallback if no data available
            if (manualTherapyData == null &&
                therapeuticExercisesData == null &&
                functionalMovementData == null) ...[
              BoldSubtitle(title: 'Interventions'),
              const SizedBox(height: AppDimensions.spacingS),
              BodyMediumText(
                text: 'No intervention data available for $dxName',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
