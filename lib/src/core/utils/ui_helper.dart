import 'package:flutter/material.dart';
import 'package:physio_line/src/data/models/ortho_model.dart';

class UIHelper {
  static Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  static Widget buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text('• $item'),
            ),
          )
          .toList(),
    );
  }

  static Widget buildModalityCard(Modality modality, String modalityName) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              modalityName.replaceAll('_', ' ').toTitleCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            if (modality.purpose.isNotEmpty) ...[
              buildSectionTitle('Purpose'),
              buildBulletList(modality.purpose),
            ],
            if (modality.gradeOfRecommendation.isNotEmpty) ...[
              buildSectionTitle('Grade of Recommendation'),
              Text(modality.gradeOfRecommendation.join(', ')),
            ],
            if (modality.cues.isNotEmpty) ...[
              buildSectionTitle('Procedure'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: modality.cues.entries
                    .map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text('${entry.key}. ${entry.value}'),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String toTitleCase() {
    return split(' ')
        .map(
          (word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '',
        )
        .join(' ');
  }
}
