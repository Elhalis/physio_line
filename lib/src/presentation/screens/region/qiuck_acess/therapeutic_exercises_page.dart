import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_region_section_page.dart';

import '../../../../core/constants/app_colors.dart';

class TherapeuticExercisesPage extends StatelessWidget {
  final String regionName;

  const TherapeuticExercisesPage({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return BaseRegionSectionPage(
      regionName: regionName,
      sectionTitle: 'Therapeutic Exercises',
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.fitness_center, color: AppColors.primary),
              title: const Text('Range of Motion'),
              subtitle: const Text('ROM exercises and stretches'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.fitness_center, color: AppColors.primary),
              title: const Text('Strengthening'),
              subtitle: const Text('Progressive resistance exercises'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.fitness_center, color: AppColors.primary),
              title: const Text('Functional Training'),
              subtitle: const Text('Activity-specific exercises'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
