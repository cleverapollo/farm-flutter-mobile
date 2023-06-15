import 'package:cmo/model/assessment_question_answers/assessment_question_answers.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_pay_load.freezed.dart';
part 'assessment_pay_load.g.dart';

@freezed
class AssessmentPayLoad with _$AssessmentPayLoad {
  const factory AssessmentPayLoad(
          {int? assessmentId,
          int? companyId,
          int? jobCategoryId,
          int? jobDescriptionId,
          int? plantationId,
          int? contractorId,
          int? teamId,
          String? workerId,
          String? location,
          String? created,
          double? lat,
          double? lng,
          int? userId,
          int? userDeviceId,
          String? signaturePoints,
          String? signatureImage,
          String? signatureDate,
          String? hasSignature,
          AssessmentQuestionAnswers? assessmentQuestionAnswers}) =
      _AssessmentPayLoad;

  factory AssessmentPayLoad.fromJson(Map<String, dynamic> json) =>
      _$AssessmentPayLoadFromJson(json);
}
