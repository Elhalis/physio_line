// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Knee _$KneeFromJson(Map<String, dynamic> json) => Knee(
  clinicalPatternRecognition: json['clinical_pattern_recognition'] == null
      ? null
      : ClinicalPatternRecognition.fromJson(
          json['clinical_pattern_recognition'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$KneeToJson(Knee instance) => <String, dynamic>{
  'clinical_pattern_recognition': instance.clinicalPatternRecognition,
};
