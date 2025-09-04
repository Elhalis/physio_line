// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interventions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Interventions _$InterventionsFromJson(Map<String, dynamic> json) =>
    Interventions(
      manualTherapy: json['manual_therapy'] == null
          ? null
          : ManualTherapy.fromJson(
              json['manual_therapy'] as Map<String, dynamic>,
            ),
      therapeuticExercises: json['therapeutic_exercises'] == null
          ? null
          : TherapeuticExercises.fromJson(
              json['therapeutic_exercises'] as Map<String, dynamic>,
            ),
      functionalMovement: (json['functional_movement'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InterventionsToJson(Interventions instance) =>
    <String, dynamic>{
      'manual_therapy': instance.manualTherapy,
      'therapeutic_exercises': instance.therapeuticExercises,
      'functional_movement': instance.functionalMovement,
    };
