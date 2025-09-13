import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/base_page/base_page.dart';
import 'package:physio_line/src/presentation/widget/text/bullet_text.dart'; // Added for bullet text
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model
import 'package:physio_line/src/presentation/widget/text/text.dart'; // Added for BoldSubtitle and BodyMediumText

// import 'package:physio_line/src/presentation/widget/image_path_tile.dart'; // No longer needed for this page

class MovementFaultsPage extends StatelessWidget {
  final String dxName;
  final Diagnosis diagnosis;

  const MovementFaultsPage({
    super.key,
    required this.dxName,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return _buildMovementFaultsContent(context, diagnosis);
  }

  Widget _buildMovementFaultsContent(
    BuildContext context,
    Diagnosis diagnosis,
  ) {
    final scapularFaults = diagnosis.movementFaults.scapularFaults;
    final humeralFaults = diagnosis.movementFaults.humeralFaults;
    final thoracicFaults = diagnosis.movementFaults.thoracicFaults;

    return BasePage(
      heading: 'Movement Faults',
      subTitle: diagnosis.name,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Scapular Faults Section
            if (scapularFaults.isNotEmpty) ...[
              BoldSubtitle(title: 'Scapular Faults'),
              const SizedBox(height: 8),
              ...scapularFaults.map((fault) => BulletText(text: fault)),
              const SizedBox(height: 16),
            ],

            // Humeral Faults Section
            if (humeralFaults.isNotEmpty) ...[
              BoldSubtitle(title: 'Humeral Faults'),
              const SizedBox(height: 8),
              ...humeralFaults.map((fault) => BulletText(text: fault)),
              const SizedBox(height: 16),
            ],

            // Thoracic Faults Section
            if (thoracicFaults.isNotEmpty) ...[
              BoldSubtitle(title: 'Thoracic Faults'),
              const SizedBox(height: 8),
              ...thoracicFaults.map((fault) => BulletText(text: fault)),
              const SizedBox(height: 16),
            ],

            // Fallback message if no data available
            if (scapularFaults.isEmpty &&
                humeralFaults.isEmpty &&
                thoracicFaults.isEmpty) ...[
              BoldSubtitle(title: 'Movement Faults'),
              const SizedBox(height: 8),
              BodyMediumText(
                text: 'No movement faults data available for ${diagnosis.name}',
              ),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }
}
