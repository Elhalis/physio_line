import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clinical_findings.g.dart';

@JsonSerializable()
class ClinicalFindings extends Equatable {
  final List<String>? history;
  @JsonKey(name: 'reported_findings')
  final List<String>? reportedFindings;
  @JsonKey(name: 'examination_findings')
  final List<String>? examinationFindings;
  @JsonKey(name: 'primary_survey')
  final List<String>? primarySurvey;
  @JsonKey(name: 'secondary_survey')
  final List<String>? secondarySurvey;

  const ClinicalFindings({
    this.history,
    this.reportedFindings,
    this.examinationFindings,
    this.primarySurvey,
    this.secondarySurvey,
  });

  factory ClinicalFindings.fromJson(Map<String, dynamic> json) {
    return _$ClinicalFindingsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClinicalFindingsToJson(this);

  ClinicalFindings copyWith({
    List<String>? history,
    List<String>? reportedFindings,
    List<String>? examinationFindings,
    List<String>? primarySurvey,
    List<String>? secondarySurvey,
  }) {
    return ClinicalFindings(
      history: history ?? this.history,
      reportedFindings: reportedFindings ?? this.reportedFindings,
      examinationFindings: examinationFindings ?? this.examinationFindings,
      primarySurvey: primarySurvey ?? this.primarySurvey,
      secondarySurvey: secondarySurvey ?? this.secondarySurvey,
    );
  }

  @override
  List<Object?> get props {
    return [
      history,
      reportedFindings,
      examinationFindings,
      primarySurvey,
      secondarySurvey,
    ];
  }
}
