// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modalities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Modalities _$ModalitiesFromJson(Map<String, dynamic> json) => Modalities(
  antiKyphosisTaping: json['anti_kyphosis_taping'] == null
      ? null
      : AntiKyphosisTaping.fromJson(
          json['anti_kyphosis_taping'] as Map<String, dynamic>,
        ),
  scapularTapingForTiltingAndAnteriorGlide:
      json['scapular_taping_for_tilting_and_anterior_glide'] == null
      ? null
      : ScapularTapingForTiltingAndAnteriorGlide.fromJson(
          json['scapular_taping_for_tilting_and_anterior_glide']
              as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ModalitiesToJson(Modalities instance) =>
    <String, dynamic>{
      'anti_kyphosis_taping': instance.antiKyphosisTaping,
      'scapular_taping_for_tilting_and_anterior_glide':
          instance.scapularTapingForTiltingAndAnteriorGlide,
    };
