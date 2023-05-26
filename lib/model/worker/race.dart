import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'race.freezed.dart';
part 'race.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Race with _$Race {
  const factory Race({
    @JsonKey(name: 'RaceId') int? raceId,
    @JsonKey(name: 'RaceName') String? raceName,
    @Default(true)
    @JsonKey(name: 'IsActive') bool isActive
  }) = _Race;

  const Race._();

  factory Race.fromJson(Map<String, dynamic> json) =>
      _$RaceFromJson(json);

  @override
  Id get id => raceId ?? Isar.autoIncrement;
}