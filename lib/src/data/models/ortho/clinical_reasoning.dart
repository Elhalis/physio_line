import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clinical_reasoning.g.dart';

@JsonSerializable()
class ClinicalReasoning extends Equatable {
  final List<String>? assessments;

  const ClinicalReasoning({this.assessments});

  factory ClinicalReasoning.fromJson(Map<String, dynamic> json) {
    return _$ClinicalReasoningFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClinicalReasoningToJson(this);

  ClinicalReasoning copyWith({List<String>? assessments}) {
    return ClinicalReasoning(assessments: assessments ?? this.assessments);
  }

  @override
  List<Object?> get props => [assessments];
}
