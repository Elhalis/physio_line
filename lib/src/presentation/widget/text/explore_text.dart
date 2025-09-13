import 'package:flutter/material.dart';
import 'package:physio_line/src/core/constants/app_colors.dart';

class ExploreText extends StatelessWidget {
  const ExploreText({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.textBG,
      borderRadius: BorderRadius.circular(4)
    ),
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
    child: const Text(
      "Explore",
      style: TextStyle(
        color: AppColors.textgreen,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    ),
  );
}
