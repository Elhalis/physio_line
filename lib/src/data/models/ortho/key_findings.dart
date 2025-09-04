import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'key_findings.g.dart';

@JsonSerializable()
class KeyFindings extends Equatable {
  final List<String>? tests;
  @JsonKey(name: 'observation_and_palpation')
  final List<String>? observationAndPalpation;
  @JsonKey(name: 'range_of_motion')
  final List<String>? rangeOfMotion;
  final List<String>? irritability;

  const KeyFindings({
    this.tests,
    this.observationAndPalpation,
    this.rangeOfMotion,
    this.irritability,
  });

  factory KeyFindings.fromJson(Map<String, dynamic> json) {
    return _$KeyFindingsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KeyFindingsToJson(this);

  KeyFindings copyWith({
    List<String>? tests,
    List<String>? observationAndPalpation,
    List<String>? rangeOfMotion,
    List<String>? irritability,
  }) {
    return KeyFindings(
      tests: tests ?? this.tests,
      observationAndPalpation:
          observationAndPalpation ?? this.observationAndPalpation,
      rangeOfMotion: rangeOfMotion ?? this.rangeOfMotion,
      irritability: irritability ?? this.irritability,
    );
  }

  @override
  List<Object?> get props {
    return [tests, observationAndPalpation, rangeOfMotion, irritability];
  }
}
