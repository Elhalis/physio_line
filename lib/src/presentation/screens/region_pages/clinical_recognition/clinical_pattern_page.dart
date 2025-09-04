import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/img_tile.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';

class ClinicalPatternPage extends StatelessWidget {
  final String regionName;

  const ClinicalPatternPage({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    final List<String> dxs = ['Bilateral, localized pain'];
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Clinical Pattern Recognition',
      body: Column(
        children: [
          SvgListTile(
            svg: Constants.dx,
            title: 'All Diagnosis',
            path: '/dxs:name',
          ),
          ImageTile(
            title: dxs[0],
            imgPath: 'assets/body_regions.jpg',
            path: '/dxs/${Uri.encodeComponent(dxs[0])}',
          ),
        ],
      ),
    );
  }
}
