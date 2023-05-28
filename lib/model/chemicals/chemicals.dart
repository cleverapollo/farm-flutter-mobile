import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'chemicals.freezed.dart';

part 'chemicals.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Chemicals with _$Chemicals {
  const factory Chemicals({
    @JsonKey(name: 'ChemicalRegisterNo') String? chemicalRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'ChemicalRegisterId') String? chemicalRegisterId,
    @JsonKey(name: 'ChemicalTypeId') int? chemicalTypeId,
    @JsonKey(name: 'ChemicalApplicationMethodId')
        int? chemicalApplicationMethodId,
    @JsonKey(name: 'CampId') String? campId,
    @JsonKey(name: 'Date') DateTime? date,
    @JsonKey(name: 'OpeningStock') int? openingStock,
    @JsonKey(name: 'Issued') int? issued,
    @JsonKey(name: 'Balance') int? balance,
    @JsonKey(name: 'Mixture') String? mixture,
    @JsonKey(name: 'UsagePerHa') int? usagePerHa,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'ChemicalTypeName') String? chemicalTypeName,
    @JsonKey(name: 'ChemicalApplicationMethodName')
        String? chemicalApplicationMethodName,
    @JsonKey(name: 'CampName') String? campName,
  }) = _Chemicals;

  const Chemicals._();

  factory Chemicals.fromJson(Map<String, dynamic> json) =>
      _$ChemicalsFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
