import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_group_scheme_stakeholder_payload.g.dart';
part 'main_group_scheme_stakeholder_payload.freezed.dart';

@freezed
class MainGroupSchemeStakeholderPayLoad
    with _$MainGroupSchemeStakeholderPayLoad {
  const factory MainGroupSchemeStakeholderPayLoad({
    @JsonKey(name: 'GroupSchemeStakeholder') GroupSchemeStakeholder? groupSchemeStakeholder,
    @JsonKey(name: 'Stakeholder') StakeHolder? stakeholder,
  }) = _MainGroupSchemeStakeholderPayLoad;
  factory MainGroupSchemeStakeholderPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$MainGroupSchemeStakeholderPayLoadFromJson(json);
}
