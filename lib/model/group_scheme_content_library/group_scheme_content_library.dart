import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'group_scheme_content_library.freezed.dart';
part 'group_scheme_content_library.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class GroupSchemeContentLibrary with _$GroupSchemeContentLibrary {
  const factory GroupSchemeContentLibrary({
    @JsonKey(name: 'Id') int? groupSchemeContentLibraryId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'GroupSchemeName') String? groupSchemeName,
    @JsonKey(name: 'Content') String? content,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false)
    @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
  }) = _GroupSchemeContentLibrary;

  const GroupSchemeContentLibrary._();

  factory GroupSchemeContentLibrary.fromJson(Map<String, dynamic> json) =>
      _$GroupSchemeContentLibraryFromJson(json);

  Id get id => groupSchemeContentLibraryId ?? Isar.autoIncrement;
}
