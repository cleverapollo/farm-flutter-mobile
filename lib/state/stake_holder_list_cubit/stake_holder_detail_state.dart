part of 'stake_holder_detail_cubit.dart';

class StakeholderDetailState {
  final Object? error;
  final bool? loading;
  final ResourceManagerUnit? resourceManagerUnit;
  final Farm? farm;
  final FarmerStakeHolder? farmerStakeHolder;
  final StakeHolder? stakeHolder;
  final List<StakeHolderType>? listStakeholderTypes;
  final List<FarmStakeholderSocialUpliftment>? listSocialUpliftments;
  final List<FarmStakeholderCustomaryUseRight>? listCustomaryUseRights;
  final List<FarmStakeholderSpecialSite>? listSpecialSites;
  final List<SocialUpliftment>? listSocialUpliftment;
  final List<SpecialSite>? listSpecialSite;
  final List<CustomaryUseRight>? listCustomaryUseRight;

  StakeholderDetailState({
    this.error,
    this.loading,
    this.resourceManagerUnit,
    this.farm,
    this.farmerStakeHolder,
    this.stakeHolder,
    this.listStakeholderTypes = const <StakeHolderType>[],
    this.listSocialUpliftments = const <FarmStakeholderSocialUpliftment>[],
    this.listCustomaryUseRights = const <FarmStakeholderCustomaryUseRight>[],
    this.listSpecialSites = const <FarmStakeholderSpecialSite>[],
    this.listSocialUpliftment = const <SocialUpliftment>[],
    this.listSpecialSite = const <SpecialSite>[],
    this.listCustomaryUseRight = const <CustomaryUseRight>[],
  });

  StakeholderDetailState copyWith({
    Object? error,
    bool? loading,
    ResourceManagerUnit? resourceManagerUnit,
    Farm? farm,
    FarmerStakeHolder? farmerStakeHolder,
    StakeHolder? stakeHolder,
    List<StakeHolderType>? listStakeholderTypes,
    List<FarmStakeholderSocialUpliftment>? listSocialUpliftments,
    List<FarmStakeholderCustomaryUseRight>? listCustomaryUseRights,
    List<FarmStakeholderSpecialSite>? listSpecialSites,
    List<SocialUpliftment>? listSocialUpliftment,
    List<SpecialSite>? listSpecialSite,
    List<CustomaryUseRight>? listCustomaryUseRight,
  }) {
    return StakeholderDetailState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      resourceManagerUnit: resourceManagerUnit ?? this.resourceManagerUnit,
      farm: farm ?? this.farm,
      farmerStakeHolder: farmerStakeHolder ?? this.farmerStakeHolder,
      stakeHolder: stakeHolder ?? this.stakeHolder,
      listStakeholderTypes: listStakeholderTypes ?? this.listStakeholderTypes,
      listSocialUpliftments: listSocialUpliftments ?? this.listSocialUpliftments,
      listCustomaryUseRights: listCustomaryUseRights ?? this.listCustomaryUseRights,
      listSpecialSites: listSpecialSites ?? this.listSpecialSites,
      listSocialUpliftment: listSocialUpliftment ?? this.listSocialUpliftment,
      listSpecialSite: listSpecialSite ?? this.listSpecialSite,
      listCustomaryUseRight: listCustomaryUseRight ?? this.listCustomaryUseRight,
    );
  }

  StakeholderDetailState cleanCache() {
    return StakeholderDetailState(
      error: error,
      loading: loading,
    );
  }
}
