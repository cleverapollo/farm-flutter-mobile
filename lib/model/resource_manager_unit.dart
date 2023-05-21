import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'resource_manager_unit.freezed.dart';

part 'resource_manager_unit.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ResourceManagerUnit with _$ResourceManagerUnit {
  const ResourceManagerUnit._();

  @override
  Id get id => regionalManagerUnitId ?? 0;

  const factory ResourceManagerUnit({
    @JsonKey(name: 'CreateDT') String? createDt,
    @JsonKey(name: 'GroupschemeId') int? groupSchemeId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'ManagerContactNo') String? managerContactNo,
    @JsonKey(name: 'ManagerEmail') String? managerEmail,
    @JsonKey(name: 'ManagerName') String? managerName,
    @JsonKey(name: 'NoOfRegionalManagers') int? noOfRegionalManagers,
    @JsonKey(name: 'RegionalManagerUnitId') int? regionalManagerUnitId,
    @JsonKey(name: 'RegionalManagerUnitName') String? regionalManagerUnitName,
    @JsonKey(name: 'UpdateDT') String? updateDt,
  }) = _ResourceManagerUnit;

  factory ResourceManagerUnit.fromJson(Map<String, dynamic> json) =>
      _$ResourceManagerUnitFromJson(json);
}
