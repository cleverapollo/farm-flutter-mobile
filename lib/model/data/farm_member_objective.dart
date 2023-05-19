// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_member_objective.freezed.dart';

part 'farm_member_objective.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmMemberObjective with _$FarmMemberObjective {
  const factory FarmMemberObjective({
    @JsonKey(name: 'FarmMemberObjectiveName') String? farmMemberObjectiveName,
    @JsonKey(name: 'FarmMemberObjectiveId') required int farmMemberObjectiveId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
  }) = _FarmMemberObjective;

  const FarmMemberObjective._();

  factory FarmMemberObjective.fromJson(Map<String, dynamic> json) =>
      _$FarmMemberObjectiveFromJson(json);

  @override
  Id get id => farmMemberObjectiveId;
}
