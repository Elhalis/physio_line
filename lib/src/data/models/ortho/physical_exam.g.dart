// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'physical_exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhysicalExam _$PhysicalExamFromJson(Map<String, dynamic> json) => PhysicalExam(
  keyFindings: json['key_findings'] == null
      ? null
      : KeyFindings.fromJson(json['key_findings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PhysicalExamToJson(PhysicalExam instance) =>
    <String, dynamic>{'key_findings': instance.keyFindings};
