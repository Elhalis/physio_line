import 'package:physio_line/src/data/models/ortho_model.dart';

class DataHelper {
  static dynamic getRegionData(OrthoJoints orthoData, String regionName) {
    return orthoData.joints[regionName.toLowerCase()];
  }

  static List<String> getAvailableJoints(OrthoJoints orthoData) {
    return orthoData.joints.keys.toList();
  }

  static Diagnosis? getDiagnosisDetails(
    OrthoJoints orthoData,
    String regionName,
    String diagnosisKey,
  ) {
    final regionData = getRegionData(orthoData, regionName);
    if (regionData == null) return null;

    // Iterate through all_diagnoses to find a match by Diagnosis.name
    final allDiagnosesMap = regionData
        .clinicalPatternRecognition
        .clinicalPracticeGuidelines
        .allDiagnoses;
    for (final diagnosis in allDiagnosesMap.values) {
      if (diagnosis.name.toLowerCase() == diagnosisKey.toLowerCase()) {
        return diagnosis;
      }
    }
    return null; // No matching diagnosis found
  }
}
