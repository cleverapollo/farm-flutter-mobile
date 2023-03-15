// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'package:cmo/model/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company({
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'CompanyName') String? companyName,
    @JsonKey(name: 'IsInUse') bool? isInUse,
    @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

extension CompanyX on Company {
  Entity get entity => Entity(
        name: companyName ?? '',
        type: EntityType.cpy,
      );
}
