import 'package:flutter/material.dart';
import 'package:physio_line/src/core/utils/extensions/string_extensions.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/presentation/widget/text/text.dart';

import '../../../core/constants/app_strings.dart';
import '../../widget/custome_appbar.dart';

class RegionPage extends StatelessWidget {
  final String region;

  const RegionPage({super.key, required this.region});

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

              SimplePathText(title: 'Orthopedic'),

              HeadingText(title: region.isEmpty ? '' : region.capitalize()),

              const SizedBox(height: 32),

              SubtitleText(title: 'Explore - How would you like to learn?'),

              Column(
                children: [
                  SvgListTile(
                    title: 'Clinical Pattern Recognition',
                    svg: Constants.orthopedics,
                    // unchanged: CPR remains its own top-level route elsewhere
                    path: '/${region}_clinical_pattern',
                  ),

                  SvgListTile(
                    title: 'All Diagnosis',
                    svg: Constants.dx,
                    // changed: region landing under /dxs/:region
                    path: '/dxs/${Uri.encodeComponent(region)}',
                  ),
                ],
              ),

              const SizedBox(height: 48),

              SubtitleText(title: 'Quick Access'),

              Column(
                children: [
                  SvgListTile(
                    title: 'Physical Exam',
                    svg: Constants.cardiopulmonary,
                    // changed: nested child at /dxs/:region/physical_exam
                    path: '/dxs/${Uri.encodeComponent(region)}/physical_exam',
                  ),
                  SvgListTile(
                    title: 'Movement Faults',
                    svg: Constants.movementFault,
                    // changed: nested child at /dxs/:region/movement_faults
                    path: '/dxs/${Uri.encodeComponent(region)}/movement_faults',
                  ),

                  SvgListTile(
                    title: 'Maunal Therapy',
                    svg: Constants.manualTherapy,
                    // changed: nested child at /dxs/:region/manual
                    path: '/dxs/${Uri.encodeComponent(region)}/manual',
                  ),
                  SvgListTile(
                    title: 'Therapeutic Exercises',
                    svg: Constants.therapeuticEx,
                    // changed: nested child at /dxs/:region/therapeutic_exercises
                    path:
                        '/dxs/${Uri.encodeComponent(region)}/therapeutic_exercises',
                  ),
                  SvgListTile(
                    title: 'Rehabilitation progression Pyramid',
                    svg: Constants.pyramid,
                    // changed: nested child at /dxs/:region/rehabilitation_progression
                    path:
                        '/dxs/${Uri.encodeComponent(region)}/rehabilitation_progression',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
