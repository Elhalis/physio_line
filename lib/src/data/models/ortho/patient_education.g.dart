// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientEducation _$PatientEducationFromJson(Map<String, dynamic> json) =>
    PatientEducation(
      whatsGoingOn: (json['whats_going_on'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      howLongWillItTake: (json['how_long_will_it_take'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      whatWeWillDo: (json['what_we_will_do'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      whatYouCanDo: (json['what_you_can_do'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PatientEducationToJson(PatientEducation instance) =>
    <String, dynamic>{
      'whats_going_on': instance.whatsGoingOn,
      'how_long_will_it_take': instance.howLongWillItTake,
      'what_we_will_do': instance.whatWeWillDo,
      'what_you_can_do': instance.whatYouCanDo,
    };
