// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'associated_impairments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociatedImpairments _$AssociatedImpairmentsFromJson(
  Map<String, dynamic> json,
) => AssociatedImpairments(
  assessments: (json['assessments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$AssociatedImpairmentsToJson(
  AssociatedImpairments instance,
) => <String, dynamic>{'assessments': instance.assessments};
