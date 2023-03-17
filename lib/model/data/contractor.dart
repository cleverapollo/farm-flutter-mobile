import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'contractor.freezed.dart';
part 'contractor.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Contractor with _$Contractor {
  const Contractor._();

  @override
  Id get id => contractorId;

  const factory Contractor({
    @JsonKey(name: 'ContractorId') required int contractorId,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'ContractorName') String? contractorName,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'EmailAddress') String? emailAddress,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Contractor;

  factory Contractor.fromJson(Map<String, dynamic> json) =>
      _$ContractorFromJson(json);
}
