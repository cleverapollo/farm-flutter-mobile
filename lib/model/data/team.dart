import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    @JsonKey(name: 'TeamId') int? teamId,
    @JsonKey(name: 'TeamName') String? teamName,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'ContractorId') int? contractorId,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
