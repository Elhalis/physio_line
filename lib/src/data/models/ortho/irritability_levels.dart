import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'irritability_levels.g.dart';

@JsonSerializable()
class IrritabilityLevels extends Equatable {
  final List<String>? high;
  final List<String>? moderate;
  final List<String>? low;

  const IrritabilityLevels({this.high, this.moderate, this.low});

  factory IrritabilityLevels.fromJson(Map<String, dynamic> json) {
    return _$IrritabilityLevelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IrritabilityLevelsToJson(this);

  IrritabilityLevels copyWith({
    List<String>? high,
    List<String>? moderate,
    List<String>? low,
  }) {
    return IrritabilityLevels(
      high: high ?? this.high,
      moderate: moderate ?? this.moderate,
      low: low ?? this.low,
    );
  }

  @override
  List<Object?> get props => [high, moderate, low];
}
