import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:physio_line/src/core/constants/app_colors.dart';
import 'package:physio_line/src/core/constants/constants.dart';

import '../../core/constants/app_sizes.dart';

/// A card widget displaying an icon and a label, with tap functionality
/// to navigate to a specified location.
class ElementCard extends StatelessWidget {
  const ElementCard({
    super.key,
    required this.iconPath,
    required this.label,
    required this.location,
  });

  final String iconPath;
  final String label;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            context.push(location);
          },
          focusColor:
              AppColors.primaryFocus, // Matches group-focus:bg-orange-700
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusMedium,
          ), // Matches rounded-xl
          child: Container(
            width: 56, // Matches size-14
            height: 56, // Matches size-14
            decoration: BoxDecoration(
              color: AppColors.primary, // Matches bg-orange-600
              borderRadius: BorderRadius.circular(
                AppDimensions.radiusMedium,
              ), // Matches rounded-xl
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ), // Matches text-white
                width: 56, // Matches size-14 for the SVG itself
                height: 56, // Matches size-14 for the SVG itself
              ),
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacingM), // Matches mb-3 (12px)
        SizedBox(
          width:
              120, // Provides a consistent width for the text, similar to AppCard
          child: Text(
            label,
            maxLines: 3,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppTypography.fontSizeS, // Matches text-sm
              fontWeight: FontWeight.w600, // Matches font-medium
            ),
          ),
        ),
      ],
    );
  }
}
