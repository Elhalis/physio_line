import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'key_findings.dart';

part 'physical_exam.g.dart';

@JsonSerializable()
class PhysicalExam extends Equatable {
  @JsonKey(name: 'key_findings')
  final KeyFindings? keyFindings;

  const PhysicalExam({this.keyFindings});

  factory PhysicalExam.fromJson(Map<String, dynamic> json) {
    return _$PhysicalExamFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PhysicalExamToJson(this);

  PhysicalExam copyWith({KeyFindings? keyFindings}) {
    return PhysicalExam(keyFindings: keyFindings ?? this.keyFindings);
  }

  @override
  List<Object?> get props => [keyFindings];
}
