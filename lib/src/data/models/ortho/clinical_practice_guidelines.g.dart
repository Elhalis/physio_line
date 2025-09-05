// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_practice_guidelines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicalPracticeGuidelines _$ClinicalPracticeGuidelinesFromJson(
  Map<String, dynamic> json,
) => ClinicalPracticeGuidelines(
  allDiagnoses: (json['all_diagnoses'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, AllDiagnosis.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$ClinicalPracticeGuidelinesToJson(
  ClinicalPracticeGuidelines instance,
) => <String, dynamic>{'all_diagnoses': instance.allDiagnoses};
