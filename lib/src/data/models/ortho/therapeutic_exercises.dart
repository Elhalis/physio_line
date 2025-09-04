import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'irritability_levels.dart';

part 'therapeutic_exercises.g.dart';

@JsonSerializable()
class TherapeuticExercises extends Equatable {
  @JsonKey(name: 'irritability_levels')
  final IrritabilityLevels? irritabilityLevels;

  const TherapeuticExercises({this.irritabilityLevels});

  factory TherapeuticExercises.fromJson(Map<String, dynamic> json) {
    return _$TherapeuticExercisesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TherapeuticExercisesToJson(this);

  TherapeuticExercises copyWith({IrritabilityLevels? irritabilityLevels}) {
    return TherapeuticExercises(
      irritabilityLevels: irritabilityLevels ?? this.irritabilityLevels,
    );
  }

  @override
  List<Object?> get props => [irritabilityLevels];
}
