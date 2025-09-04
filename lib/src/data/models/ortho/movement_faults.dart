import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movement_faults.g.dart';

@JsonSerializable()
class MovementFaults extends Equatable {
  @JsonKey(name: 'scapular_faults')
  final List<String>? scapularFaults;
  @JsonKey(name: 'humeral_faults')
  final List<String>? humeralFaults;
  @JsonKey(name: 'thoracic_faults')
  final List<String>? thoracicFaults;

  const MovementFaults({
    this.scapularFaults,
    this.humeralFaults,
    this.thoracicFaults,
  });

  factory MovementFaults.fromJson(Map<String, dynamic> json) {
    return _$MovementFaultsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovementFaultsToJson(this);

  MovementFaults copyWith({
    List<String>? scapularFaults,
    List<String>? humeralFaults,
    List<String>? thoracicFaults,
  }) {
    return MovementFaults(
      scapularFaults: scapularFaults ?? this.scapularFaults,
      humeralFaults: humeralFaults ?? this.humeralFaults,
      thoracicFaults: thoracicFaults ?? this.thoracicFaults,
    );
  }

  @override
  List<Object?> get props {
    return [scapularFaults, humeralFaults, thoracicFaults];
  }
}
