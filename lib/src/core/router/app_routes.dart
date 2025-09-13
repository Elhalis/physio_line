import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Added for Center and Text widgets
import 'package:physio_line/src/presentation/screens/region/clinical_recognition/category_page.dart';
import 'package:physio_line/src/presentation/screens/region/dxs/dx_pages/prevalence.dart';
import 'package:physio_line/src/presentation/screens/main/home.dart';
import 'package:physio_line/src/presentation/screens/main/ortho.dart';
import 'package:physio_line/src/presentation/screens/main/joint.dart';
import 'package:physio_line/src/presentation/screens/region/clinical_recognition/clinical_pattern_page.dart';
import 'package:physio_line/src/presentation/screens/region/practical_guidlines/practice_guidelines_page.dart';
import 'package:physio_line/src/presentation/screens/region/clinical_recognition/all_diagnosis_page.dart';
// Removed unused quick access imports after nesting region routes
import 'package:physio_line/src/data/models/ortho_model.dart'; // Added for Diagnosis model

import '../../presentation/screens/region/dxs/diagnosis_page.dart';
import '../../presentation/screens/region/dxs/dx_pages/tx_pages/interventions.dart';
import '../../presentation/screens/region/dxs/dx_pages/clinical_finding_page.dart';
import '../../presentation/screens/region/dxs/dx_pages/tx_pages/exercise_page.dart';
import '../../presentation/screens/region/dxs/dx_pages/outcome.dart';
import '../../presentation/screens/region/dxs/dx_pages/physical_exam/key_findings_page.dart';
import '../../presentation/screens/region/dxs/dx_pages/physical_exam/movement_faults_page.dart';
import '../../presentation/screens/region/dxs/dx_pages/physical_exam/associated_impairments_page.dart';
import '../../presentation/screens/region/dxs/dx_pages/physical_exam/differential_page.dart';
import '../../presentation/screens/region/qiuck_acess/physical_exam_page.dart';
import 'package:physio_line/src/presentation/screens/region/qiuck_acess/manual_therapy_page.dart';
import 'package:physio_line/src/presentation/screens/region/qiuck_acess/therapeutic_exercises_page.dart';
import 'package:physio_line/src/presentation/screens/region/qiuck_acess/rehabilitation_progression_page.dart';

