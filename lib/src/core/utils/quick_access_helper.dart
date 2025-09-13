import 'package:physio_line/src/data/models/ortho_model.dart';
import 'data_helper.dart';

class QuickAccessHelper {
  static List<String>? getQuickAccessData(
    OrthoJoints orthoData,
    String regionName,
    String accessType,
  ) {
    final regionData = DataHelper.getRegionData(orthoData, regionName);
    if (regionData == null) return null;

    switch (accessType.toLowerCase()) {
      case 'physical_exam':
        return regionData.quickAccess.physicalExam.content.cast<String>();
      case 'movement_faults':
        return regionData.quickAccess.movementFaults.content.cast<String>();
      case 'special_tests':
        return regionData.quickAccess.specialTests.content.cast<String>();
      case 'manual_therapy':
        return regionData.quickAccess.manualTherapy.content.cast<String>();
      case 'therapeutic_exercises':
        return regionData.quickAccess.therapeuticExercises.content
            .cast<String>();
      case 'rehabilitation_progression_pyramid':
        return regionData.quickAccess.rehabilitationProgressionPyramid.content
            .cast<String>();
      default:
        return null;
    }
  }
}
