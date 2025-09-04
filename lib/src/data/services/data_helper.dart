import '../models/ortho/ortho.dart';

class DataHelper {
  static dynamic getRegionData(Ortho orthoData, String regionName) {
    switch (regionName.toLowerCase()) {
      case 'shoulder':
        return orthoData.orthoJoints?.shoulder;
      case 'knee':
        return orthoData.orthoJoints?.knee;
      default:
        return null;
    }
  }

  static List<dynamic>? getDiagnoses(Ortho orthoData, String regionName) {
    final regionData = getRegionData(orthoData, regionName);
    return regionData
        ?.clinicalPatternRecognition
        ?.clinicalPracticeGuidelines
        ?.allDiagnoses;
  }

  static dynamic getDiagnosisByName(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
  ) {
    final diagnoses = getDiagnoses(orthoData, regionName);
    if (diagnoses == null) return null;

    return diagnoses.firstWhere(
      (diagnosis) =>
          diagnosis.name.toLowerCase() == diagnosisName.toLowerCase(),
      orElse: () => null,
    );
  }

  static List<String>? getPrevalenceData(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    return diagnosis?.prevalence?.prevalenceStatistics;
  }

  static List<String>? getClinicalFindings(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
    String findingType,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    if (diagnosis?.clinicalFindings == null) return null;

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

  static List<String>? getInterventions(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
    String interventionType,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    if (diagnosis?.interventions == null) return null;

    switch (interventionType.toLowerCase()) {
      case 'manual_therapy':
        return diagnosis.interventions.manualTherapy?.jointMobilizations;
      case 'therapeutic_exercises':
        return diagnosis
            .interventions
            .therapeuticExercises
            ?.irritabilityLevels
            ?.high;
      case 'functional_movement':
        return diagnosis.interventions.functionalMovement;
      default:
        return null;
    }
  }

  static List<String>? getPatientEducation(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
    String educationType,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    if (diagnosis?.patientEducation == null) return null;

    switch (educationType.toLowerCase()) {
      case 'whats_going_on':
        return diagnosis.patientEducation.whatsGoingOn;
      case 'how_long_will_it_take':
        return diagnosis.patientEducation.howLongWillItTake;
      case 'what_we_will_do':
        return diagnosis.patientEducation.whatWeWillDo;
      case 'what_you_can_do':
        return diagnosis.patientEducation.whatYouCanDo;
      default:
        return null;
    }
  }

  static List<String>? getQuickAccessData(
    Ortho orthoData,
    String regionName,
    String accessType,
  ) {
    final regionData = getRegionData(orthoData, regionName);
    if (regionData?.clinicalPatternRecognition == null) return null;

    switch (accessType.toLowerCase()) {
      case 'physical_exam':
        return regionData.clinicalPatternRecognition.physicalExam?.content;
      case 'movement_faults':
        return regionData.clinicalPatternRecognition.movementFaults?.content;
      case 'manual_therapy':
        return regionData.clinicalPatternRecognition.manualTherapy?.content;
      case 'therapeutic_exercises':
        return regionData
            .clinicalPatternRecognition
            .therapeuticExercises
            ?.content;
      case 'rehabilitation_progression':
        return regionData
            .clinicalPatternRecognition
            .rehabilitationProgressionPyramid
            ?.content;
      default:
        return null;
    }
  }
}
