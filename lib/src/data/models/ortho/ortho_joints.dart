import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'knee.dart';
import 'shoulder.dart';

part 'ortho_joints.g.dart';

@JsonSerializable()
class OrthoJoints extends Equatable {
  final Shoulder? shoulder;
  final Knee? knee;

  const OrthoJoints({this.shoulder, this.knee});

  factory OrthoJoints.fromJson(Map<String, dynamic> json) {
    return _$OrthoJointsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrthoJointsToJson(this);

  OrthoJoints copyWith({Shoulder? shoulder, Knee? knee}) {
    return OrthoJoints(
      shoulder: shoulder ?? this.shoulder,
      knee: knee ?? this.knee,
    );
  }

  @override
  List<Object?> get props => [shoulder, knee];
}
