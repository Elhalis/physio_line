import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/utils/diagnosis_helper.dart';
import 'package:physio_line/src/core/utils/guideline_helper.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/img_tile.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';
import 'package:physio_line/src/cubit/cubit.dart';
import 'package:physio_line/src/cubit/state.dart';

class ClinicalPatternPage extends StatelessWidget {
  final String regionName;

  const ClinicalPatternPage({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Clinical Pattern Recognition',
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
    // Get clinical pattern categories from the loaded data
    final categories = GuidelineHelper.getClinicalPatternCategories(
      orthoData,
      regionName.toLowerCase(),
    );

    // Get diagnoses from the loaded data
    DiagnosisHelper.getDiagnoses(orthoData, regionName.toLowerCase());

    List<Widget> children = [];

    children.add(
      SvgListTile(
        svg: Constants.dx,
        title: 'All Diagnosis',
        path: '/dxs/${Uri.encodeComponent(regionName)}',
      ),
    );

    // Add clinical pattern recognition categories
    if (categories != null && categories.isNotEmpty) {
      for (final categoryEntry in categories.entries) {
        final categoryName = categoryEntry.key
            .replaceAll('_', ' ')
            .split(' ')
            .map(
              (word) => word.isNotEmpty
                  ? word[0].toUpperCase() + word.substring(1).toLowerCase()
                  : '',
            )
            .join(' ');

        children.add(
          ImageTile(
            imgPath: Constants.bodyRegions,
            title: categoryName,
            // navigate CPR -> Category page using dedicated CPR route
            path:
                '/cpr/${Uri.encodeComponent(regionName)}/${Uri.encodeComponent(categoryName)}',
          ),
        );
      }
    } else {
      children.add(
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No diagnoses available for this region'),
        ),
      );
    }

    // UI unchanged; diagnosis selection happens after category selection
    return Column(children: children);
  }
}
