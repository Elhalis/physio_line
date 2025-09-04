import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_education.g.dart';

@JsonSerializable()
class PatientEducation extends Equatable {
  @JsonKey(name: 'whats_going_on')
  final List<String>? whatsGoingOn;
  @JsonKey(name: 'how_long_will_it_take')
  final List<String>? howLongWillItTake;
  @JsonKey(name: 'what_we_will_do')
  final List<String>? whatWeWillDo;
  @JsonKey(name: 'what_you_can_do')
  final List<String>? whatYouCanDo;

  const PatientEducation({
    this.whatsGoingOn,
    this.howLongWillItTake,
    this.whatWeWillDo,
    this.whatYouCanDo,
  });

  factory PatientEducation.fromJson(Map<String, dynamic> json) {
    return _$PatientEducationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientEducationToJson(this);

  PatientEducation copyWith({
    List<String>? whatsGoingOn,
    List<String>? howLongWillItTake,
    List<String>? whatWeWillDo,
    List<String>? whatYouCanDo,
  }) {
    return PatientEducation(
      whatsGoingOn: whatsGoingOn ?? this.whatsGoingOn,
      howLongWillItTake: howLongWillItTake ?? this.howLongWillItTake,
      whatWeWillDo: whatWeWillDo ?? this.whatWeWillDo,
      whatYouCanDo: whatYouCanDo ?? this.whatYouCanDo,
    );
  }

  @override
  List<Object?> get props {
    return [whatsGoingOn, howLongWillItTake, whatWeWillDo, whatYouCanDo];
  }
}
