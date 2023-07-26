import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_member_risk_profile_answer.freezed.dart';

part 'farm_member_risk_profile_answer.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmMemberRiskProfileAnswer with _$FarmMemberRiskProfileAnswer {
  const factory FarmMemberRiskProfileAnswer({
    @JsonKey(name: 'FarmMemberRiskProfileAnswerId') String? farmMemberRiskProfileAnswerId,
    @JsonKey(name: 'FarmMemberRiskProfileAnswerNo') String? farmMemberRiskProfileAnswerNo,
    @JsonKey(name: 'RiskProfileQuestionId') int? riskProfileQuestionId,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'Answer') bool? answer,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false) @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
  }) = _FarmMemberRiskProfileAnswer;

  factory FarmMemberRiskProfileAnswer.fromJson(Map<String, dynamic> json) =>
      _$FarmMemberRiskProfileAnswerFromJson(json);

  const FarmMemberRiskProfileAnswer._();

  @override
  Id get id => int.tryParse(farmMemberRiskProfileAnswerNo ?? '') ?? Isar.autoIncrement;
}
