import 'package:flutter/material.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';

import '../../core/constants/app_colors.dart';
import 'svg_picture.dart';

class PhysioAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PhysioAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF1F2937),
      toolbarHeight: 90,
      automaticallyImplyLeading: false,

      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              const FlutterLogo(size: 35),
              EndDrawerButton(color: AppColors.surface, onPressed: () {}),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SvgIcon(assetPath: Constants.home)],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(96);
}
