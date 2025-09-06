import 'package:flutter/material.dart';
import 'package:physio_line/src/data/models/ortho_model.dart';
import 'region_pointer.dart';

class RegionPointerBuilder extends StatelessWidget {
  final OrthoJoints orthoData;

  const RegionPointerBuilder({super.key, required this.orthoData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _buildRegionPointers(context, orthoData),
    );
  }

  List<Widget> _buildRegionPointers(BuildContext context, OrthoJoints orthoData) {
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

  bool _hasRegionData(OrthoJoints orthoData, String regionName) {
  
    // Access the joints map instead of direct properties
    final joint = orthoData.joints[regionName];
    return joint != null &&
        joint.clinicalPatternRecognition.clinicalPracticeGuidelines.allDiagnoses.isNotEmpty;
  }
}