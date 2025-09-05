import 'package:go_router/go_router.dart';
import 'package:physio_line/src/presentation/screens/region_pages/dxs/dx_pages/prevalence.dart';
import 'package:physio_line/src/presentation/screens/home.dart';
import 'package:physio_line/src/presentation/screens/ortho.dart';
import 'package:physio_line/src/presentation/screens/region_page.dart';
import 'package:physio_line/src/presentation/screens/region_pages/clinical_recognition/clinical_pattern_page.dart';
import 'package:physio_line/src/presentation/screens/region_pages/practical_guidlines/practice_guidelines_page.dart';
import 'package:physio_line/src/presentation/screens/region_pages/clinical_recognition/all_diagnosis_page.dart';
import 'package:physio_line/src/presentation/screens/region_pages/qiuck_acess/physical_exam_page.dart';
import 'package:physio_line/src/presentation/screens/region_pages/qiuck_acess/movement_faults_page.dart';
import 'package:physio_line/src/presentation/screens/region_pages/qiuck_acess/manual_therapy_page.dart';
import 'package:physio_line/src/presentation/screens/region_pages/qiuck_acess/therapeutic_exercises_page.dart';
import 'package:physio_line/src/presentation/screens/region_pages/qiuck_acess/rehabilitation_progression_page.dart';

import '../screens/region_pages/dxs/dx_pages/diagnosis_page.dart';
import '../screens/region_pages/dxs/dx_pages/tx_pages/interventions.dart';
import '../screens/region_pages/dxs/dx_pages/clinical_finding_page.dart';
import '../screens/region_pages/dxs/dx_pages/tx_pages/exercise_page.dart';

class AppRoutes {
  static GoRouter get router => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),

      GoRoute(
        path: '/ortho',
        builder: (context, state) => const OrthopedicPage(),
      ),
      GoRoute(
        path: '/exercise',
        builder: (context, state) => const ExercisePage(),
      ),

      GoRoute(
        path: '/ortho/:name',
        builder: (context, state) {
          final name = state.pathParameters['name'] ?? 'Unknown';
          return RegionPage(name: name);
        },
      ),

      // Clinical Pattern Recognition
      GoRoute(
        path: '/:regionName_clinical_pattern',
        builder: (context, state) {
          // Extract region name from the full parameter
          final fullParam =
              state.pathParameters['regionName_clinical_pattern'] ?? '';
          final regionName = fullParam.replaceAll('_clinical_pattern', '');

          return ClinicalPatternPage(regionName: regionName);
        },
      ),

      // Clinical Practice Guidelines
      GoRoute(
        path: '/:regionName_practice_guidlines',
        builder: (context, state) {
          final fullParam =
              state.pathParameters['regionName_practice_guidlines'] ?? '';
          final regionName = fullParam.replaceAll('_practice_guidlines', '');

          return PracticeGuidelinesPage(regionName: regionName);
        },
      ),

      // All Diagnosis
      GoRoute(
        path: '/dxs/:name',
        builder: (context, state) {
          final dxName = state.pathParameters['name'] ?? 'Unknown Diagnosis';

          // Decode in case it had spaces
          return AllDiseasePage(diagnosisName: Uri.decodeComponent(dxName));
        },
      ),

      // Physical Exam
      GoRoute(
        path: '/:regionName_exam',
        builder: (context, state) {
          final fullParam = state.pathParameters['regionName_exam'] ?? '';
          final regionName = fullParam.replaceAll('_exam', '');

          return PhysicalExamPage(regionName: regionName);
        },
      ),

      // Movement Faults
      GoRoute(
        path: '/:regionName_fault',
        builder: (context, state) {
          final fullParam = state.pathParameters['regionName_fault'] ?? '';
          final regionName = fullParam.replaceAll('_fault', '');

          return MovementFaultsPage(regionName: regionName);
        },
      ),

      // Manual Therapy
      GoRoute(
        path: '/:regionName_manual',
        builder: (context, state) {
          final fullParam = state.pathParameters['regionName_manual'] ?? '';
          final regionName = fullParam.replaceAll('_manual', '');

          return ManualTherapyPage(regionName: regionName);
        },
      ),

      // Therapeutic Exercises
      GoRoute(
        path: '/:regionName_exs',
        builder: (context, state) {
          final fullParam = state.pathParameters['regionName_exs'] ?? '';
          final regionName = fullParam.replaceAll('_exs', '');

          return TherapeuticExercisesPage(regionName: regionName);
        },
      ),

      // Rehabilitation Progression
      GoRoute(
        path: '/:regionName_progress',
        builder: (context, state) {
          final fullParam = state.pathParameters['regionName_progress'] ?? '';
          final regionName = fullParam.replaceAll('_progress', '');

          return RehabilitationProgressionPage(regionName: regionName);
        },
      ),

      // Disease Page Route
      GoRoute(
        path: '/dxs/:dxName/:diseaseName',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? 'Unknown Dx',
          );
          final diseaseName = Uri.decodeComponent(
            state.pathParameters['diseaseName'] ?? 'Unknown Disease',
          );

          return DiseasePage(dxName: dxName, diseaseName: diseaseName);
        },
      ),

      // Clinical Findings Page
      GoRoute(
        path: '/dx/:dxName/:diseaseName/clinical_findings',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final diseaseName = Uri.decodeComponent(
            state.pathParameters['diseaseName'] ?? '',
          );

          return ClinicalFindingPage(dxName: dxName, diseaseName: diseaseName);
        },
      ),

      // Prevalence Page
      GoRoute(
        path: '/dx/:dxName/:diseaseName/prevalence',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final diseaseName = Uri.decodeComponent(
            state.pathParameters['diseaseName'] ?? '',
          );

          return PrevalencePage(dxName: dxName, diseaseName: diseaseName);
        },
      ),
      // physical_exam
      GoRoute(
        path: '/dx/:dxName/:diseaseName/physical_exam',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          // final diseaseName = Uri.decodeComponent(state.pathParameters['diseaseName'] ?? '');

          return PhysicalExamPage(regionName: dxName);
        },
      ),
      // interventions
      GoRoute(
        path: '/dx/:dxName/:diseaseName/interventions',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final diseaseName = Uri.decodeComponent(
            state.pathParameters['diseaseName'] ?? '',
          );

          return InterventionsPage(dxName: dxName, diseaseName: diseaseName);
        },
      ),
      // outcomes
      GoRoute(
        path: '/dx/:dxName/:diseaseName/outcomes',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final diseaseName = Uri.decodeComponent(
            state.pathParameters['diseaseName'] ?? '',
          );

          return PrevalencePage(dxName: dxName, diseaseName: diseaseName);
        },
      ),
    ],
  );
}
