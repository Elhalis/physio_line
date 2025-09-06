import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../widget/text.dart';

class DiseasePage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const DiseasePage({
    super.key,
    required this.dxName,
    required this.diseaseName,
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

              // Breadcrumb navigation - shows "Orthopedic > Neck"
              SimplePathText(title: dxName),

              // Main heading - shows the section name (e.g., "Clinical Pattern Recognition")
              HeadingText(title: diseaseName),
              SubtitleText(title: 'Acute low back pain with radiating pain'),

              const SizedBox(height: 32),

              SvgListTile(
                title: 'Prevalence',
                svg: Constants.prevalence,
                size: 44,
                path:
                    '/dx/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diseaseName)}/prevalence',
              ),
              SvgListTile(
                title: 'Clinical Findings',
                svg: Constants.finding,
                size: 44,
                path:
                    '/dx/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diseaseName)}/clinical_findings',
              ),
              SvgListTile(
                title: 'Physical Exam',
                svg: Constants.cardiopulmonary,
                size: 44,
                path:
                    '/dx/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diseaseName)}/physical_exam',
              ),
              SvgListTile(
                title: 'Interventions',
                svg: Constants.tx,
                size: 44,
                path:
                    '/dx/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diseaseName)}/interventions',
              ),
              SvgListTile(
                title: 'Outcome',
                svg: Constants.doList,
                size: 44,
                path:
                    '/dx/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diseaseName)}/outcomes',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
