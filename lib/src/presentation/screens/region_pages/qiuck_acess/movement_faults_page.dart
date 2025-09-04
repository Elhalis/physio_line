import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';

import '../../../../core/constants/app_colors.dart';

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
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_run, color: AppColors.primary),
              title: const Text('Movement Analysis'),
              subtitle: const Text('Assessment of movement patterns'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_run, color: AppColors.primary),
              title: const Text('Common Faults'),
              subtitle: const Text('Typical movement dysfunctions'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_run, color: AppColors.primary),
              title: const Text('Correction Strategies'),
              subtitle: const Text('Movement correction techniques'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
