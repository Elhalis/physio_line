import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/text.dart';

import '../../core/constants/app_colors.dart';

class BaseRegionSectionPage extends StatelessWidget {
  final String regionName;
  final String sectionTitle;
  final Widget body;
  final List<Widget>? actions;

  const BaseRegionSectionPage({
    super.key,
    required this.regionName,
    required this.sectionTitle,
    required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: AppColors.appBar,
        title: const FlutterLogo(size: 50),
        centerTitle: true,
        actions:
            actions ?? [EndDrawerButton(color: Colors.white, onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),

              // Breadcrumb navigation - shows "Orthopedic > Neck"
              PathText(regionName: regionName),

              // Main heading - shows the section name (e.g., "Clinical Pattern Recognition")
              HeadingText(title: sectionTitle),

              const SizedBox(height: 52),

              // Page content
              body,
            ],
          ),
        ),
      ),
    );
  }
}
