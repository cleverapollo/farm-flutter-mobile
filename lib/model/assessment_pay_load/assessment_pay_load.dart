import 'package:cmo/model/assessment_question_answers_pay_load/assessment_question_answers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_pay_load.freezed.dart';
part 'assessment_pay_load.g.dart';

@freezed
class AssessmentPayLoad with _$AssessmentPayLoad {
  const factory AssessmentPayLoad(
          {int? AssessmentId,
          int? CompanyId,
          int? JobCategoryId,
          int? JobDescriptionId,
          int? PlantationId,
          int? ContractorId,
          int? TeamId,
          String? WorkerId,
          String? Location,
          String? Created,
          double? Lat,
          double? Lng,
          int? UserId,
          int? UserDeviceId,
          String? SignaturePoints,
          String? SignatureImage,
          String? SignatureDate,
          String? HasSignature,
          AssessmentQuestionAnswersPayLoad? AssessmentQuestionAnswers}) =
      _AssessmentPayLoad;

  factory AssessmentPayLoad.fromJson(Map<String, dynamic> json) =>
      _$AssessmentPayLoadFromJson(json);
}
