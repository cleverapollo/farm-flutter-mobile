import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_member_objective_answer.freezed.dart';

part 'farm_member_objective_answer.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmMemberObjectiveAnswer with _$FarmMemberObjectiveAnswer {
  const factory FarmMemberObjectiveAnswer({
    @JsonKey(name: 'FarmMemberObjectiveAnswerId') String? farmMemberObjectiveAnswerId,
    @JsonKey(name: 'FarmMemberObjectiveAnswerNo') String? farmMemberObjectiveAnswerNo,
    @JsonKey(name: 'FarmMemberObjectiveId') int? farmMemberObjectiveId,
    @JsonKey(name: 'FarmObjectiveOptionId') int? farmObjectiveOptionId,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false) @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
  }) = _FarmMemberObjectiveAnswer;

  factory FarmMemberObjectiveAnswer.fromJson(Map<String, dynamic> json) =>
      _$FarmMemberObjectiveAnswerFromJson(json);

  const FarmMemberObjectiveAnswer._();

  @override
  Id get id => Isar.autoIncrement;
}
