import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';

class PhysicalExamPage extends StatelessWidget {
  final String regionName;

  const PhysicalExamPage({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Physical Exam',
      body: Column(
        children: [
          SvgListTile(
            svg: Constants.finding,
            size: 44,
            title: 'Key Findings',
            path: '/key_finding',
          ),
          SvgListTile(
            svg: Constants.movementFault,
            size: 44,
            title: 'Movement Faults',
            path: '/movement_faults',
          ),
          SvgListTile(
            svg: Constants.finding,
            size: 44,
            title: 'Associated Impairments',
            path: '/associated_impairments',
          ),
          SvgListTile(
            svg: Constants.dx,
            size: 44,
            title: 'Diffential',
            path: '/diffential',
          ),
        ],
      ),
    );
  }
}
