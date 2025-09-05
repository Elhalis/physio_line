import 'package:flutter/foundation.dart';

import '../../data/models/ortho/ortho.dart';

class DataHelper {
  static dynamic getRegionData(Ortho orthoData, String regionName) {
    // Normalize the region name by removing any extra text that might be in the URL parameter
    final normalizedRegion = _normalizeRegionName(regionName);
    
    switch (normalizedRegion) {
      case 'shoulder':
        return orthoData.orthoJoints?.shoulder;
      case 'knee':
        return orthoData.orthoJoints?.knee;
      // add more regions here when models exist (e.g., 'hip', 'neck')
      default:
        return null;
    }
  }
  
  // Helper method to extract the actual region name from URL parameters or display text
  static String _normalizeRegionName(String input) {
    // Convert to lowercase for case-insensitive matching
    final lowercased = input.toLowerCase();
    
    // Check for known region names
    if (lowercased.contains('shoulder')) return 'shoulder';
    if (lowercased.contains('knee')) return 'knee';
    // Add more regions as needed
    
    // If no match found, return the original input (lowercase)
    return lowercased;
  }
  
  // Helper method to normalize diagnosis names for better matching
  static String _normalizeDiagnosisName(String input) {
    if (input.isEmpty) return '';
    
    // URL decode the input first (handles spaces encoded as %20, etc.)
    String decoded = Uri.decodeComponent(input);
    
    // Remove any special characters that might be in the URL but not in the JSON keys
    decoded = decoded.replaceAll(RegExp(r'[_-]'), ' ');
    
    // Known mappings for common diagnosis names
    final Map<String, String> knownMappings = {
     
      'sub acromial pain syndrome': 'Subacromial Pain Syndrome',
      'subacromial pain syndrome': 'Subacromial Pain Syndrome',
      // Add more mappings as needed
    };
    
    // Check if we have a direct mapping
    final lowercased = decoded.toLowerCase();
    for (final entry in knownMappings.entries) {
      if (lowercased == entry.key) {
        return entry.value;
      }
    }
    
    // If no direct mapping, return the decoded string
    return decoded;
  }

  static List<dynamic>? getDiagnoses(Ortho orthoData, String regionName) {
    final normalizedRegion = _normalizeRegionName(regionName);
    final regionData = getRegionData(orthoData, normalizedRegion);
    final all = regionData
        ?.clinicalPatternRecognition
        ?.clinicalPracticeGuidelines
        ?.allDiagnoses;
    if (all == null) return null;

    // Convert Map<String, AllDiagnosis> to List<AllDiagnosis>
    if (all is Map<String, dynamic>) {
      return all.values.toList();
    }

    // If older shape (list), just return it
    if (all is List<dynamic>) return all;
    return null;
  }

  static dynamic getDiagnosisByName(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
  ) {
    if (kDebugMode) {
      print('DEBUG: getDiagnosisByName called for region: $regionName, diagnosis: $diagnosisName');
    }
    
    // Normalize the region name
    final normalizedRegion = _normalizeRegionName(regionName);
    
    // Normalize the diagnosis name
    final normalizedDiagnosis = _normalizeDiagnosisName(diagnosisName);
    if (kDebugMode) {
      print('DEBUG: Normalized region: $normalizedRegion, normalized diagnosis: $normalizedDiagnosis');
    }
    
    final regionData = getRegionData(orthoData, normalizedRegion);
    final all = regionData
        ?.clinicalPatternRecognition
        ?.clinicalPracticeGuidelines
        ?.allDiagnoses;
    if (kDebugMode) {
      print('DEBUG: Found allDiagnoses: ${all != null}');
    }
    if (all == null) return null;

    // Direct lookup by key in the new structure
    if (all is Map<String, dynamic>) {
      if (kDebugMode) {
        print('DEBUG: Diagnoses available: ${all.keys.join(', ')}');
      }
      
      // Try exact match first
      if (all.containsKey(normalizedDiagnosis)) {
        if (kDebugMode) {
          print('DEBUG: Found exact match for: $normalizedDiagnosis');
        }
        return all[normalizedDiagnosis];
      }

      // Try case-insensitive match
      for (final key in all.keys) {
        if (key.toLowerCase() == normalizedDiagnosis.toLowerCase()) {
          if (kDebugMode) {
            print('DEBUG: Found case-insensitive match: $key');
          }
          return all[key];
        }
      }

      // Try partial match (for cases where the key might be different)
      for (final key in all.keys) {
        final keyLower = key.toLowerCase();
        final diagnosisLower = normalizedDiagnosis.toLowerCase();
        
        // Check for contains in either direction
        if (keyLower.contains(diagnosisLower) || diagnosisLower.contains(keyLower)) {
          if (kDebugMode) {
            print('DEBUG: Found partial match by contains: $key');
          }
          return all[key];
        }
        
        // Check for similarity by removing spaces and special characters
        final keySimplified = keyLower.replaceAll(RegExp(r'[\s-_,.]'), '');
        final diagnosisSimplified = diagnosisLower.replaceAll(RegExp(r'[\s-_,.]'), '');
        
        if (kDebugMode) {
          print('DEBUG: Comparing simplified: "$keySimplified" vs "$diagnosisSimplified"');
        }
        
        if (keySimplified.contains(diagnosisSimplified) || diagnosisSimplified.contains(keySimplified)) {
          if (kDebugMode) {
            print('DEBUG: Found match with simplified strings: $key');
          }
          return all[key];
        }
      }
      
      // Try matching by name field instead of key
      for (final entry in all.entries) {
        final diagnosis = entry.value;
        if (diagnosis.name != null && 
            diagnosis.name.toLowerCase().contains(normalizedDiagnosis.toLowerCase())) {
          return diagnosis;
        }
      }
    }

    // Fallback to old method for backward compatibility
    final diagnoses = getDiagnoses(orthoData, normalizedRegion);
    if (diagnoses == null) return null;

    try {
      return diagnoses.firstWhere(
        (diagnosis) => diagnosis.name != null && (
          diagnosis.name.toLowerCase().contains(normalizedDiagnosis.toLowerCase()) ||
          normalizedDiagnosis.toLowerCase().contains(diagnosis.name.toLowerCase())
        ),
        orElse: () => null,
      );
    } catch (e) {
      // If there's a type error, return null
      return null;
    }
  }

