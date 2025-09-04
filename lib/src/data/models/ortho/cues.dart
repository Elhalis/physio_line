import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cues.g.dart';

@JsonSerializable()
class Cues extends Equatable {
  @JsonKey(name: '1')
  final String? step1;
  @JsonKey(name: '2')
  final String? step2;
  @JsonKey(name: '3')
  final String? step3;
  @JsonKey(name: '4')
  final String? step4;
  @JsonKey(name: '5')
  final String? step5;
  @JsonKey(name: '6')
  final String? step6;

  const Cues({
    this.step1,
    this.step2,
    this.step3,
    this.step4,
    this.step5,
    this.step6,
  });

  factory Cues.fromJson(Map<String, dynamic> json) => _$CuesFromJson(json);

  Map<String, dynamic> toJson() => _$CuesToJson(this);

  Cues copyWith({
    String? step1,
    String? step2,
    String? step3,
    String? step4,
    String? step5,
    String? step6,
  }) {
    return Cues(
      step1: step1 ?? this.step1,
      step2: step2 ?? this.step2,
      step3: step3 ?? this.step3,
      step4: step4 ?? this.step4,
      step5: step5 ?? this.step5,
      step6: step6 ?? this.step6,
    );
  }

  @override
  List<Object?> get props => [step1, step2, step3, step4, step5, step6];
}
