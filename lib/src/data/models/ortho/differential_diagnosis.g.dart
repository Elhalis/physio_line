// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'differential_diagnosis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DifferentialDiagnosis _$DifferentialDiagnosisFromJson(
  Map<String, dynamic> json,
) => DifferentialDiagnosis(
  assessments: (json['assessments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$DifferentialDiagnosisToJson(
  DifferentialDiagnosis instance,
) => <String, dynamic>{'assessments': instance.assessments};
