import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'manual_therapy.dart';
import 'therapeutic_exercises.dart';

part 'interventions.g.dart';

@JsonSerializable()
class Interventions extends Equatable {
  @JsonKey(name: 'manual_therapy')
  final ManualTherapy? manualTherapy;
  @JsonKey(name: 'therapeutic_exercises')
  final TherapeuticExercises? therapeuticExercises;
  @JsonKey(name: 'functional_movement')
  final List<String>? functionalMovement;

  const Interventions({
    this.manualTherapy,
    this.therapeuticExercises,
    this.functionalMovement,
  });

  factory Interventions.fromJson(Map<String, dynamic> json) {
    return _$InterventionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InterventionsToJson(this);

  Interventions copyWith({
    ManualTherapy? manualTherapy,
    TherapeuticExercises? therapeuticExercises,
    List<String>? functionalMovement,
  }) {
    return Interventions(
      manualTherapy: manualTherapy ?? this.manualTherapy,
      therapeuticExercises: therapeuticExercises ?? this.therapeuticExercises,
      functionalMovement: functionalMovement ?? this.functionalMovement,
    );
  }

  @override
  List<Object?> get props {
    return [manualTherapy, therapeuticExercises, functionalMovement];
  }
}
