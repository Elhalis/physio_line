import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';
import 'package:physio_line/src/core/utils/data_helper.dart';
import 'package:physio_line/src/cubit/cubit.dart';
import 'package:physio_line/src/cubit/state.dart';
import 'package:physio_line/src/presentation/widget/base_page.dart';
import 'package:physio_line/src/presentation/widget/image_path_tile.dart';
import 'package:physio_line/src/presentation/widget/reasoning_base_page.dart';

class DifferentialPage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const DifferentialPage({
    super.key,
    required this.dxName,
    required this.diseaseName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrthoCubit, OrthoState>(
      builder: (context, state) {
        if (state is OrthoLoading) {
          return BasePage(
            heading: 'Differential',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is OrthoError) {
          return BasePage(
            heading: 'Differential',
            subTitle: dxName,
            body: Center(child: Text('Error: ${state.message}')),
          );
        } else if (state is OrthoLoaded) {
          return _buildDifferentialContent(context, state.data);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OrthoCubit>().loadOrthoData();
          });
          return BasePage(
            heading: 'Differential',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildDifferentialContent(BuildContext context, dynamic orthoData) {
    final regionName = dxName.toLowerCase();

    // Get all diagnoses for the region to show differential options
    DataHelper.getDiagnoses(orthoData, regionName);

    // Filter out the current diagnosis to show differential options

    return ReasoningBasePage(
      backPath: 'physical exam',
      heading: 'Differential Diagnosis',
      diagnosis: diseaseName,
      path: '/reasoning',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagePathTile(
              imgPath: Constants.bodyRegions,
              title: 'Vital Sign assessment',
              path: '/vital',
            ),
            ImagePathTile(
              imgPath: Constants.bodyRegions,
              title: 'Quick screen',
              path: '/quick_screen',
            ),
            ImagePathTile(
              imgPath: Constants.bodyRegions,
              title: 'Ruling out',
              path: '/ruling_out',
            ),
            ImagePathTile(
              imgPath: Constants.bodyRegions,
              title: 'Special test',
              path: '/special_test',
            ),
          ],
        ),
      ),
    );
  }
}
