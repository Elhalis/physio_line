class OrthoJoints {
  final Map<String, Joint> joints;

  OrthoJoints({required this.joints});

  factory OrthoJoints.fromJson(Map<String, dynamic> json) {
    var jointsMap = <String, Joint>{};
    json['ortho_joints'].forEach((key, value) {
      jointsMap[key] = Joint.fromJson(value);
    });
    return OrthoJoints(joints: jointsMap);
  }

  Map<String, dynamic> toJson() {
    return {
      'ortho_joints': joints.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

class Joint {
  final ClinicalPatternRecognition clinicalPatternRecognition;

  Joint({required this.clinicalPatternRecognition});

  factory Joint.fromJson(Map<String, dynamic> json) {
    return Joint(
      clinicalPatternRecognition: ClinicalPatternRecognition.fromJson(
        json['clinical_pattern_recognition'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clinical_pattern_recognition': clinicalPatternRecognition.toJson(),
    };
  }
}

class ClinicalPatternRecognition {
  final Map<String, ClinicalCategory> categories;
  final ClinicalPracticeGuidelines clinicalPracticeGuidelines;
  final ClinicalCategory quickAccess;
  final ClinicalCategory physicalExam;
  final ClinicalCategory movementFaults;
  final ClinicalCategory specialTests;
  final ClinicalCategory manualTherapy;
  final ClinicalCategory therapeuticExercises;
  final ClinicalCategory rehabilitationProgressionPyramid;

  ClinicalPatternRecognition({
    required this.categories,
    required this.clinicalPracticeGuidelines,
    required this.quickAccess,
    required this.physicalExam,
    required this.movementFaults,
    required this.specialTests,
    required this.manualTherapy,
    required this.therapeuticExercises,
    required this.rehabilitationProgressionPyramid,
  });

  factory ClinicalPatternRecognition.fromJson(Map<String, dynamic> json) {
    var categoriesMap = <String, ClinicalCategory>{};
    if (json['categories'] != null) {
      json['categories'].forEach((key, value) {
        categoriesMap[key] = ClinicalCategory.fromJson(value);
      });
    }

    // Handle both old structure (clinical_practice_guidelines) and new structure (all_diagnoses directly)
    ClinicalPracticeGuidelines guidelines;
    if (json['clinical_practice_guidelines'] != null) {
      guidelines = ClinicalPracticeGuidelines.fromJson(
        json['clinical_practice_guidelines'],
      );
    } else if (json['all_diagnoses'] != null) {
      // Create a ClinicalPracticeGuidelines from the all_diagnoses directly
      guidelines = ClinicalPracticeGuidelines.fromJson({
        'all_diagnoses': json['all_diagnoses'],
      });
    } else {
      guidelines = ClinicalPracticeGuidelines(allDiagnoses: []);
    }

    return ClinicalPatternRecognition(
      categories: categoriesMap,
      clinicalPracticeGuidelines: guidelines,
      quickAccess: ClinicalCategory.fromJson(json['quick_access'] ?? {}),
      physicalExam: ClinicalCategory.fromJson(json['physical_exam'] ?? {}),
      movementFaults: ClinicalCategory.fromJson(json['movement_faults'] ?? {}),
      specialTests: ClinicalCategory.fromJson(json['special_tests'] ?? {}),
      manualTherapy: ClinicalCategory.fromJson(json['manual_therapy'] ?? {}),
      therapeuticExercises: ClinicalCategory.fromJson(
        json['therapeutic_exercises'] ?? {},
      ),
      rehabilitationProgressionPyramid: ClinicalCategory.fromJson(
        json['rehabilitation_progression_pyramid'] ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'clinical_practice_guidelines': clinicalPracticeGuidelines.toJson(),
      'quick_access': quickAccess.toJson(),
      'physical_exam': physicalExam.toJson(),
      'movement_faults': movementFaults.toJson(),
      'special_tests': specialTests.toJson(),
      'manual_therapy': manualTherapy.toJson(),
      'therapeutic_exercises': therapeuticExercises.toJson(),
      'rehabilitation_progression_pyramid': rehabilitationProgressionPyramid
          .toJson(),
    };
  }
}

class ClinicalPracticeGuidelines {
  final List<Diagnosis> allDiagnoses;

  ClinicalPracticeGuidelines({required this.allDiagnoses});

  factory ClinicalPracticeGuidelines.fromJson(Map<String, dynamic> json) {
    var diagnosesList = <Diagnosis>[];
    if (json['all_diagnoses'] != null) {
      json['all_diagnoses'].forEach((key, value) {
        // Add the key as a field in the diagnosis data
        if (value is Map<String, dynamic>) {
          // Store the key as part of the diagnosis data
          diagnosesList.add(Diagnosis.fromJson(value, key: key));
        }
      });
    }
    return ClinicalPracticeGuidelines(allDiagnoses: diagnosesList);
  }

  Map<String, dynamic> toJson() {
    return {'all_diagnoses': allDiagnoses.map((v) => v.toJson()).toList()};
  }
}

class ClinicalCategory {
  final String description;
  final List<dynamic> content;
  final List<String> commonCauses;

  ClinicalCategory({
    required this.description,
    required this.content,
    required this.commonCauses,
  });

  factory ClinicalCategory.fromJson(Map<String, dynamic> json) {
    return ClinicalCategory(
      description: json['description'] ?? '',
      content: json['content'] != null
          ? List<dynamic>.from(json['content'])
          : [],
      commonCauses: json['common_causes'] != null
          ? List<String>.from(json['common_causes'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'content': content,
      'common_causes': commonCauses,
    };
  }
}

class Diagnosis {
  final String key; // Add this field
  final String name;
  final List<String> previousNames;
  final String description;
  final Prevalence prevalence;
  final ClinicalFindings clinicalFindings;
  final PhysicalExam physicalExam;
  final ClinicalReasoning clinicalReasoning;
  final MovementFaults movementFaults;
  final AssociatedImpairments associatedImpairments;
  final DifferentialDiagnosis differentialDiagnosis;
  final Interventions interventions;
  final PatientEducation patientEducation;
  final Map<String, Modality> modalities;
  final List<String> outcomeMeasures;

  Diagnosis({
    required this.key, // Add this parameter
    required this.name,
    required this.previousNames,
    required this.description,
    required this.prevalence,
    required this.clinicalFindings,
    required this.physicalExam,
    required this.clinicalReasoning,
    required this.movementFaults,
    required this.associatedImpairments,
    required this.differentialDiagnosis,
    required this.interventions,
    required this.patientEducation,
    required this.modalities,
    required this.outcomeMeasures,
  });

  factory Diagnosis.fromJson(Map<String, dynamic> json, {String key = ''}) {
    var modalitiesMap = <String, Modality>{};
    if (json['modalities'] != null) {
      json['modalities'].forEach((key, value) {
        modalitiesMap[key] = Modality.fromJson(value);
      });
    }

    return Diagnosis(
      key: key,
      name: json['name'],
      previousNames: List<String>.from(json['previous_names']),
      description: json['description'],
      prevalence: Prevalence.fromJson(json['prevalence']),
      clinicalFindings: ClinicalFindings.fromJson(json['clinical_findings']),
      physicalExam: PhysicalExam.fromJson(json['physical_exam']),
      clinicalReasoning: ClinicalReasoning.fromJson(json['clinical_reasoning']),
      movementFaults: MovementFaults.fromJson(json['movement_faults']),
      associatedImpairments: AssociatedImpairments.fromJson(
        json['associated_impairments'],
      ),
      differentialDiagnosis: DifferentialDiagnosis.fromJson(
        json['differential_diagnosis'],
      ),
      interventions: Interventions.fromJson(json['interventions']),
      patientEducation: PatientEducation.fromJson(json['patient_education']),
      modalities: modalitiesMap,
      outcomeMeasures: List<String>.from(json['outcome_measures']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'previous_names': previousNames,
      'description': description,
      'prevalence': prevalence.toJson(),
      'clinical_findings': clinicalFindings.toJson(),
      'physical_exam': physicalExam.toJson(),
      'clinical_reasoning': clinicalReasoning.toJson(),
      'movement_faults': movementFaults.toJson(),
      'associated_impairments': associatedImpairments.toJson(),
      'differential_diagnosis': differentialDiagnosis.toJson(),
      'interventions': interventions.toJson(),
      'patient_education': patientEducation.toJson(),
      'modalities': modalities.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'outcome_measures': outcomeMeasures,
    };
  }
}

class Prevalence {
  final List<String> prevalenceStatistics;
  final List<String> incidenceData;

  Prevalence({required this.prevalenceStatistics, required this.incidenceData});

  factory Prevalence.fromJson(Map<String, dynamic> json) {
    return Prevalence(
      prevalenceStatistics: List<String>.from(json['prevalence_statistics']),
      incidenceData: List<String>.from(json['incidence_data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prevalence_statistics': prevalenceStatistics,
      'incidence_data': incidenceData,
    };
  }
}

class ClinicalFindings {
  final List<String> history;
  final List<String> reportedFindings;
  final List<String> examinationFindings;
  final List<String> primarySurvey;
  final List<String> secondarySurvey;

  ClinicalFindings({
    required this.history,
    required this.reportedFindings,
    required this.examinationFindings,
    required this.primarySurvey,
    required this.secondarySurvey,
  });

  factory ClinicalFindings.fromJson(Map<String, dynamic> json) {
    return ClinicalFindings(
      history: List<String>.from(json['history']),
      reportedFindings: List<String>.from(json['reported_findings']),
      examinationFindings: List<String>.from(json['examination_findings']),
      primarySurvey: List<String>.from(json['primary_survey']),
      secondarySurvey: List<String>.from(json['secondary_survey']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'history': history,
      'reported_findings': reportedFindings,
      'examination_findings': examinationFindings,
      'primary_survey': primarySurvey,
      'secondary_survey': secondarySurvey,
    };
  }
}

class PhysicalExam {
  final KeyFindings keyFindings;

  PhysicalExam({required this.keyFindings});

  factory PhysicalExam.fromJson(Map<String, dynamic> json) {
    return PhysicalExam(
      keyFindings: KeyFindings.fromJson(json['key_findings']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'key_findings': keyFindings.toJson()};
  }
}

class KeyFindings {
  final List<String> tests;
  final List<String> observationAndPalpation;
  final List<String> rangeOfMotion;
  final List<String> irritability;

  KeyFindings({
    required this.tests,
    required this.observationAndPalpation,
    required this.rangeOfMotion,
    required this.irritability,
  });

  factory KeyFindings.fromJson(Map<String, dynamic> json) {
    return KeyFindings(
      tests: List<String>.from(json['tests']),
      observationAndPalpation: List<String>.from(
        json['observation_and_palpation'],
      ),
      rangeOfMotion: List<String>.from(json['range_of_motion']),
      irritability: List<String>.from(json['irritability']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tests': tests,
      'observation_and_palpation': observationAndPalpation,
      'range_of_motion': rangeOfMotion,
      'irritability': irritability,
    };
  }
}

class ClinicalReasoning {
  final List<String> assessments;

  ClinicalReasoning({required this.assessments});

  factory ClinicalReasoning.fromJson(Map<String, dynamic> json) {
    return ClinicalReasoning(
      assessments: List<String>.from(json['assessments']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'assessments': assessments};
  }
}

class MovementFaults {
  final List<String> scapularFaults;
  final List<String> humeralFaults;
  final List<String> thoracicFaults;

  MovementFaults({
    required this.scapularFaults,
    required this.humeralFaults,
    required this.thoracicFaults,
  });

  factory MovementFaults.fromJson(Map<String, dynamic> json) {
    return MovementFaults(
      scapularFaults: List<String>.from(json['scapular_faults']),
      humeralFaults: List<String>.from(json['humeral_faults']),
      thoracicFaults: List<String>.from(json['thoracic_faults']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'scapular_faults': scapularFaults,
      'humeral_faults': humeralFaults,
      'thoracic_faults': thoracicFaults,
    };
  }
}

class AssociatedImpairments {
  final List<String> assessments;

  AssociatedImpairments({required this.assessments});

  factory AssociatedImpairments.fromJson(Map<String, dynamic> json) {
    return AssociatedImpairments(
      assessments: List<String>.from(json['assessments']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'assessments': assessments};
  }
}

class DifferentialDiagnosis {
  final List<String> assessments;

  DifferentialDiagnosis({required this.assessments});

  factory DifferentialDiagnosis.fromJson(Map<String, dynamic> json) {
    return DifferentialDiagnosis(
      assessments: List<String>.from(json['assessments']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'assessments': assessments};
  }
}

class Interventions {
  final ManualTherapy manualTherapy;
  final TherapeuticExercises therapeuticExercises;
  final List<String> functionalMovement;

  Interventions({
    required this.manualTherapy,
    required this.therapeuticExercises,
    required this.functionalMovement,
  });

  factory Interventions.fromJson(Map<String, dynamic> json) {
    return Interventions(
      manualTherapy: ManualTherapy.fromJson(json['manual_therapy']),
      therapeuticExercises: TherapeuticExercises.fromJson(
        json['therapeutic_exercises'],
      ),
      functionalMovement: List<String>.from(json['functional_movement']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'manual_therapy': manualTherapy.toJson(),
      'therapeutic_exercises': therapeuticExercises.toJson(),
      'functional_movement': functionalMovement,
    };
  }
}

class ManualTherapy {
  final List<String> jointMobilizations;
  final List<String> softTissueTechniques;

  ManualTherapy({
    required this.jointMobilizations,
    required this.softTissueTechniques,
  });

  factory ManualTherapy.fromJson(Map<String, dynamic> json) {
    return ManualTherapy(
      jointMobilizations: List<String>.from(json['joint_mobilizations']),
      softTissueTechniques: List<String>.from(json['soft_tissue_techniques']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'joint_mobilizations': jointMobilizations,
      'soft_tissue_techniques': softTissueTechniques,
    };
  }
}

class TherapeuticExercises {
  final IrritabilityLevels irritabilityLevels;

  TherapeuticExercises({required this.irritabilityLevels});

  factory TherapeuticExercises.fromJson(Map<String, dynamic> json) {
    return TherapeuticExercises(
      irritabilityLevels: IrritabilityLevels.fromJson(
        json['irritability_levels'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'irritability_levels': irritabilityLevels.toJson()};
  }
}

class IrritabilityLevels {
  final List<String> high;
  final List<String> moderate;
  final List<String> low;

  IrritabilityLevels({
    required this.high,
    required this.moderate,
    required this.low,
  });

  factory IrritabilityLevels.fromJson(Map<String, dynamic> json) {
    return IrritabilityLevels(
      high: List<String>.from(json['high']),
      moderate: List<String>.from(json['moderate']),
      low: List<String>.from(json['low']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'high': high, 'moderate': moderate, 'low': low};
  }
}

class PatientEducation {
  final List<String> whatsGoingOn;
  final List<String> howLongWillItTake;
  final List<String> whatWeWillDo;
  final List<String> whatYouCanDo;

  PatientEducation({
    required this.whatsGoingOn,
    required this.howLongWillItTake,
    required this.whatWeWillDo,
    required this.whatYouCanDo,
  });

  factory PatientEducation.fromJson(Map<String, dynamic> json) {
    return PatientEducation(
      whatsGoingOn: List<String>.from(json['whats_going_on']),
      howLongWillItTake: List<String>.from(json['how_long_will_it_take']),
      whatWeWillDo: List<String>.from(json['what_we_will_do']),
      whatYouCanDo: List<String>.from(json['what_you_can_do']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'whats_going_on': whatsGoingOn,
      'how_long_will_it_take': howLongWillItTake,
      'what_we_will_do': whatWeWillDo,
      'what_you_can_do': whatYouCanDo,
    };
  }
}

class Modality {
  final List<String> purpose;
  final List<String> gradeOfRecommendation;
  final List<String> info;
  final List<String> associatedIcfCategory;
  final List<String> patientPosition;
  final List<String> therapistPosition;
  final Map<String, String> cues;
  final List<String> additionalInfo;
  final List<String> relatedObjectiveMeasurement;

  Modality({
    required this.purpose,
    required this.gradeOfRecommendation,
    required this.info,
    required this.associatedIcfCategory,
    required this.patientPosition,
    required this.therapistPosition,
    required this.cues,
    required this.additionalInfo,
    required this.relatedObjectiveMeasurement,
  });

  factory Modality.fromJson(Map<String, dynamic> json) {
    var cuesMap = <String, String>{};
    if (json['cues'] != null) {
      json['cues'].forEach((key, value) {
        cuesMap[key] = value;
      });
    }

    return Modality(
      purpose: List<String>.from(json['purpose']),
      gradeOfRecommendation: List<String>.from(json['grade_of_recommendation']),
      info: List<String>.from(json['info']),
      associatedIcfCategory: List<String>.from(json['associated_icf_category']),
      patientPosition: List<String>.from(json['patient_position']),
      therapistPosition: List<String>.from(json['therapist_position']),
      cues: cuesMap,
      additionalInfo: List<String>.from(json['additional_info']),
      relatedObjectiveMeasurement: List<String>.from(
        json['related_objective_measurement'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'purpose': purpose,
      'grade_of_recommendation': gradeOfRecommendation,
      'info': info,
      'associated_icf_category': associatedIcfCategory,
      'patient_position': patientPosition,
      'therapist_position': therapistPosition,
      'cues': cues,
      'additional_info': additionalInfo,
      'related_objective_measurement': relatedObjectiveMeasurement,
    };
  }
}
