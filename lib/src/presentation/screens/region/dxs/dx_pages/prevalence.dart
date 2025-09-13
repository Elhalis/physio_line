import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_page.dart';
import 'package:physio_line/src/presentation/widget/text/text.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model

import '../../../../../core/constants/app_sizes.dart';
// No longer needed

class PrevalencePage extends StatelessWidget {
  final String
  dxName; // Keep for breadcrumb, or modify BasePage to use Diagnosis.name
  final Diagnosis diagnosis;

  const PrevalencePage({
    super.key,
    required this.dxName,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return _buildPrevalenceContent(
      context,
      diagnosis,
    ); // Directly use diagnosis
  }

  Widget _buildPrevalenceContent(BuildContext context, Diagnosis diagnosis) {
    final prevalenceData = diagnosis.prevalence.prevalenceStatistics;
    final incidenceData = diagnosis.prevalence.incidenceData;

    if (kDebugMode) {
      print(
        'DEBUG: PrevalencePage - Building content for region: $dxName, disease: ${diagnosis.name}',
      );
      print(
        'DEBUG: PrevalencePage - Received prevalence data: $prevalenceData',
      );
      print('DEBUG: PrevalencePage - Received incidence data: $incidenceData');
      print(
        'DEBUG: PrevalencePage - Prevalence data is empty: ${prevalenceData.isEmpty}',
      );
      print(
        'DEBUG: PrevalencePage - Incidence data is empty: ${incidenceData.isEmpty}',
      );
      print(
        'DEBUG: PrevalencePage - Rendering with prevalence data length: ${prevalenceData.length}',
      );
      print(
        'DEBUG: PrevalencePage - Rendering with incidence data length: ${incidenceData.length}',
      );
    }

    return BasePage(
      heading: 'Prevalence',
      subTitle: diagnosis.name,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (prevalenceData.isNotEmpty) ...[
            BoldSubtitle(title: 'Prevalence Statistics'),
            const SizedBox(height: AppDimensions.spacingXS),
            ...prevalenceData.map(
              (stat) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.spacingXS),
                child: BodyMediumText(text: '• $stat'),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingS),
          ],
          if (incidenceData.isNotEmpty) ...[
            BoldSubtitle(title: 'Incidence Data'),
            const SizedBox(height: AppDimensions.spacingXS),
            ...incidenceData.map(
              (data) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.spacingXS),
                child: BodyMediumText(text: '• $data'),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingS),
          ],
          if (prevalenceData.isEmpty && incidenceData.isEmpty) ...[
            BoldSubtitle(title: 'Prevalence'),
            const SizedBox(height: AppDimensions.spacingXS),
            BodyMediumText(
              text: '• No prevalence data available for ${diagnosis.name}',
            ),
            const SizedBox(height: AppDimensions.spacingS),
          ],
        ],
      ),
    );
  }
}
