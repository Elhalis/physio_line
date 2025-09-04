import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:physio_line/src/data/services/data_helper.dart';
import 'package:physio_line/src/logic/cubit.dart';
import 'package:physio_line/src/logic/state.dart';
import 'package:physio_line/src/presentation/widget/bullet_text.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../widget/text.dart';

class ClinicalFindingPage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const ClinicalFindingPage({
    super.key,
    required this.dxName,
    required this.diseaseName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrthoCubit, OrthoState>(
      builder: (context, state) {
        if (state is OrthoLoading) {
          return _buildLoadingState();
        } else if (state is OrthoError) {
          return _buildErrorState(state.message);
        } else if (state is OrthoLoaded) {
          return _buildClinicalFindingsContent(context, state.data);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OrthoCubit>().loadOrthoData();
          });
          return _buildLoadingState();
        }
      },
    );
  }

  Widget _buildLoadingState() {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: AppColors.appBar,
        title: const FlutterLogo(size: 50),
        centerTitle: true,
        actions: [EndDrawerButton(color: Colors.white, onPressed: () {})],
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildErrorState(String message) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: AppColors.appBar,
        title: const FlutterLogo(size: 50),
        centerTitle: true,
        actions: [EndDrawerButton(color: Colors.white, onPressed: () {})],
      ),
      body: Center(child: Text('Error: $message')),
    );
  }

  Widget _buildClinicalFindingsContent(
    BuildContext context,
    dynamic orthoData,
  ) {
    // Extract region name from dxName
    final regionName = dxName.toLowerCase();

    // Get clinical findings data from JSON
    final historyData = DataHelper.getClinicalFindings(
      orthoData,
      regionName,
      diseaseName,
      'history',
    );
    final reportedFindingsData = DataHelper.getClinicalFindings(
      orthoData,
      regionName,
      diseaseName,
      'reported_findings',
    );
    final examinationFindingsData = DataHelper.getClinicalFindings(
      orthoData,
      regionName,
      diseaseName,
      'examination_findings',
    );
    final primarySurveyData = DataHelper.getClinicalFindings(
      orthoData,
      regionName,
      diseaseName,
      'primary_survey',
    );
    final secondarySurveyData = DataHelper.getClinicalFindings(
      orthoData,
      regionName,
      diseaseName,
      'secondary_survey',
    );

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
                    // Assuming 'spacing' is a custom property or needs to be replaced with SizedBox
                    // For now, keeping it as is, but it might cause an error if Column doesn't have it.
                    // If it's a custom Column, it should be fine.
                    // If not, consider replacing with SizedBox(height: 2) between children.
                    children: [
                      HeadingText(title: 'Clinical Findings'),
                      BoldSubtitle(title: diseaseName),
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
                  if (historyData != null && historyData.isNotEmpty) ...[
                    BoldSubtitle(title: 'History'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...historyData.map((text) => BulletText(text: text)),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Reported Findings Section
                  if (reportedFindingsData != null &&
                      reportedFindingsData.isNotEmpty) ...[
                    BoldSubtitle(title: 'Reported Findings'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...reportedFindingsData.map(
                      (text) => BulletText(text: text),
                    ),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Examination Findings Section
                  if (examinationFindingsData != null &&
                      examinationFindingsData.isNotEmpty) ...[
                    BoldSubtitle(title: 'Examination Findings'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...examinationFindingsData.map(
                      (text) => BulletText(text: text),
                    ),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Primary Survey Section
                  if (primarySurveyData != null &&
                      primarySurveyData.isNotEmpty) ...[
                    BoldSubtitle(title: 'Primary Survey'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...primarySurveyData.map((text) => BulletText(text: text)),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Secondary Survey Section
                  if (secondarySurveyData != null &&
                      secondarySurveyData.isNotEmpty) ...[
                    BoldSubtitle(title: 'Secondary Survey'),
                    const SizedBox(height: AppDimensions.spacingS),
                    ...secondarySurveyData.map(
                      (text) => BulletText(text: text),
                    ),
                    const SizedBox(height: AppDimensions.spacingL),
                  ],

                  // Fallback message if no data available
                  if (historyData == null &&
                      reportedFindingsData == null &&
                      examinationFindingsData == null &&
                      primarySurveyData == null &&
                      secondarySurveyData == null) ...[
                    BoldSubtitle(title: 'Clinical Findings'),
                    const SizedBox(height: AppDimensions.spacingS),
                    BodyMediumText(
                      text:
                          'No clinical findings data available for $diseaseName',
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
