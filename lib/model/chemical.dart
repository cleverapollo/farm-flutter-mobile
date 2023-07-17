import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/chemical_register_payload/chemical_register_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'chemical.freezed.dart';
part 'chemical.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Chemical with _$Chemical {
  const factory Chemical({
    @JsonKey(name: 'TotalRows') int? totalRows,
    @JsonKey(name: 'ChemicalNo') String? chemicalNo,
    @JsonKey(name: 'ChemicalId') String? chemicalId,
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
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(includeToJson: false, includeFromJson: false) String? chemicalType,
    @JsonKey(includeToJson: false, includeFromJson: false)
        String? chemicalApplicationMethod,
    @JsonKey(includeToJson: false, includeFromJson: false) String? campName,
  }) = _Chemical;

  const Chemical._();

  factory Chemical.fromJson(Map<String, dynamic> json) =>
      _$ChemicalFromJson(json);

  @override
  Id get id => int.tryParse(chemicalId ?? '') ?? Isar.autoIncrement;
}

extension ChemicalX on Chemical {
  ChemicalRegisterPayLoad toPayLoad() {
    return ChemicalRegisterPayLoad(
      ChemicalRegisterNo: chemicalNo,
      FarmId: farmId.toString(),
      ChemicalRegisterId: chemicalId,
      ChemicalTypeId: chemicalTypeId,
      ChemicalApplicationMethodId: chemicalApplicationMethodId,
      CampId: campId.toString(),
      Date: date,
      OpeningStock: openingStock,
      Issued: issued,
      Balance: balance,
      Mixture: mixture,
      UsagePerHa: usagePerHa,
      Comment: comment,
      CarRaisedDate: carRaisedDate?.toIso8601String(),
      CarClosedDate: carClosedDate?.toIso8601String(),
      IsActive: isActive,
      IsMasterdataSynced: isMasterdataSynced,
      ChemicalTypeName: chemicalType,
      ChemicalApplicationMethodName: chemicalApplicationMethod,
      CampName: campName,
    );
  }
}

class JsonConverterUtil {
  static int? toLong(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
