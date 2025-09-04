import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';

import '../../../../core/constants/app_colors.dart';

class PracticeGuidelinesPage extends StatelessWidget {
  final String regionName;

  const PracticeGuidelinesPage({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Clinical Practice Guidelines',
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.description, color: AppColors.primary),
              title: const Text('Assessment Guidelines'),
              subtitle: const Text('Standard assessment procedures'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.description, color: AppColors.primary),
              title: const Text('Treatment Guidelines'),
              subtitle: const Text('Evidence-based treatment approaches'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.description, color: AppColors.primary),
              title: const Text('Outcome Measures'),
              subtitle: const Text('Recommended outcome measures'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
