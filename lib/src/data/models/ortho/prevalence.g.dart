// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prevalence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prevalence _$PrevalenceFromJson(Map<String, dynamic> json) => Prevalence(
  prevalenceStatistics: (json['prevalence_statistics'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  incidenceData: (json['incidence_data'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$PrevalenceToJson(Prevalence instance) =>
    <String, dynamic>{
      'prevalence_statistics': instance.prevalenceStatistics,
      'incidence_data': instance.incidenceData,
    };
