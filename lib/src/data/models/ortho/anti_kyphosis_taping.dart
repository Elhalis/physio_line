import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cues.dart';

part 'anti_kyphosis_taping.g.dart';

@JsonSerializable()
class AntiKyphosisTaping extends Equatable {
  final List<String>? purpose;
  @JsonKey(name: 'grade_of_recommendation')
  final List<String>? gradeOfRecommendation;
  final List<String>? info;
  @JsonKey(name: 'associated_icf_category')
  final List<String>? associatedIcfCategory;
  @JsonKey(name: 'patient_position')
  final List<String>? patientPosition;
  @JsonKey(name: 'therapist_position')
  final List<String>? therapistPosition;
  final Cues? cues;
  @JsonKey(name: 'additional_info')
  final List<String>? additionalInfo;
  @JsonKey(name: 'related_objective_measurement')
  final List<String>? relatedObjectiveMeasurement;

  const AntiKyphosisTaping({
    this.purpose,
    this.gradeOfRecommendation,
    this.info,
    this.associatedIcfCategory,
    this.patientPosition,
    this.therapistPosition,
    this.cues,
    this.additionalInfo,
    this.relatedObjectiveMeasurement,
  });

  factory AntiKyphosisTaping.fromJson(Map<String, dynamic> json) {
    return _$AntiKyphosisTapingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AntiKyphosisTapingToJson(this);

  AntiKyphosisTaping copyWith({
    List<String>? purpose,
    List<String>? gradeOfRecommendation,
    List<String>? info,
    List<String>? associatedIcfCategory,
    List<String>? patientPosition,
    List<String>? therapistPosition,
    Cues? cues,
    List<String>? additionalInfo,
    List<String>? relatedObjectiveMeasurement,
  }) {
    return AntiKyphosisTaping(
      purpose: purpose ?? this.purpose,
      gradeOfRecommendation:
          gradeOfRecommendation ?? this.gradeOfRecommendation,
      info: info ?? this.info,
      associatedIcfCategory:
          associatedIcfCategory ?? this.associatedIcfCategory,
      patientPosition: patientPosition ?? this.patientPosition,
      therapistPosition: therapistPosition ?? this.therapistPosition,
      cues: cues ?? this.cues,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      relatedObjectiveMeasurement:
          relatedObjectiveMeasurement ?? this.relatedObjectiveMeasurement,
    );
  }

  @override
  List<Object?> get props {
    return [
      purpose,
      gradeOfRecommendation,
      info,
      associatedIcfCategory,
      patientPosition,
      therapistPosition,
      cues,
      additionalInfo,
      relatedObjectiveMeasurement,
    ];
  }
}
