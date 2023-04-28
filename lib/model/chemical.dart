import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chemical.g.dart';

@collection
@JsonSerializable()
class Chemical {
  @JsonKey(name: 'TotalRows')
  int? totalRows;

  String? chemicalNo;

  @JsonKey(name: 'FarmId', fromJson: JsonConverterUtil.toLong)
  int? farmId;

  @JsonKey(name: 'ChemicalTypeId')
  int? chemicalTypeId;

  @JsonKey(name: 'ChemicalApplicationMethodId')
  int? chemicalApplicationMethodId;

  @JsonKey(name: 'CampId', fromJson: JsonConverterUtil.toLong)
  int? campId;

  @JsonKey(name: 'Date')
  DateTime? date;

  @JsonKey(name: 'OpeningStock')
  double? openingStock;

  @JsonKey(name: 'Issued')
  double? issued;

  @JsonKey(name: 'Balance')
  double? balance;

  @JsonKey(name: 'Mixture')
  String? mixture;

  @JsonKey(name: 'UsagePerHa')
  double? usagePerHa;

  @JsonKey(name: 'Comment')
  String? comment;

  @JsonKey(name: 'CarRaisedDate')
  DateTime? carRaisedDate;

  @JsonKey(name: 'CarClosedDate')
  DateTime? carClosedDate;

  @JsonKey(name: 'CreateDT')
  DateTime? createDT;

  @JsonKey(name: 'UpdateDT')
  DateTime? updateDT;

  @JsonKey(name: 'IsActive')
  bool? isActive;

  @JsonKey(includeToJson: false, includeFromJson: false)
  String? chemicalType;

  @JsonKey(includeToJson: false, includeFromJson: false)
  String? chemicalApplicationMethod;

  @JsonKey(includeToJson: false, includeFromJson: false)
  String? campName;

  Chemical(
      {this.totalRows,
      this.chemicalNo,
      this.farmId,
      this.chemicalTypeId,
      this.chemicalApplicationMethodId,
      this.campId,
      this.date,
      this.openingStock,
      this.issued,
      this.balance,
      this.mixture,
      this.usagePerHa,
      this.comment,
      this.carRaisedDate,
      this.carClosedDate,
      this.createDT,
      this.updateDT,
      this.isActive});

  @override
  Id get id => Isar.autoIncrement;

  factory Chemical.fromJson(Map<String, dynamic> json) =>
      _$ChemicalFromJson(json);

  Map<String, dynamic> toJson() => _$ChemicalToJson(this);
}

class JsonConverterUtil {
  static int? toLong(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
