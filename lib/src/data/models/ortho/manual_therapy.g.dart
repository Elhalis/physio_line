// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_therapy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManualTherapy _$ManualTherapyFromJson(Map<String, dynamic> json) =>
    ManualTherapy(
      jointMobilizations: (json['joint_mobilizations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      softTissueTechniques: (json['soft_tissue_techniques'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ManualTherapyToJson(ManualTherapy instance) =>
    <String, dynamic>{
      'joint_mobilizations': instance.jointMobilizations,
      'soft_tissue_techniques': instance.softTissueTechniques,
    };
