// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scapular_taping_for_tilting_and_anterior_glide.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScapularTapingForTiltingAndAnteriorGlide
_$ScapularTapingForTiltingAndAnteriorGlideFromJson(Map<String, dynamic> json) =>
    ScapularTapingForTiltingAndAnteriorGlide(
      purpose: (json['purpose'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      gradeOfRecommendation: (json['grade_of_recommendation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      info: (json['info'] as List<dynamic>?)?.map((e) => e as String).toList(),
      associatedIcfCategory: (json['associated_icf_category'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      patientPosition: (json['patient_position'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      therapistPosition: (json['therapist_position'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cues: json['cues'] == null
          ? null
          : Cues.fromJson(json['cues'] as Map<String, dynamic>),
      additionalInfo: (json['additional_info'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      relatedObjectiveMeasurement:
          (json['related_objective_measurement'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$ScapularTapingForTiltingAndAnteriorGlideToJson(
  ScapularTapingForTiltingAndAnteriorGlide instance,
) => <String, dynamic>{
  'purpose': instance.purpose,
  'grade_of_recommendation': instance.gradeOfRecommendation,
  'info': instance.info,
  'associated_icf_category': instance.associatedIcfCategory,
  'patient_position': instance.patientPosition,
  'therapist_position': instance.therapistPosition,
  'cues': instance.cues,
  'additional_info': instance.additionalInfo,
  'related_objective_measurement': instance.relatedObjectiveMeasurement,
};
