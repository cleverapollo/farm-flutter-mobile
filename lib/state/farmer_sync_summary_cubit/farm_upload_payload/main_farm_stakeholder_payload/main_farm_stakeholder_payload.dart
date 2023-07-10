import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_customary_use_right_payload/farm_stakeholder_customary_use_right_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_payload/farm_stakeholder_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_social_upliftment_payload/farm_stakeholder_social_upliftment_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_special_site_payload/farm_stakeholder_special_site_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/stakeholder_payload/stakeholder_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_farm_stakeholder_payload.freezed.dart';
part 'main_farm_stakeholder_payload.g.dart';

@freezed
class MainFarmStakeholderPayLoad with _$MainFarmStakeholderPayLoad {
  const factory MainFarmStakeholderPayLoad({
    StakeholderPayLoad? Stakeholder,
    FarmStakeholderPayLoad? FarmStakeholder,
    List<FarmStakeholderSocialUpliftmentPayLoad>?
        FarmStakeholderSocialUpliftments,
    List<FarmStakeholderSpecialSitePayLoad>? FarmStakeholderSpecialSites,
    List<FarmStakeholderCustomaryUseRightPayLoad>?
        FarmStakeholderCustomaryUseRights,
  }) = _MainFarmStakeholderPayLoad;
  factory MainFarmStakeholderPayLoad.fromJson(Map<String, dynamic> json) =>
      _$MainFarmStakeholderPayLoadFromJson(json);
}
