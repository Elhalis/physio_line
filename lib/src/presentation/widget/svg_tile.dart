import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class SvgListTile extends StatelessWidget {
  const SvgListTile({
    super.key,
    required this.svg,
    required this.title,
    required this.path,
    this.size = 50,
  });

  final String svg;
  final String title;
  final String path;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(path),
      hoverColor: Colors.grey[100],
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFEDEDED))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                SvgPicture.asset(
                  svg,
                  height: size,
                  width: size,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF4B5563),
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryDark,
                  ),
                ),

                Text(
                  "Explore",
                  style: TextStyle(
                    color: Color(0xFF1D6437),
                    backgroundColor: Color(0xFFDDFCE8),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              Constants.openFolder,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(Color(0xFF9CA3AF), BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
