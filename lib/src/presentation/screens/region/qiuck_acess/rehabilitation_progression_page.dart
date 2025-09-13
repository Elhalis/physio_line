import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_region_section_page.dart';

import '../../../../core/constants/app_colors.dart';

class RehabilitationProgressionPage extends StatelessWidget {
  final String regionName;

  const RehabilitationProgressionPage({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Rehabilitation Progression Pyramid',
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.trending_up, color: AppColors.primary),
              title: const Text('Phase 1: Acute'),
              subtitle: const Text('Pain control and protection'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.trending_up, color: AppColors.primary),
              title: const Text('Phase 2: Subacute'),
              subtitle: const Text('Restore mobility and strength'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.trending_up, color: AppColors.primary),
              title: const Text('Phase 3: Functional'),
              subtitle: const Text('Return to function'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.trending_up, color: AppColors.primary),
              title: const Text('Phase 4: Return to Sport'),
              subtitle: const Text('Sport-specific training'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
