import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'clinical_pattern_recognition.dart';

part 'shoulder.g.dart';

@JsonSerializable()
class Shoulder extends Equatable {
  @JsonKey(name: 'clinical_pattern_recognition')
  final ClinicalPatternRecognition? clinicalPatternRecognition;

  const Shoulder({this.clinicalPatternRecognition});

  factory Shoulder.fromJson(Map<String, dynamic> json) {
    return _$ShoulderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ShoulderToJson(this);

  Shoulder copyWith({ClinicalPatternRecognition? clinicalPatternRecognition}) {
    return Shoulder(
      clinicalPatternRecognition:
          clinicalPatternRecognition ?? this.clinicalPatternRecognition,
    );
  }

  @override
  List<Object?> get props => [clinicalPatternRecognition];
}
