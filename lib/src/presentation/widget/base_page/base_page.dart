import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:physio_line/src/presentation/widget/text/text.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class BasePage extends StatelessWidget {
  final String heading;
  final String subTitle;
  final String? backPath;
  final Widget body;
  final List<Widget>? actions;

  const BasePage({
    super.key,
    required this.heading,
    required this.subTitle,
    required this.body,
    this.actions,
    this.backPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: AppColors.appBar,
        title: const FlutterLogo(size: 50),
        centerTitle: true,
        actions: [EndDrawerButton(color: Colors.white, onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),

              // Breadcrumb navigation - shows "Orthopedic > Neck"
              SimplePathText(title: backPath ?? 'Back'),

              // Main heading - shows the section name (e.g., "Clinical Pattern Recognition")
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      HeadingText(title: heading),
                      BoldSubtitle(title: subTitle),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xFFFDD7AD),
                            child: SvgPicture.asset(
                              Constants.bookmark,
                              height: 20,
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                AppColors.primaryDark,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xFFFDD7AD),
                            child: SvgPicture.asset(
                              Constants.bookmark,
                              height: 20,
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                AppColors.primaryDark,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Page content
              body,
            ],
          ),
        ),
      ),
    );
  }
}
