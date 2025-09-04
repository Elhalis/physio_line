import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/img_tile.dart';

class ClinicalfindingsPage extends StatelessWidget {
  final String regionName;

  const ClinicalfindingsPage({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    final List<String> dxs = ['Bilateral, localized pain'];
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Clinical Pattern Recognition',
      body: Column(
        children: [
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
