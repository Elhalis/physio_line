import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';
import 'package:physio_line/src/cubit/cubit.dart';
import 'package:physio_line/src/cubit/state.dart';
import 'package:physio_line/src/presentation/widget/base_page.dart';
import 'package:physio_line/src/presentation/widget/image_path_tile.dart';

class MovementFaultsPage extends StatelessWidget {
  final String dxName;
  final String diseaseName;

  const MovementFaultsPage({
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
            heading: 'Movement Faults',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is OrthoError) {
          return BasePage(
            heading: 'Movement Faults',
            subTitle: dxName,
            body: Center(child: Text('Error: ${state.message}')),
          );
        } else if (state is OrthoLoaded) {
          return _buildMovementFaultsContent(context, state.data);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OrthoCubit>().loadOrthoData();
          });
          return BasePage(
            heading: 'Movement Faults',
            subTitle: dxName,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildMovementFaultsContent(BuildContext context, dynamic orthoData) {
    return BasePage(
      heading: 'Movement Faults',
      subTitle: dxName,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Scapular Faults Section
            ImagePathTile(
              imgPath: Constants.bodyRegions,
              title: 'Overuse of ms and poor postue',
              path: '/falut_data',
            ),
          ],
        ),
      ),
    );
  }
}
