import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_region_section_page.dart';

import '../../../../core/constants/app_colors.dart';

class ManualTherapyPage extends StatelessWidget {
  final String regionName;

  const ManualTherapyPage({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Manual Therapy',
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.touch_app, color: AppColors.primary),
              title: const Text('Joint Mobilization'),
              subtitle: const Text('Joint mobilization techniques'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.touch_app, color: AppColors.primary),
              title: const Text('Soft Tissue Techniques'),
              subtitle: const Text('Soft tissue mobilization'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.touch_app, color: AppColors.primary),
              title: const Text('Manipulation'),
              subtitle: const Text('High-velocity techniques'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
