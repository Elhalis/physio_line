import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/svg_tile.dart';
import 'package:physio_line/src/presentation/widget/text.dart';

import '../../core/constants/app_strings.dart';
import '../widget/custome_appbar.dart';

class RegionPage extends StatelessWidget {
  final String name; // dynamic data

  const RegionPage({super.key, required this.name});

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

              Text(
                name.isEmpty ? '' : name[0].toUpperCase() + name.substring(1),
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 32),

              SubtitleText(title: 'Explore - How would you like to learn?'),

              Column(
                children: [
                  SvgListTile(
                    title: 'Clinical Pattern Recognition',
                    svg: Constants.orthopedics,
                    path: '/${name}_clinical_pattern',
                  ),
                  SvgListTile(
                    title: 'Clinical Practice Guidlines',
                    svg: Constants.openBook,
                    path: '/${name}_practice_guidlines',
                  ),
                  SvgListTile(
                    title: 'All Diagnosis',
                    svg: Constants.dx,
                    path: '/${name}_dx',
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
                    path: '/${name}_exam',
                  ),
                  SvgListTile(
                    title: 'Movement Faults',
                    svg: Constants.movementFault,
                    path: '/${name}_fault',
                  ),

                  SvgListTile(
                    title: 'Maunal Therapy',
                    svg: Constants.manualTherapy,
                    path: '/${name}_manual',
                  ),
                  SvgListTile(
                    title: 'Therapeutic Exercises',
                    svg: Constants.therapeuticEx,
                    path: '/${name}_exs',
                  ),
                  SvgListTile(
                    title: 'Rehabilitation progression Pyramid',
                    svg: Constants.pyramid,
                    path: '/${name}_progress',
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
