// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company({
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'CompanyName') String? companyName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
