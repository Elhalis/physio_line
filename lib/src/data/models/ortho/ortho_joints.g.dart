// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ortho_joints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrthoJoints _$OrthoJointsFromJson(Map<String, dynamic> json) => OrthoJoints(
  shoulder: json['shoulder'] == null
      ? null
      : Shoulder.fromJson(json['shoulder'] as Map<String, dynamic>),
  knee: json['knee'] == null
      ? null
      : Knee.fromJson(json['knee'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrthoJointsToJson(OrthoJoints instance) =>
    <String, dynamic>{'shoulder': instance.shoulder, 'knee': instance.knee};
