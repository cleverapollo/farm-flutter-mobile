// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member, sort_unnamed_constructors_first, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'package:cmo/model/entity.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Company with _$Company {
  const Company._();

  @override
  Id get id => companyId;

  const factory Company({
    @JsonKey(name: 'CompanyId') required int companyId,
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
