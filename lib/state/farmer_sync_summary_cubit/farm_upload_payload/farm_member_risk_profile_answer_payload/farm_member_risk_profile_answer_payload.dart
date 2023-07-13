import 'package:freezed_annotation/freezed_annotation.dart';

part 'farm_member_risk_profile_answer_payload.freezed.dart';
part 'farm_member_risk_profile_answer_payload.g.dart';

@freezed
class FarmMemberRiskProfileAnswerPayLoad
    with _$FarmMemberRiskProfileAnswerPayLoad {
  const factory FarmMemberRiskProfileAnswerPayLoad({
    String? FarmMemberRiskProfileAnswerId,
    String? FarmMemberRiskProfileAnswerNo,
    num? RiskProfileQuestionId,
    bool? Answer,
    String? FarmId,
    bool? IsActive,
    bool? IsMasterdataSynced,
  }) = _FarmMemberRiskProfileAnswerPayLoad;
  factory FarmMemberRiskProfileAnswerPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$FarmMemberRiskProfileAnswerPayLoadFromJson(json);
}
