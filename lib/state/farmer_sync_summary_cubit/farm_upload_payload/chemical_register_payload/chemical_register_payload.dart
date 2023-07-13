import 'package:freezed_annotation/freezed_annotation.dart';

part 'chemical_register_payload.freezed.dart';
part 'chemical_register_payload.g.dart';

@freezed
class ChemicalRegisterPayLoad with _$ChemicalRegisterPayLoad {
  const factory ChemicalRegisterPayLoad({
    String? ChemicalRegisterNo,
    String? FarmId,
    String? ChemicalRegisterId,
    num? ChemicalTypeId,
    num? ChemicalApplicationMethodId,
    String? CampId,
    DateTime? Date,
    num? OpeningStock,
    num? Issued,
    num? Balance,
    String? Mixture,
    num? UsagePerHa,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? ChemicalTypeName,
    String? ChemicalApplicationMethodName,
    String? CampName,
  }) = _ChemicalRegisterPayLoad;
  factory ChemicalRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$ChemicalRegisterPayLoadFromJson(json);
}
