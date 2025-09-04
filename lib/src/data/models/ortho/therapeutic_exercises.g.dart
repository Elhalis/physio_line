// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapeutic_exercises.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapeuticExercises _$TherapeuticExercisesFromJson(
  Map<String, dynamic> json,
) => TherapeuticExercises(
  irritabilityLevels: json['irritability_levels'] == null
      ? null
      : IrritabilityLevels.fromJson(
          json['irritability_levels'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TherapeuticExercisesToJson(
  TherapeuticExercises instance,
) => <String, dynamic>{'irritability_levels': instance.irritabilityLevels};
