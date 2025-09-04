// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoulder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shoulder _$ShoulderFromJson(Map<String, dynamic> json) => Shoulder(
  clinicalPatternRecognition: json['clinical_pattern_recognition'] == null
      ? null
      : ClinicalPatternRecognition.fromJson(
          json['clinical_pattern_recognition'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ShoulderToJson(Shoulder instance) => <String, dynamic>{
  'clinical_pattern_recognition': instance.clinicalPatternRecognition,
};
