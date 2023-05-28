import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'country.freezed.dart';

part 'country.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Country with _$Country {
  const factory Country({
    @JsonKey(name: 'CountryId') int? countryId,
    @JsonKey(name: 'CountryName') String? countryName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Country;

  const Country._();

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
