import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/utils/guideline_helper.dart';
import 'package:physio_line/src/cubit/cubit.dart';
import 'package:physio_line/src/cubit/state.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/dx_tile.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model
import 'package:physio_line/src/core/utils/data_helper.dart'; // Import DataHelper

class CategoryPage extends StatelessWidget {
  final String dxName;
  final String pattern;

  const CategoryPage({super.key, required this.dxName, required this.pattern});

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: 'Clinical Pattern Recognition',
      sectionTitle: pattern,
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
    // Build diagnosis list for this selected category
    GuidelineHelper.getDiagnosisNamesForCategory(
      orthoData,
      dxName.toLowerCase(),
      pattern.toLowerCase().replaceAll(' ', '_'),
    );

    List<Widget> children = [];

    children.add(
      Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Image.asset(Constants.patternA, fit: BoxFit.cover),
      ),
    );

    // Add a section for common causes
    final commonCauses = GuidelineHelper.getCommonCausesForCategory(
      orthoData,
      dxName.toLowerCase(),
      pattern.toLowerCase().replaceAll(' ', '_'),
    );

    if (commonCauses != null && commonCauses.isNotEmpty) {
      for (final cause in commonCauses) {
        // Retrieve the full Diagnosis object
        final Diagnosis? diagnosisDetails = DataHelper.getDiagnosisDetails(
          orthoData,
          dxName.toLowerCase(),
          cause,
        );

        if (diagnosisDetails != null) {
          debugPrint(
            'DxTile - Title: ${diagnosisDetails.name}, Description: ${diagnosisDetails.description}',
          );
          children.add(
            DxTile(
              imgPath: 'assets/page_1763.jpg',
              title: diagnosisDetails.name, // Use diagnosis name as title
              description:
                  diagnosisDetails.description, // Use diagnosis description
              path:
                  '/dxs/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diagnosisDetails.name)}',
              diagnosis: diagnosisDetails, // Pass the Diagnosis object
            ),
          );
        }
      }
    }

    return Column(children: children);
  }
}
