import 'package:cmo/enum/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_config.freezed.dart';

part 'setting_config.g.dart';

@freezed
class SettingConfig with _$SettingConfig {
  const factory SettingConfig({
    @Default(DateFormatEnum.ddMMYYYYWithSlash) DateFormatEnum dateFormatEnum,
    @Default(AreaUnitEnum.ha) AreaUnitEnum areaUnitEnum,
    @Default(DistanceUnitEnum.km) DistanceUnitEnum distanceUnitEnum,
  }) = _SettingConfig;

  factory SettingConfig.fromJson(Map<String, dynamic> json) =>
      _$SettingConfigFromJson(json);
}
