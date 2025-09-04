import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'associated_impairments.g.dart';

@JsonSerializable()
class AssociatedImpairments extends Equatable {
  final List<String>? assessments;

  const AssociatedImpairments({this.assessments});

  factory AssociatedImpairments.fromJson(Map<String, dynamic> json) {
    return _$AssociatedImpairmentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssociatedImpairmentsToJson(this);

  AssociatedImpairments copyWith({List<String>? assessments}) {
    return AssociatedImpairments(assessments: assessments ?? this.assessments);
  }

  @override
  List<Object?> get props => [assessments];
}
