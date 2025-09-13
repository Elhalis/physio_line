import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:physio_line/src/core/utils/diagnosis_helper.dart';
import 'package:physio_line/src/presentation/widget/text/explore_text.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../cubit/cubit.dart';
import '../../../../cubit/state.dart';
import '../../../widget/text/text.dart';

class AllDiseasePage extends StatelessWidget {
  final String diagnosisName;

  const AllDiseasePage({super.key, required this.diagnosisName});

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
      body: BlocBuilder<OrthoCubit, OrthoState>(
        builder: (context, state) {
          if (state is OrthoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrthoError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is OrthoLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),

                    // Breadcrumb navigation
                    SimplePathText(title: 'Clinical Pattern Recognition'),
                    HeadingText(title: diagnosisName),

                    const SizedBox(height: 28),

                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFFBFBF3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset('assets/body_regions.jpg'),
                    ),

                    // Dynamic diagnosis list
                    ..._buildDiagnosisList(context, state.data),
                  ],
                ),
              ),
            );
          } else {
            // Initial state - load data
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<OrthoCubit>().loadOrthoData();
            });
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<Widget> _buildDiagnosisList(BuildContext context, dynamic orthoData) {
    final List<Widget> diagnosisWidgets = [];

    // Get region diagnoses from the loaded data
    final regionName = diagnosisName.toLowerCase();
    final diagnoses = DiagnosisHelper.getDiagnoses(orthoData, regionName);

    if (diagnoses != null && diagnoses.isNotEmpty) {
      for (final diagnosis in diagnoses) {
        diagnosisWidgets.add(
          InkWell(
            onTap: () {
              context.push(
                '/dxs/${Uri.encodeComponent(diagnosisName)}/${Uri.encodeComponent(diagnosis.name)}',
              );
            },
            hoverColor: Colors.grey[100],
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(vertical: 16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xFFEDEDED))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBFBF3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset('assets/body_regions.jpg'),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 12,
                          children: [
                            Text(
                              diagnosis.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryDark,
                              ),
                            ),
                            ExploreText(),
                          ],
                        ),
                        Text(diagnosis.description),
                        if (diagnosis.previousNames.isNotEmpty == true)
                          Text(
                            'Previously known as: ${diagnosis.previousNames.join(', ')}',
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.folder_open, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    } else {
      // Fallback if no data is available
      diagnosisWidgets.add(
        Container(
          padding: EdgeInsets.all(16.0),
          child: Text('No diagnoses available for this region.'),
        ),
      );
    }

    return diagnosisWidgets;
  }
}
