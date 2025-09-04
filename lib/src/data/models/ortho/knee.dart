import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'clinical_pattern_recognition.dart';

part 'knee.g.dart';

@JsonSerializable()
class Knee extends Equatable {
  @JsonKey(name: 'clinical_pattern_recognition')
  final ClinicalPatternRecognition? clinicalPatternRecognition;

  const Knee({this.clinicalPatternRecognition});

  factory Knee.fromJson(Map<String, dynamic> json) => _$KneeFromJson(json);

  Map<String, dynamic> toJson() => _$KneeToJson(this);

  Knee copyWith({ClinicalPatternRecognition? clinicalPatternRecognition}) {
    return Knee(
      clinicalPatternRecognition:
          clinicalPatternRecognition ?? this.clinicalPatternRecognition,
    );
  }

  @override
  List<Object?> get props => [clinicalPatternRecognition];
}
