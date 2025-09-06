import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/utils/data_helper.dart';
import 'package:physio_line/src/cubit/cubit.dart';
import 'package:physio_line/src/cubit/state.dart';
import 'package:physio_line/src/presentation/widget/base_page.dart';
import 'package:physio_line/src/presentation/widget/bullet_text.dart';

import '../../../../../core/constants/app_sizes.dart';
import '../../../../widget/text.dart';

class OutcomesPage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const OutcomesPage({
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
            heading: 'Outcomes',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is OrthoError) {
          return BasePage(
            heading: 'Outcomes',
            subTitle: dxName,
            body: Center(child: Text('Error: ${state.message}')),
          );
        } else if (state is OrthoLoaded) {
          return _buildOutcomesContent(context, state.data);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OrthoCubit>().loadOrthoData();
          });
          return BasePage(
            heading: 'Outcomes',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildOutcomesContent(BuildContext context, dynamic orthoData) {
    final regionName = dxName.toLowerCase();

    // Get outcomes data for the specific disease
    final outcomeMeasuresData = DataHelper.getOutcomeMeasures(
      orthoData,
      regionName,
      diseaseName,
    );

    return BasePage(
      heading: 'Outcomes',
      subTitle: dxName,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Outcome Measures Section
            if (outcomeMeasuresData != null &&
                outcomeMeasuresData.isNotEmpty) ...[
              BoldSubtitle(title: 'Outcome Measures'),
              const SizedBox(height: AppDimensions.spacingS),
              ...outcomeMeasuresData.map((text) => BulletText(text: text)),
              const SizedBox(height: AppDimensions.spacingL),
            ],

            // Fallback if no data available
            if (outcomeMeasuresData == null || outcomeMeasuresData.isEmpty) ...[
              BoldSubtitle(title: 'Outcomes'),
              const SizedBox(height: AppDimensions.spacingS),
              BodyMediumText(
                text:
                    'No outcome measures available for $diseaseName in $dxName',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
