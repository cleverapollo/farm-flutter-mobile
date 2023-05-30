import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ConfigData with _$ConfigData {
  const factory ConfigData({
    @JsonKey(name: 'ConfigName') String? configName,
    @JsonKey(name: 'ConfigValue') String? configValue,
  }) = _ConfigData;

  const ConfigData._();

  factory ConfigData.fromJson(Map<String, dynamic> json) =>
      _$ConfigDataFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}

enum ConfigEnum {
  activeFarmId,
  activeGroupSchemeId;
}
