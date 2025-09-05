import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'all_diagnosis.dart';

part 'clinical_practice_guidelines.g.dart';

@JsonSerializable()
class ClinicalPracticeGuidelines extends Equatable {
  @JsonKey(name: 'all_diagnoses')
  final Map<String, AllDiagnosis>? allDiagnoses;

  const ClinicalPracticeGuidelines({this.allDiagnoses});

  factory ClinicalPracticeGuidelines.fromJson(Map<String, dynamic> json) {
    return _$ClinicalPracticeGuidelinesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClinicalPracticeGuidelinesToJson(this);

  ClinicalPracticeGuidelines copyWith({
    Map<String, AllDiagnosis>? allDiagnoses,
  }) {
    return ClinicalPracticeGuidelines(
      allDiagnoses: allDiagnoses ?? this.allDiagnoses,
    );
  }

  @override
  List<Object?> get props => [allDiagnoses];
}
