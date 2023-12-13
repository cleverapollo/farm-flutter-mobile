part of 'stake_holder_detail_cubit.dart';

class StakeholderDetailState {
  final UserRoleEnum? currentUserRole;
  final Object? error;
  final bool? loading;
  final ResourceManagerUnit? resourceManagerUnit;
  final Farm? farm;
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
    this.stakeHolder,
    this.currentUserRole,
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
    StakeHolder? stakeHolder,
    List<StakeHolderType>? listStakeholderTypes,
    List<FarmStakeholderSocialUpliftment>? listSocialUpliftments,
    List<FarmStakeholderCustomaryUseRight>? listCustomaryUseRights,
    List<FarmStakeholderSpecialSite>? listSpecialSites,
    List<SocialUpliftment>? listSocialUpliftment,
    List<SpecialSite>? listSpecialSite,
    List<CustomaryUseRight>? listCustomaryUseRight,
    UserRoleEnum? currentUserRole,
  }) {
    return StakeholderDetailState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      resourceManagerUnit: resourceManagerUnit ?? this.resourceManagerUnit,
      farm: farm ?? this.farm,
      stakeHolder: stakeHolder ?? this.stakeHolder,
      listStakeholderTypes: listStakeholderTypes ?? this.listStakeholderTypes,
      listSocialUpliftments: listSocialUpliftments ?? this.listSocialUpliftments,
      listCustomaryUseRights: listCustomaryUseRights ?? this.listCustomaryUseRights,
      listSpecialSites: listSpecialSites ?? this.listSpecialSites,
      listSocialUpliftment: listSocialUpliftment ?? this.listSocialUpliftment,
      listSpecialSite: listSpecialSite ?? this.listSpecialSite,
      listCustomaryUseRight: listCustomaryUseRight ?? this.listCustomaryUseRight,
      currentUserRole: currentUserRole ?? this.currentUserRole,
    );
  }

  StakeholderDetailState cleanCache() {
    return StakeholderDetailState(
      error: error,
      loading: loading,
    );
  }
}
