import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manual_therapy.g.dart';

@JsonSerializable()
class ManualTherapy extends Equatable {
  @JsonKey(name: 'joint_mobilizations')
  final List<String>? jointMobilizations;
  @JsonKey(name: 'soft_tissue_techniques')
  final List<String>? softTissueTechniques;

  const ManualTherapy({this.jointMobilizations, this.softTissueTechniques});

  factory ManualTherapy.fromJson(Map<String, dynamic> json) {
    return _$ManualTherapyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ManualTherapyToJson(this);

  ManualTherapy copyWith({
    List<String>? jointMobilizations,
    List<String>? softTissueTechniques,
  }) {
    return ManualTherapy(
      jointMobilizations: jointMobilizations ?? this.jointMobilizations,
      softTissueTechniques: softTissueTechniques ?? this.softTissueTechniques,
    );
  }

  @override
  List<Object?> get props => [jointMobilizations, softTissueTechniques];
}