class AppRoutes {
  static GoRouter get router => GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
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
          return RegionPage(region: name);
        },
      ),

      // Clinical Pattern Recognition (only match paths ending with _clinical_pattern)
      GoRoute(
        path: '/:region_clinical_pattern([^/]+_clinical_pattern)',
        builder: (context, state) {
          final fullParam =
              state.pathParameters['region_clinical_pattern'] ?? '';
          final region = fullParam.replaceAll('_clinical_pattern', '');
          if (kDebugMode) {
            print(
              '[ROUTE] ClinicalPattern -> fullParam: $fullParam, region: $region, location: ${state.uri}',
            );
          }
          return ClinicalPatternPage(regionName: region);
        },
      ),

      // REGION-NESTED ROUTES (new):
      // We nest all region sections under a single parent: /dxs/:region
      // WHY: Avoid greedy single-segment matches and keep region pages together.
      // Parent: Region landing -> All diagnoses for this region
      GoRoute(
        path: '/dxs/:region',
        builder: (context, state) {
          final region = Uri.decodeComponent(
            state.pathParameters['region'] ?? '',
          );
          if (kDebugMode) {
            print('[ROUTE] Region Base (/dxs/:region) -> region: $region');
          }
          return AllDiseasePage(diagnosisName: region);
        },
        routes: [
          // Child: Physical Exam for this region
          GoRoute(
            path: 'physical_exam',
            builder: (context, state) {
              final region = Uri.decodeComponent(
                state.pathParameters['region'] ?? '',
              );
              if (kDebugMode) {
                print('[ROUTE] Region Physical Exam -> region: $region');
              }
              return PhysicalExamPage(regionName: region);
            },
          ),
          // Child: Movement Faults for this region
          GoRoute(
            path: 'movement_faults',
            builder: (context, state) {
              final region = Uri.decodeComponent(
                state.pathParameters['region'] ?? '',
              );
              if (kDebugMode) {
                print('[ROUTE] Region Movement Faults -> region: $region');
              }
              // NOTE: Replace with dedicated region MovementFaultsPage when available
              return MovementFaultsPage(
                dxName: region,
                diagnosis: Diagnosis(
                  key: '',
                  name: 'Movement Faults',
                  previousNames: const [],
                  description: 'Movement faults for $region region',
                  prevalence: Prevalence(
                    prevalenceStatistics: const [],
                    incidenceData: const [],
                  ),
                  clinicalFindings: ClinicalFindings(
                    history: const [],
                    reportedFindings: const [],
                    examinationFindings: const [],
                    primarySurvey: const [],
                    secondarySurvey: const [],
                  ),
                  physicalExam: PhysicalExam(
                    keyFindings: KeyFindings(
                      tests: const [],
                      observationAndPalpation: const [],
                      rangeOfMotion: const [],
                      irritability: const [],
                    ),
                  ),
                  clinicalReasoning: ClinicalReasoning(assessments: const []),
                  movementFaults: MovementFaults(
                    scapularFaults: const [],
                    humeralFaults: const [],
                    thoracicFaults: const [],
                  ),
                  associatedImpairments: AssociatedImpairments(
                    assessments: const [],
                  ),
                  differentialDiagnosis: DifferentialDiagnosis(
                    assessments: const [],
                  ),
                  interventions: Interventions(
                    manualTherapy: ManualTherapy(
                      jointMobilizations: const [],
                      softTissueTechniques: const [],
                    ),
                    therapeuticExercises: TherapeuticExercises(
                      irritabilityLevels: IrritabilityLevels(
                        high: const [],
                        moderate: const [],
                        low: const [],
                      ),
                    ),
                    functionalMovement: const [],
                  ),
                  patientEducation: PatientEducation(
                    whatsGoingOn: const [],
                    howLongWillItTake: const [],
                    whatWeWillDo: const [],
                    whatYouCanDo: const [],
                  ),
                  modalities: const {},
                  outcomeMeasures: const [],
                ),
              );
            },
          ),
          // Child: Practice Guidelines for this region
          GoRoute(
            path: 'practice_guidelines',
            builder: (context, state) {
              final region = Uri.decodeComponent(
                state.pathParameters['region'] ?? '',
              );
              if (kDebugMode) {
                print('[ROUTE] Region Practice Guidelines -> region: $region');
              }
              return PracticeGuidelinesPage(regionName: region);
            },
          ),
          // Child: Manual Therapy for this region
          GoRoute(
            path: 'manual',
            builder: (context, state) {
              final region = Uri.decodeComponent(
                state.pathParameters['region'] ?? '',
              );
              return ManualTherapyPage(regionName: region);
            },
          ),
          // Child: Therapeutic Exercises for this region
          GoRoute(
            path: 'therapeutic_exercises',
            builder: (context, state) {
              final region = Uri.decodeComponent(
                state.pathParameters['region'] ?? '',
              );
              return TherapeuticExercisesPage(regionName: region);
            },
          ),
          // Child: Rehabilitation Progression for this region
          GoRoute(
            path: 'rehabilitation_progression',
            builder: (context, state) {
              final region = Uri.decodeComponent(
                state.pathParameters['region'] ?? '',
              );
              return RehabilitationProgressionPage(regionName: region);
            },
          ),
        ],
      ),

      // OPTIONAL: If you want these under /dxs/:region too, add children above
      // For now, keep their disease-level routes below

      // Disease Page Route
      GoRoute(
        path: '/dxs/:dxName/:diseaseName',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? 'Unknown Dx',
          );
          debugPrint(
            '[AppRoutes] Type of state.extra: ${state.extra.runtimeType}',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            // Handle case where diagnosis is not provided, maybe navigate to an error page or show a message.
            // For now, I'll return an empty container or an error widget.
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return DiseasePage(dxName: dxName, diagnosis: diagnosis);
        },
      ),

      // Physical Exam Page
      GoRoute(
        path: '/dxs/:dxName/:diseaseName/physical_exam',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return PhysicalExamPage(regionName: dxName);
        },
      ),

      // Clinical Findings Page
      GoRoute(
        path: '/dxs/:dxName/:diseaseName/clinical_findings',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return ClinicalFindingPage(dxName: dxName, diagnosis: diagnosis);
        },
      ),

      // Category route for CPR → Category drilldown, kept separate to avoid
      // colliding with the disease route under /dxs/:dxName/:diseaseName
      GoRoute(
        path: '/cpr/:dxName/:pattern',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? 'Unknown Dx',
          );
          final pattern = Uri.decodeComponent(
            state.pathParameters['pattern'] ?? 'Unknown pattern',
          );
          if (kDebugMode) {
            print('[ROUTE] CPR pattern -> dxName: $dxName, pattern: $pattern');
          }
          return CategoryPage(dxName: dxName, pattern: pattern);
        },
      ),

      // Prevalence Page
      GoRoute(
        path: '/dxs/:dxName/:diseaseName/prevalence',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return PrevalencePage(dxName: dxName, diagnosis: diagnosis);
        },
      ),

      // Interventions Page
      GoRoute(
        path: '/dxs/:dxName/:diseaseName/interventions',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return InterventionsPage(dxName: dxName, diagnosis: diagnosis);
        },
      ),

      // Outcomes Page
      GoRoute(
        path: '/dxs/:dxName/:diseaseName/outcomes',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return OutcomesPage(dxName: dxName, diagnosis: diagnosis);
        },
      ),

      // Physical Exam Subpages
      // Key Findings Page
      GoRoute(
        path: '/dxs/:dxName/:diseaseName/key_findings',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return KeyFindingsPage(dxName: dxName, diagnosis: diagnosis);
        },
      ),

      // Movement Faults Page
      GoRoute(
        path: '/dxs/:dxName/:diseaseName/movement_faults',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return MovementFaultsPage(dxName: dxName, diagnosis: diagnosis);
        },
      ),

      // Associated Impairments Page
      GoRoute(
        path: '/dxs/:dxName/:diseaseName/associated_impairments',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return AssociatedImpairmentsPage(
            dxName: dxName,
            diagnosis: diagnosis,
          );
        },
      ),

      // Differential Page
      GoRoute(
        path: '/dxs/:dxName/:diseaseName/differential',
        builder: (context, state) {
          final dxName = Uri.decodeComponent(
            state.pathParameters['dxName'] ?? '',
          );
          final Diagnosis? diagnosis = state.extra as Diagnosis?;

          if (diagnosis == null) {
            return const Center(child: Text('Diagnosis data not found.'));
          }

          return DifferentialPage(dxName: dxName, diagnosis: diagnosis);
        },
      ),
    ],
  );
}
