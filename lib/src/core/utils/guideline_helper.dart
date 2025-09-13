import 'package:physio_line/src/data/models/ortho_model.dart';
import 'data_helper.dart';

class GuidelineHelper {
  static ClinicalPracticeGuidelines? getPracticalGuidelines(
    OrthoJoints orthoData,
    String regionName,
  ) {
    return DataHelper.getRegionData(
      orthoData,
      regionName,
    )?.clinicalPracticeGuidelines;
  }

  static Map<String, ClinicalCategory>? getClinicalPatternCategories(
    OrthoJoints orthoData,
    String regionName,
  ) {
    return DataHelper.getRegionData(
      orthoData,
      regionName,
    )?.clinicalPatternRecognition.categories;
  }

  static List<String>? getCommonCausesForCategory(
    OrthoJoints orthoData,
    String regionName,
    String categoryName,
  ) {
    return getClinicalPatternCategories(
      orthoData,
      regionName,
    )?[categoryName]?.commonCauses;
  }

  // Returns diagnosis names that belong to a given clinical pattern category.
  // We use the category's common_causes list as keys to look up diagnoses
  // in the region's ClinicalPracticeGuidelines.allDiagnoses map.
  static List<String> getDiagnosisNamesForCategory(
    OrthoJoints orthoData,
    String regionName,
    String categoryName,
  ) {
    final categories = getClinicalPatternCategories(orthoData, regionName);
    if (categories == null) return [];
    final category = categories[categoryName];
    if (category == null) return [];

    final allDx = DataHelper.getRegionData(
      orthoData,
      regionName,
    )?.clinicalPracticeGuidelines.allDiagnoses;
    if (allDx == null) return [];

    final Set<String> diagnosisNames = {};
    for (final cause in category.commonCauses) {
      // Match either by key or by Diagnosis.name
      if (allDx.containsKey(cause)) {
        diagnosisNames.add(allDx[cause]!.name);
        continue;
      }
      // Fallback: find by name match (case-insensitive)
      final match = allDx.values.firstWhere(
        (d) => d.name.toLowerCase() == cause.toLowerCase(),
        orElse: () => Diagnosis(
          key: '',
          name: '',
          previousNames: const [],
          description: '',
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
          associatedImpairments: AssociatedImpairments(assessments: const []),
          differentialDiagnosis: DifferentialDiagnosis(assessments: const []),
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
      if (match.name.isNotEmpty) {
        diagnosisNames.add(match.name);
      }
    }

    return diagnosisNames.toList();
  }
}
