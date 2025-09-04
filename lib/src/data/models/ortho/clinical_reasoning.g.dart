// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_reasoning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicalReasoning _$ClinicalReasoningFromJson(Map<String, dynamic> json) =>
    ClinicalReasoning(
      assessments: (json['assessments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ClinicalReasoningToJson(ClinicalReasoning instance) =>
    <String, dynamic>{'assessments': instance.assessments};
