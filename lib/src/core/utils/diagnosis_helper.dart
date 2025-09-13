import 'package:physio_line/src/data/models/ortho_model.dart';
import 'data_helper.dart';

class DiagnosisHelper {
  // Existing methods ...

  static List<Diagnosis>? getDiagnoses(
    OrthoJoints orthoData,
    String regionName,
  ) {
    final regionData = DataHelper.getRegionData(orthoData, regionName);
    if (regionData == null) return null;
    return regionData
        .clinicalPatternRecognition
        .clinicalPracticeGuidelines
        .allDiagnoses
        .values
        .toList();
  }

  static Diagnosis? getDiagnosisByName(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
  ) {
    final regionData = DataHelper.getRegionData(orthoData, regionName);
    return regionData
        ?.clinicalPatternRecognition
        .clinicalPracticeGuidelines
        .allDiagnoses[diagnosisName];
  }

  static List<String>? getClinicalFindings(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
    String findingType,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    if (diagnosis == null) return null;

    switch (findingType.toLowerCase()) {
      case 'history':
        return diagnosis.clinicalFindings.history;
      case 'reported_findings':
        return diagnosis.clinicalFindings.reportedFindings;
      case 'examination_findings':
        return diagnosis.clinicalFindings.examinationFindings;
      case 'primary_survey':
        return diagnosis.clinicalFindings.primarySurvey;
      case 'secondary_survey':
        return diagnosis.clinicalFindings.secondarySurvey;
      default:
        return null;
    }
  }

  static List<String> getDiagnosisNames(
    OrthoJoints orthoData,
    String regionName,
  ) {
    final diagnoses = getDiagnoses(orthoData, regionName);
    return diagnoses?.map((d) => d.name).toList() ?? [];
  }

  static List<String>? getPrevalenceData(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    return diagnosis?.prevalence.prevalenceStatistics;
  }

  static List<String>? getOutcomeMeasures(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
  ) {
    return getDiagnosisByName(
      orthoData,
      regionName,
      diagnosisName,
    )?.outcomeMeasures;
  }

  static List<String>? getInterventions(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
    String interventionType, [
    String? irritabilityLevel,
  ]) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    if (diagnosis == null) return null;

    switch (interventionType.toLowerCase()) {
      case 'manual_therapy_joint':
        return diagnosis.interventions.manualTherapy.jointMobilizations;
      case 'manual_therapy_soft_tissue':
        return diagnosis.interventions.manualTherapy.softTissueTechniques;
      case 'therapeutic_exercises':
        if (irritabilityLevel != null) {
          switch (irritabilityLevel.toLowerCase()) {
            case 'high':
              return diagnosis
                  .interventions
                  .therapeuticExercises
                  .irritabilityLevels
                  .high;
            case 'moderate':
              return diagnosis
                  .interventions
                  .therapeuticExercises
                  .irritabilityLevels
                  .moderate;
            case 'low':
              return diagnosis
                  .interventions
                  .therapeuticExercises
                  .irritabilityLevels
                  .low;
          }
        }
        return null;
      case 'functional_movement':
        return diagnosis.interventions.functionalMovement;
      default:
        return null;
    }
  }
}
