import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';

class PhysicalExamPage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const PhysicalExamPage({
    super.key,
    required this.dxName,
    required this.diseaseName,
  });

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: dxName,
      sectionTitle: 'Physical Exam',
      body: Column(
        children: [
          SvgListTile(
            svg: Constants.finding,
            size: 44,
            title: 'Key Findings',
            path:
                '/dx/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diseaseName)}/key_findings',
          ),
          SvgListTile(
            svg: Constants.movementFault,
            size: 44,
            title: 'Movement Faults',
            path:
                '/dx/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diseaseName)}/movement_faults',
          ),
          SvgListTile(
            svg: Constants.finding,
            size: 44,
            title: 'Associated Impairments',
            path:
                '/dx/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diseaseName)}/associated_impairments',
          ),
          SvgListTile(
            svg: Constants.dx,
            size: 44,
            title: 'Differential',
            path:
                '/dx/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diseaseName)}/differential',
          ),
        ],
      ),
    );
  }
}
