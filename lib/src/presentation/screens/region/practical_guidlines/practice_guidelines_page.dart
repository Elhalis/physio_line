import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/utils/diagnosis_helper.dart';
import 'package:physio_line/src/core/utils/guideline_helper.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_region_section_page.dart';

import '../../../../cubit/cubit.dart';
import '../../../../cubit/state.dart';

class PracticeGuidelinesPage extends StatelessWidget {
  final String regionName;

  PracticeGuidelinesPage({super.key, required this.regionName}) {
    if (kDebugMode) {
      print('[DEBUG] PracticeGuidelinesPage regionName: $regionName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Clinical Practice Guidelines',
      body: BlocBuilder<OrthoCubit, OrthoState>(
        builder: (context, state) {
          if (state is OrthoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrthoError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is OrthoLoaded) {
            return _buildContent(context, state.data);
          } else {
            // Initial state - load data
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<OrthoCubit>().loadOrthoData();
            });
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, dynamic orthoData) {
    GuidelineHelper.getPracticalGuidelines(orthoData, regionName.toLowerCase());

    // Get diagnoses from the loaded data
    DiagnosisHelper.getDiagnoses(orthoData, regionName.toLowerCase());

    return Column(
      children: [
        
      ],
    );
  }
}
