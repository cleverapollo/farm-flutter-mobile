// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Team with _$Team {

  const factory Team({
    @JsonKey(name: 'TeamId') required int  teamId,
    @JsonKey(name: 'TeamName') String? teamName,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'ContractorId') int? contractorId,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
    const Team._();

  @override
  Id get id => teamId;
}
