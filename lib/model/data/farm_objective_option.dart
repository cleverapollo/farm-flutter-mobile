// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_objective_option.freezed.dart';

part 'farm_objective_option.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmObjectiveOption with _$FarmObjectiveOption {
  const factory FarmObjectiveOption({
    @JsonKey(name: 'FarmObjectiveOptionName') String? farmObjectiveOptionName,
    @JsonKey(name: 'FarmObjectiveOptionId') required int farmObjectiveOptionId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false) @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
  }) = _FarmObjectiveOption;

  const FarmObjectiveOption._();

  factory FarmObjectiveOption.fromJson(Map<String, dynamic> json) =>
      _$FarmObjectiveOptionFromJson(json);

  @override
  Id get id => farmObjectiveOptionId;
}
