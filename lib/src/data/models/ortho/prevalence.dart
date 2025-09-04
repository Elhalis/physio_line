import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prevalence.g.dart';

@JsonSerializable()
class Prevalence extends Equatable {
  @JsonKey(name: 'prevalence_statistics')
  final List<String>? prevalenceStatistics;
  @JsonKey(name: 'incidence_data')
  final List<String>? incidenceData;

  const Prevalence({this.prevalenceStatistics, this.incidenceData});

  factory Prevalence.fromJson(Map<String, dynamic> json) {
    return _$PrevalenceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrevalenceToJson(this);

  Prevalence copyWith({
    List<String>? prevalenceStatistics,
    List<String>? incidenceData,
  }) {
    return Prevalence(
      prevalenceStatistics: prevalenceStatistics ?? this.prevalenceStatistics,
      incidenceData: incidenceData ?? this.incidenceData,
    );
  }

  @override
  List<Object?> get props => [prevalenceStatistics, incidenceData];
}
