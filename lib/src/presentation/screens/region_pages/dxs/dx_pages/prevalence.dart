import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/utils/data_helper.dart';
import 'package:physio_line/src/cubit/cubit.dart';
import 'package:physio_line/src/cubit/state.dart';
import 'package:physio_line/src/presentation/widget/base_page.dart';
import 'package:physio_line/src/presentation/widget/text.dart';

import '../../../../../core/constants/app_sizes.dart';

class PrevalencePage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const PrevalencePage({
    super.key,
    required this.dxName,
    required this.diseaseName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrthoCubit, OrthoState>(
      builder: (context, state) {
        if (state is OrthoLoading) {
          return const BasePage(
            heading: 'Prevalence',
            subTitle: 'Loading...',
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is OrthoError) {
          return BasePage(
            heading: 'Prevalence',
            subTitle: dxName,
            body: Center(child: Text('Error: ${state.message}')),
          );
        } else if (state is OrthoLoaded) {
          return _buildPrevalenceContent(context, state.data);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OrthoCubit>().loadOrthoData();
          });
          return const BasePage(
            heading: 'Prevalence',
            subTitle: 'Loading...',
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildPrevalenceContent(BuildContext context, dynamic orthoData) {
    // Extract region name from dxName (assuming format like "shoulder" or "knee")
    final regionName = dxName.toLowerCase();
    if (kDebugMode) {
      print(
        'DEBUG: PrevalencePage - Building content for region: $regionName, disease: $diseaseName',
      );
    }

    // Get prevalence data for the specific disease
    final prevalenceData =
        DataHelper.getPrevalenceData(orthoData, regionName, diseaseName) ?? [];

    if (kDebugMode) {
      print(
        'DEBUG: PrevalencePage - Received prevalence data: $prevalenceData',
      );
    }
    if (kDebugMode) {
      print('DEBUG: PrevalencePage - Data is empty: ${prevalenceData.isEmpty}');
    }
    if (kDebugMode) {
      print(
        'DEBUG: PrevalencePage - Rendering with data length: ${prevalenceData.length}',
      );
    }

    return BasePage(
      heading: 'Prevalence',
      subTitle: dxName,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Debug print moved outside of widget tree
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
          ] else ...[
            BoldSubtitle(title: 'Prevalence'),
            const SizedBox(height: AppDimensions.spacingXS),
            BodyMediumText(text: '• No prevalence data available for $dxName'),
            const SizedBox(height: AppDimensions.spacingS),
          ],
        ],
      ),
    );
  }
}
