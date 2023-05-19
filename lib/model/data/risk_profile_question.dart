// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'risk_profile_question.freezed.dart';

part 'risk_profile_question.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RiskProfileQuestion with _$RiskProfileQuestion {
  const factory RiskProfileQuestion({
    @JsonKey(name: 'RiskProfileQuestionName') String? riskProfileQuestionName,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'RiskProfileQuestionId') required int riskProfileQuestionId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
  }) = _RiskProfileQuestion;

  const RiskProfileQuestion._();

  factory RiskProfileQuestion.fromJson(Map<String, dynamic> json) =>
      _$RiskProfileQuestionFromJson(json);

  @override
  Id get id => riskProfileQuestionId;
}