  static List<String>? getPrevalenceData(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
  ) {
    if (kDebugMode) {
      print('DEBUG: getPrevalenceData called for region: $regionName, diagnosis: $diagnosisName');
    }
    final normalizedRegion = _normalizeRegionName(regionName);
    final normalizedDiagnosis = _normalizeDiagnosisName(diagnosisName);
    if (kDebugMode) {
      print('DEBUG: Normalized region: $normalizedRegion, normalized diagnosis: $normalizedDiagnosis');
    }
    
    final diagnosis = getDiagnosisByName(orthoData, normalizedRegion, normalizedDiagnosis);
    if (kDebugMode) {
      print('DEBUG: Diagnosis found: ${diagnosis != null}');
    }
    
    if (diagnosis != null) {
      if (kDebugMode) {
        print('DEBUG: Diagnosis name: ${diagnosis.name}');
      }
      if (kDebugMode) {
        print('DEBUG: Has prevalence object: ${diagnosis.prevalence != null}');
      }
      if (diagnosis.prevalence != null) {
        if (kDebugMode) {
          print('DEBUG: prevalenceStatistics: ${diagnosis.prevalence.prevalenceStatistics}');
        }
        if (kDebugMode) {
          print('DEBUG: incidenceData: ${diagnosis.prevalence.incidenceData}');
        }
      }
    }
    
    // If prevalence statistics are null or empty, try to return incidence data as fallback
    if (diagnosis?.prevalence?.prevalenceStatistics == null || diagnosis?.prevalence?.prevalenceStatistics?.isEmpty == true) {
      if (kDebugMode) {
        print('DEBUG: Using incidence data as fallback');
      }
      return diagnosis?.prevalence?.incidenceData;
    }
    
    if (kDebugMode) {
      print('DEBUG: Using prevalence statistics');
    }
    return diagnosis?.prevalence?.prevalenceStatistics;
  }

  static List<String>? getClinicalFindings(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
    String findingType,
  ) {
    final normalizedRegion = _normalizeRegionName(regionName);
    final normalizedDiagnosis = _normalizeDiagnosisName(diagnosisName);
    final diagnosis = getDiagnosisByName(orthoData, normalizedRegion, normalizedDiagnosis);
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
  
  static List<String>? getPhysicalExamData(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
  ) {
    final normalizedRegion = _normalizeRegionName(regionName);
    final normalizedDiagnosis = _normalizeDiagnosisName(diagnosisName);
    final diagnosis = getDiagnosisByName(orthoData, normalizedRegion, normalizedDiagnosis);
    return diagnosis?.physicalExam?.examFindings;
  }

  static List<String>? getInterventions(
    Ortho orthoData,
    String regionName,
    String diagnosisName,
    String interventionType,
  ) {
    final normalizedRegion = _normalizeRegionName(regionName);
    final normalizedDiagnosis = _normalizeDiagnosisName(diagnosisName);
    final diagnosis = getDiagnosisByName(orthoData, normalizedRegion, normalizedDiagnosis);
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
    final normalizedRegion = _normalizeRegionName(regionName);
    final normalizedDiagnosis = _normalizeDiagnosisName(diagnosisName);
    final diagnosis = getDiagnosisByName(orthoData, normalizedRegion, normalizedDiagnosis);
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
    String diagnosisName,
    String accessType,
  ) {
    final normalizedRegion = _normalizeRegionName(regionName);
    final normalizedDiagnosis = _normalizeDiagnosisName(diagnosisName);
    final diagnosis = getDiagnosisByName(orthoData, normalizedRegion, normalizedDiagnosis);
    if (diagnosis == null) return null;

    switch (accessType.toLowerCase()) {
      case 'red_flags':
        return diagnosis.quickAccess?.redFlags;
      case 'yellow_flags':
        return diagnosis.quickAccess?.yellowFlags;
      case 'outcome_measures':
        return diagnosis.quickAccess?.outcomeMeasures;
      case 'differential_diagnosis':
        return diagnosis.quickAccess?.differentialDiagnosis;
      default:
        return null;
    }
  }
  
  static dynamic getRegionSectionData(
    Ortho orthoData,
    String regionName,
    String sectionType,
  ) {
    final normalizedRegion = _normalizeRegionName(regionName);
    final regionData = getRegionData(orthoData, normalizedRegion);
    if (regionData?.clinicalPatternRecognition == null) return null;

    switch (sectionType.toLowerCase()) {
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
