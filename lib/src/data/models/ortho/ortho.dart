import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ortho_joints.dart';

part 'ortho.g.dart';

@JsonSerializable()
class Ortho extends Equatable {
  @JsonKey(name: 'ortho_joints')
  final OrthoJoints? orthoJoints;

  const Ortho({this.orthoJoints});

  factory Ortho.fromJson(Map<String, dynamic> json) => _$OrthoFromJson(json);

  Map<String, dynamic> toJson() => _$OrthoToJson(this);

  Ortho copyWith({OrthoJoints? orthoJoints}) {
    return Ortho(orthoJoints: orthoJoints ?? this.orthoJoints);
  }

  @override
  List<Object?> get props => [orthoJoints];
}
