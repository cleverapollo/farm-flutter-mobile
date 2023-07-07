part of 'stake_holder_list_cubit.dart';

class StakeHolderListState {
  const StakeHolderListState({
    this.listStakeholderTypes = const <StakeHolderType>[],
    this.listStakeHolders = const <StakeHolder>[],
    this.filterListStakeHolders = const <StakeHolder>[],
    this.loadingList = false,
    this.error,
    this.resourceManagerUnit,
    this.farm,
    this.listSocialUpliftments,
    this.listCustomaryUseRights,
    this.listSpecialSites,
  });

  final bool loadingList;
  final Object? error;
  final List<StakeHolder> listStakeHolders;
  final List<StakeHolder> filterListStakeHolders;
  final List<StakeHolderType> listStakeholderTypes;
  final ResourceManagerUnit? resourceManagerUnit;
  final Farm? farm;
  final List<FarmStakeholderSocialUpliftment>? listSocialUpliftments;
  final List<FarmStakeholderCustomaryUseRight>? listCustomaryUseRights;
  final List<FarmStakeholderSpecialSite>? listSpecialSites;

  StakeHolderListState copyWith({
    bool? loadingList,
    Object? error,
    List<StakeHolderType>? listStakeholderTypes,
    List<StakeHolder>? listStakeHolders,
    List<StakeHolder>? filterListStakeHolders,
    Map<String, dynamic>? cacheCreateData,
    ResourceManagerUnit? resourceManagerUnit,
    Farm? farm,
    List<FarmStakeholderSocialUpliftment>? listSocialUpliftments,
    List<FarmStakeholderCustomaryUseRight>? listCustomaryUseRights,
    List<FarmStakeholderSpecialSite>? listSpecialSites,
  }) {
    return StakeHolderListState(
      loadingList: loadingList ?? this.loadingList,
      error: error ?? this.error,
      filterListStakeHolders:
          filterListStakeHolders ?? this.filterListStakeHolders,
      listStakeHolders: listStakeHolders ?? this.listStakeHolders,
      listStakeholderTypes: listStakeholderTypes ?? this.listStakeholderTypes,
      resourceManagerUnit: resourceManagerUnit ?? this.resourceManagerUnit,
      farm: farm ?? this.farm,
      listSocialUpliftments:
          listSocialUpliftments ?? this.listSocialUpliftments,
      listCustomaryUseRights:
          listCustomaryUseRights ?? this.listCustomaryUseRights,
      listSpecialSites: listSpecialSites ?? this.listSpecialSites,
    );
  }
}
