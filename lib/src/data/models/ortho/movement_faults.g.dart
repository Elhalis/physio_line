// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_faults.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovementFaults _$MovementFaultsFromJson(Map<String, dynamic> json) =>
    MovementFaults(
      scapularFaults: (json['scapular_faults'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      humeralFaults: (json['humeral_faults'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      thoracicFaults: (json['thoracic_faults'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MovementFaultsToJson(MovementFaults instance) =>
    <String, dynamic>{
      'scapular_faults': instance.scapularFaults,
      'humeral_faults': instance.humeralFaults,
      'thoracic_faults': instance.thoracicFaults,
    };
