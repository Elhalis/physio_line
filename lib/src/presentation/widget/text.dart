import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:physio_line/src/core/utils/extensions/string_extensions.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/constants.dart';
import '../../core/constants/app_strings.dart';

/// Reusable text widgets with consistent theming

class PrimaryText extends StatelessWidget {
  const PrimaryText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFFC2410C),
      ),
    );
  }
}

// Breadcrumb navigation - shows "Orthopedic > Neck"
class PathText extends StatelessWidget {
  const PathText({super.key, required this.regionName});
  final String regionName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Constants.returnArrow,
          colorFilter: ColorFilter.mode(AppColors.primaryDark, BlendMode.srcIn),
          height: 16,
          width: 16,
        ),
        const SizedBox(width: AppDimensions.spacingXS),
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text('Orthopedic', style: AppTypography.pathText),
        ),
        Icon(Icons.chevron_right, color: AppColors.textGrey, size: 16),
        TextButton(
          onPressed: () {
            // Navigate back to the region page
            context.go('/ortho/$regionName');
          },
          child: Text(
            regionName.isEmpty
                ? ''
                : regionName[0].toUpperCase() + regionName.substring(1),
            style: AppTypography.pathText,
          ),
        ),
      ],
    );
  }
}

/// Simple path text for basic navigation (like Home > Orthopedic)
class SimplePathText extends StatelessWidget {
  const SimplePathText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Constants.returnArrow,
          colorFilter: ColorFilter.mode(AppColors.primaryDark, BlendMode.srcIn),
          height: 16,
          width: 16,
        ),
        const SizedBox(width: AppDimensions.spacingXS),
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(title.capitalize(), style: AppTypography.pathText),
        ),
      ],
    );
  }
}

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) =>
      Text(title, style: AppTypography.subtitle);
}

class BoldSubtitle extends StatelessWidget {
  const BoldSubtitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) =>
      Text(title, style: AppTypography.boldSubtitle);
}

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) =>
      Text(title.capitalize(), style: AppTypography.heading);
}

class BodyLargeText extends StatelessWidget {
  const BodyLargeText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTypography.bodyLarge);
}

class BodyMediumText extends StatelessWidget {
  const BodyMediumText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTypography.bodyMedium);
}

class BodySmallText extends StatelessWidget {
  const BodySmallText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTypography.bodySmall, maxLines: null);
}

class CaptionText extends StatelessWidget {
  const CaptionText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTypography.caption);
}

class LabelText extends StatelessWidget {
  const LabelText({
    super.key,
    required this.text,
    this.size = LabelSize.medium,
  });
  final String text;
  final LabelSize size;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    switch (size) {
      case LabelSize.small:
        style = AppTypography.labelSmall;
        break;
      case LabelSize.medium:
        style = AppTypography.labelMedium;
        break;
      case LabelSize.large:
        style = AppTypography.labelLarge;
        break;
    }
    return Text(text, style: style);
  }
}

enum LabelSize { small, medium, large }

/// Customizable text widget with theme support
class ThemedText extends StatelessWidget {
  const ThemedText({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          style?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ) ??
          AppTypography.bodyMedium.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
