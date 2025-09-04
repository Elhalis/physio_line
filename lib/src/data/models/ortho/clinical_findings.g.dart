// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_findings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicalFindings _$ClinicalFindingsFromJson(Map<String, dynamic> json) =>
    ClinicalFindings(
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reportedFindings: (json['reported_findings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      examinationFindings: (json['examination_findings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      primarySurvey: (json['primary_survey'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      secondarySurvey: (json['secondary_survey'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ClinicalFindingsToJson(ClinicalFindings instance) =>
    <String, dynamic>{
      'history': instance.history,
      'reported_findings': instance.reportedFindings,
      'examination_findings': instance.examinationFindings,
      'primary_survey': instance.primarySurvey,
      'secondary_survey': instance.secondarySurvey,
    };
