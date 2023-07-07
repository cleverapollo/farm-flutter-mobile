import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chemical.freezed.dart';
part 'chemical.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Chemical with _$Chemical {
  const factory Chemical({
    @JsonKey(name: 'TotalRows') int? totalRows,
    @JsonKey(name: 'ChemicalNo') String? chemicalNo,
    @JsonKey(name: 'FarmId', fromJson: JsonConverterUtil.toLong) int? farmId,
    @JsonKey(name: 'ChemicalTypeId') int? chemicalTypeId,
    @JsonKey(name: 'ChemicalApplicationMethodId')
        int? chemicalApplicationMethodId,
    @JsonKey(name: 'CampId', fromJson: JsonConverterUtil.toLong) int? campId,
    @JsonKey(name: 'Date') DateTime? date,
    @JsonKey(name: 'OpeningStock') double? openingStock,
    @JsonKey(name: 'Issued') double? issued,
    @JsonKey(name: 'Balance') double? balance,
    @JsonKey(name: 'Mixture') String? mixture,
    @JsonKey(name: 'UsagePerHa') double? usagePerHa,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') DateTime? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') DateTime? carClosedDate,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(includeToJson: false, includeFromJson: false) String? chemicalType,
    @JsonKey(includeToJson: false, includeFromJson: false)
        String? chemicalApplicationMethod,
    @JsonKey(includeToJson: false, includeFromJson: false) String? campName,
  }) = _Chemical;

  const Chemical._();

  factory Chemical.fromJson(Map<String, dynamic> json) =>
      _$ChemicalFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}

class JsonConverterUtil {
  static int? toLong(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
