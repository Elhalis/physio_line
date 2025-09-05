import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/img_tile.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';
import 'package:physio_line/src/core/utils/data_helper.dart';
import 'package:physio_line/src/logic/cubit.dart';
import 'package:physio_line/src/logic/state.dart';

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
    // Get diagnoses from the loaded data
    final diagnoses = DataHelper.getDiagnoses(orthoData, regionName.toLowerCase());
    
    List<Widget> children = [
      SvgListTile(
        svg: Constants.dx,
        title: 'All Diagnosis',
        path: '/dxs/${Uri.encodeComponent(regionName)}',
      ),
    ];
    
    // Add diagnosis tiles if available
    if (diagnoses != null && diagnoses.isNotEmpty) {
      for (final diagnosis in diagnoses) {
        children.add(
          ImageTile(
            title: diagnosis.name,
            imgPath: 'assets/body_regions.jpg',
            path: '/dxs/${Uri.encodeComponent(regionName)}/${Uri.encodeComponent(diagnosis.name)}',
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
    
    return Column(children: children);
  }
}
