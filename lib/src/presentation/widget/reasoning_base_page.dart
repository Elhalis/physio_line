import 'package:flutter/material.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/presentation/widget/text.dart';

import '../../core/constants/app_colors.dart';

class ReasoningBasePage extends StatelessWidget {
  final String heading;
  final String diagnosis;
  final String path;
  final String backPath;
  final Widget body;
  final List<Widget>? actions;

  const ReasoningBasePage({
    super.key,
    required this.heading,
    required this.diagnosis,
    required this.body,
    this.actions,
    required this.backPath,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: AppColors.appBar,
        title: const FlutterLogo(size: 50),
        centerTitle: true,
        actions: [EndDrawerButton(color: Colors.white, onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),

              SimplePathText(title: backPath),

              // Main heading - shows the section name (e.g., "Clinical Pattern Recognition")
              HeadingText(title: heading),

              const SizedBox(height: 28),

              ReasoningSvg(
                svg: Constants.reasoning,
                title: 'Clinical Reasoning',
                subtitle: diagnosis,
                path: path,
              ),

              // Page content
              body,
            ],
          ),
        ),
      ),
    );
  }
}
