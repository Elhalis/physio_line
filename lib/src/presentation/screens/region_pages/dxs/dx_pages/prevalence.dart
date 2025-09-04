import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/data/services/data_helper.dart';
import 'package:physio_line/src/logic/cubit.dart';
import 'package:physio_line/src/logic/state.dart';
import 'package:physio_line/src/presentation/widget/base_page.dart';
import 'package:physio_line/src/presentation/widget/text.dart';

import '../../../../../core/constants/app_sizes.dart';

class PrevalencePage extends StatelessWidget {
  final String dxName;

  const PrevalencePage({super.key, required this.dxName});

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

    // Get prevalence data for the first available diagnosis
    final diagnoses = DataHelper.getDiagnoses(orthoData, regionName);
    final prevalenceData = diagnoses?.isNotEmpty == true
        ? DataHelper.getPrevalenceData(
            orthoData,
            regionName,
            diagnoses!.first.name,
          )
        : null;

    return BasePage(
      heading: 'Prevalence',
      subTitle: dxName,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (prevalenceData != null) ...[
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
