// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'irritability_levels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IrritabilityLevels _$IrritabilityLevelsFromJson(Map<String, dynamic> json) =>
    IrritabilityLevels(
      high: (json['high'] as List<dynamic>?)?.map((e) => e as String).toList(),
      moderate: (json['moderate'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      low: (json['low'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$IrritabilityLevelsToJson(IrritabilityLevels instance) =>
    <String, dynamic>{
      'high': instance.high,
      'moderate': instance.moderate,
      'low': instance.low,
    };
