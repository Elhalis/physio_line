import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_colors.dart';

class SvgIcon extends StatelessWidget {
  final String assetPath;
  final double? size;
  const SvgIcon({super.key, required this.assetPath, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: size ?? 20,
      width: size ?? 20,
      colorFilter: ColorFilter.mode(AppColors.surface, BlendMode.srcIn),
    );
  }
}
