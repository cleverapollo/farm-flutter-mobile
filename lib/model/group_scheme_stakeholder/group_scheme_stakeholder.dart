import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'group_scheme_stakeholder.freezed.dart';
part 'group_scheme_stakeholder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class GroupSchemeStakeholder with _$GroupSchemeStakeholder {
  const factory GroupSchemeStakeholder({
    @JsonKey(name: 'GroupSchemeStakeholderId') String? groupSchemeStakeholderId,
    @JsonKey(name: 'StakeholderId') String? stakeholderId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @Default(false)
    @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
  }) = _GroupSchemeStakeholder;

  const GroupSchemeStakeholder._();

  factory GroupSchemeStakeholder.fromJson(Map<String, dynamic> json) =>
      _$GroupSchemeStakeholderFromJson(json);

  Id get id => int.tryParse(groupSchemeStakeholderId ?? '') ?? Isar.autoIncrement;
}
