// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_findings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyFindings _$KeyFindingsFromJson(Map<String, dynamic> json) => KeyFindings(
  tests: (json['tests'] as List<dynamic>?)?.map((e) => e as String).toList(),
  observationAndPalpation: (json['observation_and_palpation'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  rangeOfMotion: (json['range_of_motion'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  irritability: (json['irritability'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$KeyFindingsToJson(KeyFindings instance) =>
    <String, dynamic>{
      'tests': instance.tests,
      'observation_and_palpation': instance.observationAndPalpation,
      'range_of_motion': instance.rangeOfMotion,
      'irritability': instance.irritability,
    };
