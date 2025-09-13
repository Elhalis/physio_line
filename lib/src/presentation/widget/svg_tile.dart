import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model
import 'package:physio_line/src/presentation/widget/text/explore_text.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class SvgListTile extends StatelessWidget {
  const SvgListTile({
    super.key,
    required this.svg,
    required this.title,
    required this.path,
    this.size = 50,
    this.diagnosis, // Accept Diagnosis object for navigation
  });

  final String svg;
  final String title;
  final String path;
  final double size;
  final Diagnosis? diagnosis; // Optional Diagnosis object

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        assert(() {
          // ignore: avoid_print
          print('[NAV] svg_tile -> push: $path');
          return true;
        }());
        if (diagnosis != null) {
          context.push(path, extra: diagnosis);
        } else {
          context.push(path);
        }
      },
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
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
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
                const SizedBox(width: 12), // Added for spacing
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryDark,
                  ),
                ),
                ExploreText(),
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

class ReasoningSvg extends StatelessWidget {
  const ReasoningSvg({
    super.key,
    required this.svg,
    required this.title,
    required this.subtitle,
    required this.path,
    this.size = 50,
  });

  final String svg;
  final String title;
  final String subtitle;
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
                const SizedBox(width: 12), // Added for spacing
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                ExploreText(),
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
