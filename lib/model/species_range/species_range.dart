import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'species_range.freezed.dart';
part 'species_range.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class SpeciesRange with _$SpeciesRange {
  const factory SpeciesRange({
    @JsonKey(name: 'SpeciesRangeId') int? speciesRangeId,
    @JsonKey(name: 'SpeciesRangeName') String? speciesRangeName,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _SpeciesRange;

  const SpeciesRange._();

  factory SpeciesRange.fromJson(Map<String, dynamic> json) =>
      _$SpeciesRangeFromJson(json);

  @override
  Id get id => speciesRangeId ?? Isar.autoIncrement;
}
