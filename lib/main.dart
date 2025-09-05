import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/core/theme/theme.dart';
import 'package:physio_line/src/data/repositories/ortho_repository.dart';
import 'package:physio_line/src/data/services/local_storage_service.dart';
import 'package:physio_line/src/logic/cubit.dart';
import 'package:physio_line/src/presentation/router/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize services and repository
    final orthoService = LocalDataService();
    final orthoRepository = OrthoRepository(orthoService);
    final orthoCubit = OrthoCubit(orthoRepository);

    return BlocProvider(
      create: (context) => orthoCubit,
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        title: 'Physio Line',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
