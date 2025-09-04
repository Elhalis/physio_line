// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_diagnosis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDiagnosis _$AllDiagnosisFromJson(Map<String, dynamic> json) => AllDiagnosis(
  name: json['name'] as String?,
  previousNames: (json['previous_names'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  description: json['description'] as String?,
  prevalence: json['prevalence'] == null
      ? null
      : Prevalence.fromJson(json['prevalence'] as Map<String, dynamic>),
  clinicalFindings: json['clinical_findings'] == null
      ? null
      : ClinicalFindings.fromJson(
          json['clinical_findings'] as Map<String, dynamic>,
        ),
  physicalExam: json['physical_exam'] == null
      ? null
      : PhysicalExam.fromJson(json['physical_exam'] as Map<String, dynamic>),
  clinicalReasoning: json['clinical_reasoning'] == null
      ? null
      : ClinicalReasoning.fromJson(
          json['clinical_reasoning'] as Map<String, dynamic>,
        ),
  movementFaults: json['movement_faults'] == null
      ? null
      : MovementFaults.fromJson(
          json['movement_faults'] as Map<String, dynamic>,
        ),
  associatedImpairments: json['associated_impairments'] == null
      ? null
      : AssociatedImpairments.fromJson(
          json['associated_impairments'] as Map<String, dynamic>,
        ),
  differentialDiagnosis: json['differential_diagnosis'] == null
      ? null
      : DifferentialDiagnosis.fromJson(
          json['differential_diagnosis'] as Map<String, dynamic>,
        ),
  interventions: json['interventions'] == null
      ? null
      : Interventions.fromJson(json['interventions'] as Map<String, dynamic>),
  patientEducation: json['patient_education'] == null
      ? null
      : PatientEducation.fromJson(
          json['patient_education'] as Map<String, dynamic>,
        ),
  modalities: json['modalities'] == null
      ? null
      : Modalities.fromJson(json['modalities'] as Map<String, dynamic>),
  outcomeMeasures: (json['outcome_measures'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$AllDiagnosisToJson(AllDiagnosis instance) =>
    <String, dynamic>{
      'name': instance.name,
      'previous_names': instance.previousNames,
      'description': instance.description,
      'prevalence': instance.prevalence,
      'clinical_findings': instance.clinicalFindings,
      'physical_exam': instance.physicalExam,
      'clinical_reasoning': instance.clinicalReasoning,
      'movement_faults': instance.movementFaults,
      'associated_impairments': instance.associatedImpairments,
      'differential_diagnosis': instance.differentialDiagnosis,
      'interventions': instance.interventions,
      'patient_education': instance.patientEducation,
      'modalities': instance.modalities,
      'outcome_measures': instance.outcomeMeasures,
    };
