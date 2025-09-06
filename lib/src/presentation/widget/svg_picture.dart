import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_colors.dart';

class SvgIcon extends StatelessWidget {
  final String assetPath;
  final double? size;
  final Color? color;
  const SvgIcon({super.key, required this.assetPath, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: size ?? 20,
      width: size ?? 20,
      colorFilter: ColorFilter.mode(color ?? AppColors.surface, BlendMode.srcIn),
    );
  }
}
