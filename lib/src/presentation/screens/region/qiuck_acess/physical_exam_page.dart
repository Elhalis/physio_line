import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';

class PhysicalExamPage extends StatelessWidget {
  final String regionName;

  PhysicalExamPage({super.key, required this.regionName}) {
    if (kDebugMode) {
      print('[DEBUG] PhysicalExamPage regionName: $regionName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: regionName, // Adjusted to use regionName
      sectionTitle: 'Physical Exam',
      body: Column(
        children: [
          SvgListTile(
            svg: Constants.finding,
            size: 44,
            title: 'Key Findings',
            path:
                '/physical_exam/${Uri.encodeComponent(regionName)}/key_findings', // Adjusted path for region-level
          ),
          SvgListTile(
            svg: Constants.movementFault,
            size: 44,
            title: 'Movement Faults',
            path:
                '/physical_exam/${Uri.encodeComponent(regionName)}/movement_faults', // Adjusted
          ),
          SvgListTile(
            svg: Constants.finding,
            size: 44,
            title: 'Associated Impairments',
            path:
                '/physical_exam/${Uri.encodeComponent(regionName)}/associated_impairments', // Adjusted
          ),
          SvgListTile(
            svg: Constants.dx,
            size: 44,
            title: 'Differential',
            path:
                '/physical_exam/${Uri.encodeComponent(regionName)}/differential', // Adjusted
          ),
        ],
      ),
    );
  }
}
