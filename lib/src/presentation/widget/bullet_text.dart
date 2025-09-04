import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/text.dart';

import '../../core/constants/app_colors.dart';

class BulletText extends StatelessWidget {
  final String text;
  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6), // adjust to match font
          child: CircleAvatar(radius: 3, backgroundColor: AppColors.textGrey),
        ),
        const SizedBox(width: 12),
        Expanded(child: BodySmallText(text: text)),
      ],
    );
  }
}
