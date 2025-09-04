import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'associated_impairments.dart';
import 'clinical_findings.dart';
import 'clinical_reasoning.dart';
import 'differential_diagnosis.dart';
import 'interventions.dart';
import 'modalities.dart';
import 'movement_faults.dart';
import 'patient_education.dart';
import 'physical_exam.dart';
import 'prevalence.dart';

part 'all_diagnosis.g.dart';

@JsonSerializable()
class AllDiagnosis extends Equatable {
  final String? name;
  @JsonKey(name: 'previous_names')
  final List<String>? previousNames;
  final String? description;
  final Prevalence? prevalence;
  @JsonKey(name: 'clinical_findings')
  final ClinicalFindings? clinicalFindings;
  @JsonKey(name: 'physical_exam')
  final PhysicalExam? physicalExam;
  @JsonKey(name: 'clinical_reasoning')
  final ClinicalReasoning? clinicalReasoning;
  @JsonKey(name: 'movement_faults')
  final MovementFaults? movementFaults;
  @JsonKey(name: 'associated_impairments')
  final AssociatedImpairments? associatedImpairments;
  @JsonKey(name: 'differential_diagnosis')
  final DifferentialDiagnosis? differentialDiagnosis;
  final Interventions? interventions;
  @JsonKey(name: 'patient_education')
  final PatientEducation? patientEducation;
  final Modalities? modalities;
  @JsonKey(name: 'outcome_measures')
  final List<String>? outcomeMeasures;

  const AllDiagnosis({
    this.name,
    this.previousNames,
    this.description,
    this.prevalence,
    this.clinicalFindings,
    this.physicalExam,
    this.clinicalReasoning,
    this.movementFaults,
    this.associatedImpairments,
    this.differentialDiagnosis,
    this.interventions,
    this.patientEducation,
    this.modalities,
    this.outcomeMeasures,
  });

  factory AllDiagnosis.fromJson(Map<String, dynamic> json) {
    return _$AllDiagnosisFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllDiagnosisToJson(this);

  AllDiagnosis copyWith({
    String? name,
    List<String>? previousNames,
    String? description,
    Prevalence? prevalence,
    ClinicalFindings? clinicalFindings,
    PhysicalExam? physicalExam,
    ClinicalReasoning? clinicalReasoning,
    MovementFaults? movementFaults,
    AssociatedImpairments? associatedImpairments,
    DifferentialDiagnosis? differentialDiagnosis,
    Interventions? interventions,
    PatientEducation? patientEducation,
    Modalities? modalities,
    List<String>? outcomeMeasures,
  }) {
    return AllDiagnosis(
      name: name ?? this.name,
      previousNames: previousNames ?? this.previousNames,
      description: description ?? this.description,
      prevalence: prevalence ?? this.prevalence,
      clinicalFindings: clinicalFindings ?? this.clinicalFindings,
      physicalExam: physicalExam ?? this.physicalExam,
      clinicalReasoning: clinicalReasoning ?? this.clinicalReasoning,
      movementFaults: movementFaults ?? this.movementFaults,
      associatedImpairments:
          associatedImpairments ?? this.associatedImpairments,
      differentialDiagnosis:
          differentialDiagnosis ?? this.differentialDiagnosis,
      interventions: interventions ?? this.interventions,
      patientEducation: patientEducation ?? this.patientEducation,
      modalities: modalities ?? this.modalities,
      outcomeMeasures: outcomeMeasures ?? this.outcomeMeasures,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      previousNames,
      description,
      prevalence,
      clinicalFindings,
      physicalExam,
      clinicalReasoning,
      movementFaults,
      associatedImpairments,
      differentialDiagnosis,
      interventions,
      patientEducation,
      modalities,
      outcomeMeasures,
    ];
  }
}
