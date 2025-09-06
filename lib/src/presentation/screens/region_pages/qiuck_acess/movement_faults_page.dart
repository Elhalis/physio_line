import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';
import 'package:physio_line/src/presentation/widget/img_tile.dart';


class MovementFaultsPage extends StatelessWidget {
  final String regionName;

  const MovementFaultsPage({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Movement Faults',
      body: Column(
        children: [
          ImageTile(
            title: "scapular_faults",
            imgPath: 'assets/body_regions.jpg',
            path: '/dxs/Physical Exam/Movement Faults',
          ),
        ],
      ),
    );
  }
}
