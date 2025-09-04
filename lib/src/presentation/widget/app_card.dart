import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.path,
    required this.text,
    required this.location,
  });

  final String path;
  final String text;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            (context).push(location);
          },
          focusColor: Color(0xFFBF4215),
          child: Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(
              path,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              width: 40,
              height: 40,
            ),
          ),
        ),

        SizedBox(
          width: 120,
          child: Text(
            text,
            maxLines: 3,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
