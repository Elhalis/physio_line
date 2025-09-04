import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'anti_kyphosis_taping.dart';
import 'scapular_taping_for_tilting_and_anterior_glide.dart';

part 'modalities.g.dart';

@JsonSerializable()
class Modalities extends Equatable {
  @JsonKey(name: 'anti_kyphosis_taping')
  final AntiKyphosisTaping? antiKyphosisTaping;
  @JsonKey(name: 'scapular_taping_for_tilting_and_anterior_glide')
  final ScapularTapingForTiltingAndAnteriorGlide?
  scapularTapingForTiltingAndAnteriorGlide;

  const Modalities({
    this.antiKyphosisTaping,
    this.scapularTapingForTiltingAndAnteriorGlide,
  });

  factory Modalities.fromJson(Map<String, dynamic> json) {
    return _$ModalitiesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ModalitiesToJson(this);

  Modalities copyWith({
    AntiKyphosisTaping? antiKyphosisTaping,
    ScapularTapingForTiltingAndAnteriorGlide?
    scapularTapingForTiltingAndAnteriorGlide,
  }) {
    return Modalities(
      antiKyphosisTaping: antiKyphosisTaping ?? this.antiKyphosisTaping,
      scapularTapingForTiltingAndAnteriorGlide:
          scapularTapingForTiltingAndAnteriorGlide ??
          this.scapularTapingForTiltingAndAnteriorGlide,
    );
  }

  @override
  List<Object?> get props {
    return [antiKyphosisTaping, scapularTapingForTiltingAndAnteriorGlide];
  }
}
