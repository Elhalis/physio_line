// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ortho.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ortho _$OrthoFromJson(Map<String, dynamic> json) => Ortho(
  orthoJoints: json['ortho_joints'] == null
      ? null
      : OrthoJoints.fromJson(json['ortho_joints'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrthoToJson(Ortho instance) => <String, dynamic>{
  'ortho_joints': instance.orthoJoints,
};
