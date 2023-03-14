import 'package:freezed_annotation/freezed_annotation.dart';

part 'contractor.freezed.dart';
part 'contractor.g.dart';

@freezed
class Contractor with _$Contractor {
  const factory Contractor({
    @JsonKey(name: 'ContractorId') int? contractorId,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'ContractorName') String? contractorName,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'EmailAddress') String? emailAddress,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Contractor;

  factory Contractor.fromJson(Map<String, dynamic> json) => _$ContractorFromJson(json);
}
