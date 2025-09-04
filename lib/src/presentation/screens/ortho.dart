import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/logic/cubit.dart';
import 'package:physio_line/src/logic/state.dart';
import 'package:physio_line/src/presentation/widget/text.dart';

import '../widget/custome_appbar.dart';
import '../widget/region_pointer.dart';

class OrthopedicPage extends StatelessWidget {
  const OrthopedicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhysioAppbar(),
      body: BlocBuilder<OrthoCubit, OrthoState>(
        builder: (context, state) {
          if (state is OrthoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrthoError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is OrthoLoaded) {
            return _buildBodyWithData(context, state.data);
          } else {
            // Initial state - load data
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<OrthoCubit>().loadOrthoData();
            });
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildBodyWithData(BuildContext context, dynamic orthoData) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),

            SimplePathText(title: 'Home'),

            HeadingText(title: 'Orthopedic'),

            const SizedBox(height: 30),

            Text(
              'Choose a Body Region',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 30),

            Stack(
              children: [
                SizedBox(
                  width: 300,
                  child: Image.asset('assets/body_regions.jpg'),
                ),
                // Dynamic region pointers based on JSON data
                ..._buildRegionPointers(context, orthoData),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRegionPointers(BuildContext context, dynamic orthoData) {
    final List<Widget> pointers = [];

    // Check which regions have data in JSON
    final hasShoulderData = _hasRegionData(orthoData, 'shoulder');
    final hasKneeData = _hasRegionData(orthoData, 'knee');

    // Define all possible regions with their positions
    final regions = [
      {
        'name': 'neck',
        'path': '/ortho/neck',
        'top': 50.0,
        'left': 130.0,
        'hasData': false,
      },
      {
        'name': 'lumbar',
        'path': '/ortho/lumbar',
        'top': 150.0,
        'left': 130.0,
        'hasData': false,
      },
      {
        'name': 'pelvic',
        'path': '/ortho/pelvic',
        'top': 190.0,
        'left': 130.0,
        'hasData': false,
      },
      {
        'name': 'shoulder',
        'path': '/ortho/shoulder',
        'top': 90.0,
        'left': 180.0,
        'hasData': hasShoulderData,
      },
      {
        'name': 'elbow',
        'path': '/ortho/elbow',
        'top': 150.0,
        'left': 193.0,
        'hasData': false,
      },
      {
        'name': 'hand',
        'path': '/ortho/hand',
        'top': 210.0,
        'left': 212.0,
        'hasData': false,
      },
      {
        'name': 'thigh',
        'path': '/ortho/thigh',
        'top': 240.0,
        'left': 150.0,
        'hasData': false,
      },
      {
        'name': 'knee',
        'path': '/ortho/knee',
        'top': 290.0,
        'left': 154.0,
        'hasData': hasKneeData,
      },
      {
        'name': 'foot',
        'path': '/ortho/foot',
        'top': 380.0,
        'left': 154.0,
        'hasData': false,
      },
    ];

    // Create region pointers based on data availability
    for (final region in regions) {
      pointers.add(
        RegionPointer(
          path: region['path'] as String,
          top: region['top'] as double,
          left: region['left'] as double,
          isEnabled: region['hasData'] as bool,
        ),
      );
    }

    return pointers;
  }

  bool _hasRegionData(dynamic orthoData, String regionName) {
    if (orthoData?.orthoJoints == null) return false;

    switch (regionName) {
      case 'shoulder':
        final shoulderData = orthoData.orthoJoints.shoulder;
        return shoulderData != null &&
            shoulderData.clinicalPatternRecognition != null &&
            shoulderData
                    .clinicalPatternRecognition
                    .clinicalPracticeGuidelines !=
                null &&
            shoulderData
                    .clinicalPatternRecognition
                    .clinicalPracticeGuidelines
                    .allDiagnoses !=
                null &&
            shoulderData
                .clinicalPatternRecognition
                .clinicalPracticeGuidelines
                .allDiagnoses
                .isNotEmpty;

      case 'knee':
        final kneeData = orthoData.orthoJoints.knee;
        return kneeData != null &&
            kneeData.clinicalPatternRecognition != null &&
            kneeData.clinicalPatternRecognition.clinicalPracticeGuidelines !=
                null;

      default:
        return false;
    }
  }
}
