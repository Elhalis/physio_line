import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/utils/data_helper.dart';
import 'package:physio_line/src/cubit/cubit.dart';
import 'package:physio_line/src/cubit/state.dart';
import 'package:physio_line/src/presentation/widget/base_page.dart';
import 'package:physio_line/src/presentation/widget/bullet_text.dart';

import '../../../../../../core/constants/app_sizes.dart';
import '../../../../../widget/text.dart';

class KeyFindingsPage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const KeyFindingsPage({
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
            heading: 'Key Findings',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is OrthoError) {
          return BasePage(
            heading: 'Key Findings',
            subTitle: dxName,
            body: Center(child: Text('Error: ${state.message}')),
          );
        } else if (state is OrthoLoaded) {
          return _buildKeyFindingsContent(context, state.data);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OrthoCubit>().loadOrthoData();
          });
          return BasePage(
            heading: 'Key Findings',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildKeyFindingsContent(BuildContext context, dynamic orthoData) {
    final regionName = dxName.toLowerCase();

    // Get key findings data for the specific disease
    final examinationFindingsData = DataHelper.getClinicalFindings(
      orthoData,
      regionName,
      diseaseName,
      'examination_findings',
    );

    final reportedFindingsData = DataHelper.getClinicalFindings(
      orthoData,
      regionName,
      diseaseName,
      'reported_findings',
    );

    return BasePage(
      heading: 'Key Findings',
      subTitle: dxName,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Examination Findings Section
            if (examinationFindingsData != null &&
                examinationFindingsData.isNotEmpty) ...[
              BoldSubtitle(title: 'Examination Findings'),
              const SizedBox(height: AppDimensions.spacingS),
              ...examinationFindingsData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Reported Findings Section
            if (reportedFindingsData != null &&
                reportedFindingsData.isNotEmpty) ...[
              BoldSubtitle(title: 'Reported Findings'),
              const SizedBox(height: AppDimensions.spacingS),
              ...reportedFindingsData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Fallback if no data available
            if ((examinationFindingsData == null ||
                    examinationFindingsData.isEmpty) &&
                (reportedFindingsData == null ||
                    reportedFindingsData.isEmpty)) ...[
              BoldSubtitle(title: 'Key Findings'),
              const SizedBox(height: AppDimensions.spacingS),
              BodyMediumText(
                text:
                    'No key findings data available for $diseaseName in $dxName',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
