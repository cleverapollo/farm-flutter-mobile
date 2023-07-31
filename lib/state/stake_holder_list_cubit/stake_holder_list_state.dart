import 'package:cmo/model/customary_use_right/customary_use_right.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/farmer_stake_holder/farmer_stake_holder.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/model/social_upliftment/social_upliftment.dart';
import 'package:cmo/model/special_site/special_site.dart';
import 'package:cmo/model/stakeholder/farm_stakeholder_customary_use_right.dart';
import 'package:cmo/model/stakeholder/farm_stakeholder_social_upliftment.dart';
import 'package:cmo/model/stakeholder/stake_holder.dart';
import 'package:cmo/model/stakeholder/stakeholder_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/stakeholder/farm_stakeholder_special_site.dart';

part 'stake_holder_list_state.freezed.dart';

@freezed
class StakeHolderListState with _$StakeHolderListState {
  const factory StakeHolderListState({
    Object? error,
    ResourceManagerUnit? resourceManagerUnit,
    Farm? farm,
    @Default(false) bool loadingList,
    @Default(FarmerStakeHolder()) FarmerStakeHolder farmerStakeHolder,
    @Default(StakeHolder()) StakeHolder stakeHolder,
    @Default([]) List<StakeHolder> listStakeHolders,
    @Default([]) List<StakeHolder> filterListStakeHolders,
    @Default([]) List<StakeHolderType> listStakeholderTypes,
    @Default([]) List<FarmStakeholderSocialUpliftment> listSocialUpliftments,
    @Default([]) List<FarmStakeholderCustomaryUseRight> listCustomaryUseRights,
    @Default([]) List<FarmStakeholderSpecialSite> listSpecialSites,
    @Default([]) List<SocialUpliftment> listSocialUpliftment,
    @Default([]) List<SpecialSite> listSpecialSite,
    @Default([]) List<CustomaryUseRight> listCustomaryUseRight,
    StakeHolderType? selectStakeHolderType,
  }) = _StakeHolderListState;
}
