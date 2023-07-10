import 'package:freezed_annotation/freezed_annotation.dart';

part 'farm_member_objective_anwser.freezed.dart';
part 'farm_member_objective_anwser.g.dart';

@freezed
class FarmMemberObjectiveAnswerPayLoad with _$FarmMemberObjectiveAnswerPayLoad {
  const factory FarmMemberObjectiveAnswerPayLoad({
    String? FarmMemberObjectiveAnswerId,
    String? FarmMemberObjectiveAnswerNo,
    int? FarmMemberObjectiveId,
    int? FarmObjectiveOptionId,
    String? FarmId,
    bool? IsActive,
    bool? IsMasterdataSynced,
  }) = _FarmMemberObjectiveAnswerPayLoad;
  factory FarmMemberObjectiveAnswerPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$FarmMemberObjectiveAnswerPayLoadFromJson(json);
}
