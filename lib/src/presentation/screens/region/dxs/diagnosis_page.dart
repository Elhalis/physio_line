import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model

import '../../../../core/constants/app_colors.dart';
import '../../../widget/text/text.dart';

class DiseasePage extends StatelessWidget {
  final String dxName;
  final Diagnosis diagnosis;

  const DiseasePage({super.key, required this.dxName, required this.diagnosis});

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
              HeadingText(title: diagnosis.name),
              SubtitleText(title: diagnosis.description),

              const SizedBox(height: 32),

              SvgListTile(
                title: 'Prevalence',
                svg: Constants.prevalence,
                size: 44,
                path:
                    '/dxs/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diagnosis.name)}/prevalence',
                diagnosis: diagnosis,
              ),
              SvgListTile(
                title: 'Clinical Findings',
                svg: Constants.finding,
                size: 44,
                path:
                    '/dxs/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diagnosis.name)}/clinical_findings',
                diagnosis: diagnosis,
              ),
              SvgListTile(
                title: 'Physical Exam',
                svg: Constants.cardiopulmonary,
                size: 44,
                path:
                    '/dxs/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diagnosis.name)}/physical_exam',
                diagnosis: diagnosis,
              ),
              SvgListTile(
                title: 'Interventions',
                svg: Constants.tx,
                size: 44,
                path:
                    '/dxs/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diagnosis.name)}/interventions',
                diagnosis: diagnosis,
              ),
              SvgListTile(
                title: 'Outcome',
                svg: Constants.doList,
                size: 44,
                path:
                    '/dxs/${Uri.encodeComponent(dxName)}/${Uri.encodeComponent(diagnosis.name)}/outcomes',
                diagnosis: diagnosis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
