import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:physio_line/src/presentation/widget/text/bullet_text.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';
import 'package:physio_line/src/data/models/ortho_model.dart'; // Import Diagnosis model

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
// No longer needed
import '../../../../widget/text/text.dart';

class ClinicalFindingPage extends StatelessWidget {
  final String dxName;
  final Diagnosis diagnosis;

  const ClinicalFindingPage({
    super.key,
    required this.dxName,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return _buildClinicalFindingsContent(context, diagnosis);
  }

  Widget _buildClinicalFindingsContent(
    BuildContext context,
    Diagnosis diagnosis,
  ) {
    final historyData = diagnosis.clinicalFindings.history;
    final reportedFindingsData = diagnosis.clinicalFindings.reportedFindings;
    final examinationFindingsData =
        diagnosis.clinicalFindings.examinationFindings;
    final primarySurveyData = diagnosis.clinicalFindings.primarySurvey;
    final secondarySurveyData = diagnosis.clinicalFindings.secondarySurvey;

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

              SimplePathText(title: 'Back'),

              // Main heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(title: 'Clinical Findings'),
                      BoldSubtitle(title: diagnosis.name),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
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
                          const SizedBox(width: 8), // Added for spacing
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

              Container(
                height: 270,
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFF9A9A9A)),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText(title: 'ICD10'),
                  const SizedBox(height: AppDimensions.spacingS),
                  BodyMediumText(
                    text: '724.3 Lumbago with sciatica',
                  ), // Not a bullet list
                  const SizedBox(height: AppDimensions.spacingL),

                  // History Section
                  if (historyData.isNotEmpty) ...[
                    BoldSubtitle(title: 'History'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...historyData.map((text) => BulletText(text: text)),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Reported Findings Section
                  if (reportedFindingsData.isNotEmpty) ...[
                    BoldSubtitle(title: 'Reported Findings'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...reportedFindingsData.map(
                      (text) => BulletText(text: text),
                    ),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Examination Findings Section
                  if (examinationFindingsData.isNotEmpty) ...[
                    BoldSubtitle(title: 'Examination Findings'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...examinationFindingsData.map(
                      (text) => BulletText(text: text),
                    ),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Primary Survey Section
                  if (primarySurveyData.isNotEmpty) ...[
                    BoldSubtitle(title: 'Primary Survey'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...primarySurveyData.map((text) => BulletText(text: text)),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Secondary Survey Section
                  if (secondarySurveyData.isNotEmpty) ...[
                    BoldSubtitle(title: 'Secondary Survey'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...secondarySurveyData.map(
                      (text) => BulletText(text: text),
                    ),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Fallback message if no data available
                  if (historyData.isEmpty &&
                      reportedFindingsData.isEmpty &&
                      examinationFindingsData.isEmpty &&
                      primarySurveyData.isEmpty &&
                      secondarySurveyData.isEmpty) ...[
                    BoldSubtitle(title: 'Clinical Findings'),
                    const SizedBox(height: AppDimensions.spacingS),
                    BodyMediumText(
                      text:
                          'No clinical findings data available for ${diagnosis.name}',
                    ),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
