// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_pattern_recognition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicalPatternRecognition _$ClinicalPatternRecognitionFromJson(
  Map<String, dynamic> json,
) => ClinicalPatternRecognition(
  clinicalPracticeGuidelines: json['clinical_practice_guidelines'] == null
      ? null
      : ClinicalPracticeGuidelines.fromJson(
          json['clinical_practice_guidelines'] as Map<String, dynamic>,
        ),
  quickAccess: json['quick_access'] == null
      ? null
      : QuickAccess.fromJson(json['quick_access'] as Map<String, dynamic>),
  physicalExam: json['physical_exam'] == null
      ? null
      : PhysicalExam.fromJson(json['physical_exam'] as Map<String, dynamic>),
  movementFaults: json['movement_faults'] == null
      ? null
      : MovementFaults.fromJson(
          json['movement_faults'] as Map<String, dynamic>,
        ),
  specialTests: json['special_tests'] == null
      ? null
      : SpecialTests.fromJson(json['special_tests'] as Map<String, dynamic>),
  manualTherapy: json['manual_therapy'] == null
      ? null
      : ManualTherapy.fromJson(json['manual_therapy'] as Map<String, dynamic>),
  therapeuticExercises: json['therapeutic_exercises'] == null
      ? null
      : TherapeuticExercises.fromJson(
          json['therapeutic_exercises'] as Map<String, dynamic>,
        ),
  rehabilitationProgressionPyramid:
      json['rehabilitation_progression_pyramid'] == null
      ? null
      : RehabilitationProgressionPyramid.fromJson(
          json['rehabilitation_progression_pyramid'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ClinicalPatternRecognitionToJson(
  ClinicalPatternRecognition instance,
) => <String, dynamic>{
  'clinical_practice_guidelines': instance.clinicalPracticeGuidelines,
  'quick_access': instance.quickAccess,
  'physical_exam': instance.physicalExam,
  'movement_faults': instance.movementFaults,
  'special_tests': instance.specialTests,
  'manual_therapy': instance.manualTherapy,
  'therapeutic_exercises': instance.therapeuticExercises,
  'rehabilitation_progression_pyramid':
      instance.rehabilitationProgressionPyramid,
};
