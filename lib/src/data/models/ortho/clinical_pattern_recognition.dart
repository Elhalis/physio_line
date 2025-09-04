import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'clinical_practice_guidelines.dart';
import 'manual_therapy.dart';
import 'movement_faults.dart';
import 'physical_exam.dart';
import 'quick_access.dart';
import 'rehabilitation_progression_pyramid.dart';
import 'special_tests.dart';
import 'therapeutic_exercises.dart';

part 'clinical_pattern_recognition.g.dart';

@JsonSerializable()
class ClinicalPatternRecognition extends Equatable {
  @JsonKey(name: 'clinical_practice_guidelines')
  final ClinicalPracticeGuidelines? clinicalPracticeGuidelines;
  @JsonKey(name: 'quick_access')
  final QuickAccess? quickAccess;
  @JsonKey(name: 'physical_exam')
  final PhysicalExam? physicalExam;
  @JsonKey(name: 'movement_faults')
  final MovementFaults? movementFaults;
  @JsonKey(name: 'special_tests')
  final SpecialTests? specialTests;
  @JsonKey(name: 'manual_therapy')
  final ManualTherapy? manualTherapy;
  @JsonKey(name: 'therapeutic_exercises')
  final TherapeuticExercises? therapeuticExercises;
  @JsonKey(name: 'rehabilitation_progression_pyramid')
  final RehabilitationProgressionPyramid? rehabilitationProgressionPyramid;

  const ClinicalPatternRecognition({
    this.clinicalPracticeGuidelines,
    this.quickAccess,
    this.physicalExam,
    this.movementFaults,
    this.specialTests,
    this.manualTherapy,
    this.therapeuticExercises,
    this.rehabilitationProgressionPyramid,
  });

  factory ClinicalPatternRecognition.fromJson(Map<String, dynamic> json) {
    return _$ClinicalPatternRecognitionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClinicalPatternRecognitionToJson(this);

  ClinicalPatternRecognition copyWith({
    ClinicalPracticeGuidelines? clinicalPracticeGuidelines,
    QuickAccess? quickAccess,
    PhysicalExam? physicalExam,
    MovementFaults? movementFaults,
    SpecialTests? specialTests,
    ManualTherapy? manualTherapy,
    TherapeuticExercises? therapeuticExercises,
    RehabilitationProgressionPyramid? rehabilitationProgressionPyramid,
  }) {
    return ClinicalPatternRecognition(
      clinicalPracticeGuidelines:
          clinicalPracticeGuidelines ?? this.clinicalPracticeGuidelines,
      quickAccess: quickAccess ?? this.quickAccess,
      physicalExam: physicalExam ?? this.physicalExam,
      movementFaults: movementFaults ?? this.movementFaults,
      specialTests: specialTests ?? this.specialTests,
      manualTherapy: manualTherapy ?? this.manualTherapy,
      therapeuticExercises: therapeuticExercises ?? this.therapeuticExercises,
      rehabilitationProgressionPyramid:
          rehabilitationProgressionPyramid ??
          this.rehabilitationProgressionPyramid,
    );
  }

  @override
  List<Object?> get props {
    return [
      clinicalPracticeGuidelines,
      quickAccess,
      physicalExam,
      movementFaults,
      specialTests,
      manualTherapy,
      therapeuticExercises,
      rehabilitationProgressionPyramid,
    ];
  }
}
