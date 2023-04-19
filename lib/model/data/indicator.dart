import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'indicator.freezed.dart';
part 'indicator.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Indicator with _$Indicator {

  const factory Indicator({
    @JsonKey(name: 'IndicatorId') required int  indicatorId,
    @JsonKey(name: 'IndicatorName') String? indicatorName,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Indicator;

  factory Indicator.fromJson(Map<String, dynamic> json) => _$IndicatorFromJson(json);
  const Indicator._();

  @override
  Id get id => indicatorId;
}