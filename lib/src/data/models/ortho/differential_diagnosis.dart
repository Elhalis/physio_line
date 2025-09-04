import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'differential_diagnosis.g.dart';

@JsonSerializable()
class DifferentialDiagnosis extends Equatable {
  final List<String>? assessments;

  const DifferentialDiagnosis({this.assessments});

  factory DifferentialDiagnosis.fromJson(Map<String, dynamic> json) {
    return _$DifferentialDiagnosisFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DifferentialDiagnosisToJson(this);

  DifferentialDiagnosis copyWith({List<String>? assessments}) {
    return DifferentialDiagnosis(assessments: assessments ?? this.assessments);
  }

  @override
  List<Object?> get props => [assessments];
}
