import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';
import 'package:physio_line/src/presentation/widget/svg_picture.dart';
import 'package:physio_line/src/presentation/widget/text/explore_text.dart';
import 'package:physio_line/src/presentation/widget/text/text.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model

class DxTile extends StatelessWidget {
  const DxTile({
    super.key,
    required this.imgPath,
    required this.title,
    this.description, // Make description optional
    required this.path,
    this.diagnosis, // Accept Diagnosis object for navigation
  });

  final String imgPath;
  final String title;
  final String? description; // Optional description
  final String path;
  final Diagnosis? diagnosis; // Optional Diagnosis object

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (diagnosis != null) {
          context.push(path, extra: diagnosis);
        } else {
          context.push(path);
        }
      },
      hoverColor: Colors.grey[100],
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFEDEDED))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 64,
              width: 64,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Color(0xFFFBFBF3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(imgPath),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(title: title),
                  if (description != null &&
                      description!
                          .isNotEmpty) // Display description if available
                    SubtitleText(title: description!),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ExploreText()
              ],
            ),
            const SizedBox(width: 8),
            SvgIcon(assetPath: Constants.openFolder, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
