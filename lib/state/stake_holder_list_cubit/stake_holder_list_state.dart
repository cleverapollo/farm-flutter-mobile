import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stake_holder_list_state.freezed.dart';

@freezed
class StakeHolderListState with _$StakeHolderListState {
  const factory StakeHolderListState({
    Object? error,
    ResourceManagerUnit? resourceManagerUnit,
    Farm? farm,
    @Default(false) bool loadingList,
    @Default([]) List<StakeHolder> listStakeHolders,
    @Default([]) List<StakeHolder> filterListStakeHolders,
    @Default([]) List<StakeHolderType> listStakeholderTypes,
    @Default([]) List<FarmStakeholderSocialUpliftment> listSocialUpliftments,
    @Default([]) List<FarmStakeholderCustomaryUseRight> listCustomaryUseRights,
    @Default([]) List<FarmStakeholderSpecialSite> listSpecialSites,
    @Default([]) List<SocialUpliftment> listSocialUpliftment,
    @Default([]) List<SpecialSite> listSpecialSite,
    @Default([]) List<CustomaryUseRight> listCustomaryUseRight,
  }) = _StakeHolderListState;
}
