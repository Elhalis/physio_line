import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/utils/data_helper.dart';
import 'package:physio_line/src/cubit/cubit.dart';
import 'package:physio_line/src/cubit/state.dart';
import 'package:physio_line/src/presentation/widget/base_page.dart';
import 'package:physio_line/src/presentation/widget/bullet_text.dart';

import '../../../../../../core/constants/app_sizes.dart';
import '../../../../../widget/text.dart';

class AssociatedImpairmentsPage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const AssociatedImpairmentsPage({
    super.key,
    required this.dxName,
    required this.diseaseName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrthoCubit, OrthoState>(
      builder: (context, state) {
        if (state is OrthoLoading) {
          return BasePage(
            heading: 'Associated Impairments',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is OrthoError) {
          return BasePage(
            heading: 'Associated Impairments',
            subTitle: dxName,
            body: Center(child: Text('Error: ${state.message}')),
          );
        } else if (state is OrthoLoaded) {
          return _buildAssociatedImpairmentsContent(context, state.data);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OrthoCubit>().loadOrthoData();
          });
          return BasePage(
            heading: 'Associated Impairments',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildAssociatedImpairmentsContent(
    BuildContext context,
    dynamic orthoData,
  ) {
    final regionName = dxName.toLowerCase();

    // Get associated impairments data for the specific disease
    final primarySurveyData = DataHelper.getClinicalFindings(
      orthoData,
      regionName,
      diseaseName,
      'primary_survey',
    );

    final secondarySurveyData = DataHelper.getClinicalFindings(
      orthoData,
      regionName,
      diseaseName,
      'secondary_survey',
    );

    return BasePage(
      heading: 'Associated Impairments',
      subTitle: dxName,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Primary Survey Section
            if (primarySurveyData != null && primarySurveyData.isNotEmpty) ...[
              BoldSubtitle(title: 'Primary Survey'),
              const SizedBox(height: AppDimensions.spacingS),
              ...primarySurveyData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Secondary Survey Section
            if (secondarySurveyData != null &&
                secondarySurveyData.isNotEmpty) ...[
              BoldSubtitle(title: 'Secondary Survey'),
              const SizedBox(height: AppDimensions.spacingS),
              ...secondarySurveyData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Fallback if no data available
            if ((primarySurveyData == null || primarySurveyData.isEmpty) &&
                (secondarySurveyData == null ||
                    secondarySurveyData.isEmpty)) ...[
              BoldSubtitle(title: 'Associated Impairments'),
              const SizedBox(height: AppDimensions.spacingS),
              BodyMediumText(
                text:
                    'No associated impairments data available for $diseaseName in $dxName',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
