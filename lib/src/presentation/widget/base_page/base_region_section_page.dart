import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/custome_appbar.dart';
import 'package:physio_line/src/presentation/widget/text/text.dart';


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
      appBar: PhysioAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),

              
              SimplePathText(title: regionName),

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
