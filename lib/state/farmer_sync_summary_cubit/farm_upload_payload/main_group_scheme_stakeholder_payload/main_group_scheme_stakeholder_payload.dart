import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/group_scheme_stakeholder_payload/group_scheme_stakeholder_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/stakeholder_payload/stakeholder_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_group_scheme_stakeholder_payload.g.dart';
part 'main_group_scheme_stakeholder_payload.freezed.dart';

@freezed
class MainGroupSchemeStakeholderPayLoad
    with _$MainGroupSchemeStakeholderPayLoad {
  const factory MainGroupSchemeStakeholderPayLoad({
    GroupSchemeStakeholderPayLoad? GroupSchemeStakeholder,
    StakeholderPayLoad? Stakeholder,
  }) = _MainGroupSchemeStakeholderPayLoad;
  factory MainGroupSchemeStakeholderPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$MainGroupSchemeStakeholderPayLoadFromJson(json);
}
