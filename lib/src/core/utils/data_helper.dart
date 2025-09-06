// data_helper.dart
import 'package:flutter/material.dart';
import 'package:physio_line/src/data/models/ortho_model.dart';

class DataHelper {
  static dynamic getRegionData(OrthoJoints orthoData, String regionName) {
    switch (regionName.toLowerCase()) {
      case 'shoulder':
        return orthoData.joints['shoulder'];
      case 'knee':
        return orthoData.joints['knee'];
      case 'elbow':
        return orthoData.joints['elbow'];
      case 'hip':
        return orthoData.joints['hip'];
      case 'spine':
        return orthoData.joints['spine'];
      default:
        return null;
    }
  }

  static List<Diagnosis>? getDiagnoses(
    OrthoJoints orthoData,
    String regionName,
  ) {
    final regionData = getRegionData(orthoData, regionName);
    return regionData
        ?.clinicalPatternRecognition
        .clinicalPracticeGuidelines
        .allDiagnoses;
  }

  static Diagnosis? getDiagnosisByName(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
  ) {
    final diagnoses = getDiagnoses(orthoData, regionName);
    if (diagnoses == null) return null;

    try {
      return diagnoses.firstWhere(
        (diagnosis) =>
            diagnosis.name.toLowerCase() == diagnosisName.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  static List<String>? getPrevalenceData(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    return diagnosis?.prevalence.prevalenceStatistics;
  }

  static List<String>? getClinicalFindings(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
    String findingType,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    if (diagnosis?.clinicalFindings == null) return null;

    switch (findingType.toLowerCase()) {
      case 'history':
        return diagnosis!.clinicalFindings.history;
      case 'reported_findings':
        return diagnosis!.clinicalFindings.reportedFindings;
      case 'examination_findings':
        return diagnosis!.clinicalFindings.examinationFindings;
      case 'primary_survey':
        return diagnosis!.clinicalFindings.primarySurvey;
      case 'secondary_survey':
        return diagnosis!.clinicalFindings.secondarySurvey;
      default:
        return null;
    }
  }

  static List<String>? getInterventions(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
    String interventionType, [
    String? irritabilityLevel,
  ]) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    if (diagnosis?.interventions == null) return null;

    switch (interventionType.toLowerCase()) {
      case 'manual_therapy_joint':
        return diagnosis!.interventions.manualTherapy.jointMobilizations;
      case 'manual_therapy_soft_tissue':
        return diagnosis!.interventions.manualTherapy.softTissueTechniques;
      case 'therapeutic_exercises':
        if (irritabilityLevel != null) {
          switch (irritabilityLevel.toLowerCase()) {
            case 'high':
              return diagnosis!
                  .interventions
                  .therapeuticExercises
                  .irritabilityLevels
                  .high;
            case 'moderate':
              return diagnosis!
                  .interventions
                  .therapeuticExercises
                  .irritabilityLevels
                  .moderate;
            case 'low':
              return diagnosis!
                  .interventions
                  .therapeuticExercises
                  .irritabilityLevels
                  .low;
            default:
              return null;
          }
        }
        return null;
      case 'functional_movement':
        return diagnosis!.interventions.functionalMovement;
      default:
        return null;
    }
  }

  static List<String>? getPatientEducation(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
    String educationType,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    if (diagnosis?.patientEducation == null) return null;

    switch (educationType.toLowerCase()) {
      case 'whats_going_on':
        return diagnosis!.patientEducation.whatsGoingOn;
      case 'how_long_will_it_take':
        return diagnosis!.patientEducation.howLongWillItTake;
      case 'what_we_will_do':
        return diagnosis!.patientEducation.whatWeWillDo;
      case 'what_you_can_do':
        return diagnosis!.patientEducation.whatYouCanDo;
      default:
        return null;
    }
  }

  static Map<String, Modality>? getModalities(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    return diagnosis?.modalities;
  }

  static Modality? getModalityByName(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
    String modalityName,
  ) {
    final modalities = getModalities(orthoData, regionName, diagnosisName);
    return modalities?[modalityName];
  }

  static List<String>? getOutcomeMeasures(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    return diagnosis?.outcomeMeasures;
  }

  static List<String>? getMovementFaults(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisName,
    String faultType,
  ) {
    final diagnosis = getDiagnosisByName(orthoData, regionName, diagnosisName);
    if (diagnosis?.movementFaults == null) return null;

    switch (faultType.toLowerCase()) {
      case 'scapular':
        return diagnosis!.movementFaults.scapularFaults;
      case 'humeral':
        return diagnosis!.movementFaults.humeralFaults;
      case 'thoracic':
        return diagnosis!.movementFaults.thoracicFaults;
      default:
        return null;
    }
  }

  static List<String>? getQuickAccessData(
    OrthoJoints orthoData,
    String regionName,
    String accessType,
  ) {
    final regionData = getRegionData(orthoData, regionName);
    if (regionData == null) return null;

    switch (accessType.toLowerCase()) {
      case 'physical_exam':
        return regionData.clinicalPatternRecognition.physicalExam.content
            .cast<String>();
      case 'movement_faults':
        return regionData.clinicalPatternRecognition.movementFaults.content
            .cast<String>();
      case 'special_tests':
        return regionData.clinicalPatternRecognition.specialTests.content
            .cast<String>();
      case 'manual_therapy':
        return regionData.clinicalPatternRecognition.manualTherapy.content
            .cast<String>();
      case 'therapeutic_exercises':
        return regionData
            .clinicalPatternRecognition
            .therapeuticExercises
            .content
            .cast<String>();
      case 'rehabilitation_progression':
        return regionData
            .clinicalPatternRecognition
            .rehabilitationProgressionPyramid
            .content
            .cast<String>();
      default:
        return null;
    }
  }

  // New method to get clinical pattern recognition categories
  static Map<String, ClinicalCategory>? getClinicalPatternCategories(
    OrthoJoints orthoData,
    String regionName,
  ) {
    final regionData = getRegionData(orthoData, regionName);
    return regionData?.clinicalPatternRecognition.categories;
  }

  // New method to get common causes for a specific category
  static List<String>? getCommonCausesForCategory(
    OrthoJoints orthoData,
    String regionName,
    String categoryName,
  ) {
    final categories = getClinicalPatternCategories(orthoData, regionName);
    return categories?[categoryName]?.commonCauses;
  }

  // Helper method to get all available joint names
  static List<String> getAvailableJoints(OrthoJoints orthoData) {
    return orthoData.joints.keys.toList();
  }

  // Helper method to get all diagnoses for a region
  static List<String> getDiagnosisNames(
    OrthoJoints orthoData,
    String regionName,
  ) {
    final diagnoses = getDiagnoses(orthoData, regionName);
    if (diagnoses == null) return [];
    return diagnoses.map((diagnosis) => diagnosis.name).toList();
  }
}

// UI Helper class for building widgets
class UIHelper {
  static Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  static Widget buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text('• $item'),
            ),
          )
          .toList(),
    );
  }

  static Widget buildModalityCard(Modality modality, String modalityName) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              modalityName.replaceAll('_', ' ').toTitleCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            if (modality.purpose.isNotEmpty) ...[
              buildSectionTitle('Purpose'),
              buildBulletList(modality.purpose),
            ],
            if (modality.gradeOfRecommendation.isNotEmpty) ...[
              buildSectionTitle('Grade of Recommendation'),
              Text(modality.gradeOfRecommendation.join(', ')),
            ],
            if (modality.cues.isNotEmpty) ...[
              buildSectionTitle('Procedure'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: modality.cues.entries
                    .map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text('${entry.key}. ${entry.value}'),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Extension for string title case
extension StringExtension on String {
  String toTitleCase() {
    return split(' ')
        .map(
          (word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '',
        )
        .join(' ');
  }
}
