import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App Typography - Comprehensive text style constants
class AppTypography {
  // Font Family
  static const String fontFamily = 'Inter';

  // Font Sizes
  static const double fontSizeXS = 12.0;
  static const double fontSizeS = 14.0;
  static const double fontSizeM = 16.0;
  static const double fontSizeL = 18.0;
  static const double fontSizeXL = 24.0;
  static const double fontSizeXXL = 30.0;

  // Line Heights
  static const double lineHeightXS = 16.0;
  static const double lineHeightS = 20.0;
  static const double lineHeightM = 24.0;
  static const double lineHeightL = 28.0;
  static const double lineHeightXL = 32.0;
  static const double lineHeightXXL = 36.0;

  // Display Text Styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXXL,
    fontWeight: FontWeight.w700,
    height: lineHeightXXL / fontSizeXXL,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXL,
    fontWeight: FontWeight.w700,
    height: lineHeightXL / fontSizeXL,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeL,
    fontWeight: FontWeight.w600,
    height: lineHeightL / fontSizeL,
  );

  // Body Text Styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeL,
    fontWeight: FontWeight.w400,
    height: lineHeightL / fontSizeL,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeM,
    fontWeight: FontWeight.w400,
    height: lineHeightM / fontSizeM,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeS,
    overflow: TextOverflow.visible,
    fontWeight: FontWeight.w400,
    height: lineHeightS / fontSizeS,
  );

  // Caption Text Styles
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXS,
    fontWeight: FontWeight.w400,
    height: lineHeightXS / fontSizeXS,
  );

  // Label Text Styles
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeM,
    fontWeight: FontWeight.w500,
    height: lineHeightM / fontSizeM,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeS,
    fontWeight: FontWeight.w500,
    height: lineHeightS / fontSizeS,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXS,
    fontWeight: FontWeight.w500,
    height: lineHeightXS / fontSizeXS,
  );

  // Special Text Styles
  static const TextStyle pathText = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeS,
    fontWeight: FontWeight.w400,
    height: lineHeightS / fontSizeS,
    color: AppColors.primaryDark,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeL,
    fontWeight: FontWeight.w400,
    height: lineHeightL / fontSizeL,
  );

  static const TextStyle boldSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeL,
    fontWeight: FontWeight.bold,
    height: lineHeightL / fontSizeL,
    color: AppColors.textGrey,
  );

  static const TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXL,
    fontWeight: FontWeight.w700,
    height: lineHeightXL / fontSizeXL,
  );
}

/// App Text Styles - Legacy support (deprecated, use AppTypography instead)
class AppTextStyles {
  static const TextStyle headingLarge = AppTypography.displayLarge;
  static const TextStyle headingMedium = AppTypography.displaySmall;
  static const TextStyle bodyMedium = AppTypography.bodyMedium;
  static const TextStyle caption = AppTypography.caption;
}
