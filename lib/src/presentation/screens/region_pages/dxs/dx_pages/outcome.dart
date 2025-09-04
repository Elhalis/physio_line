import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_region_section_page.dart';

import '../../../../../core/constants/app_colors.dart';

class OutcomesPage extends StatelessWidget {
  final String dxName;

  const OutcomesPage({super.key, required this.dxName});

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: dxName,
      sectionTitle: 'Physical Exam',
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.hearing, color: AppColors.primary),
              title: const Text('Subjective Assessment'),
              subtitle: const Text('Patient history and symptoms'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.hearing, color: AppColors.primary),
              title: const Text('Objective Assessment'),
              subtitle: const Text('Physical examination tests'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.hearing, color: AppColors.primary),
              title: const Text('Special Tests'),
              subtitle: const Text('Region-specific tests'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
