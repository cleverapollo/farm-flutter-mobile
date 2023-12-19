part of 'stake_holder_detail_cubit.dart';

class StakeholderDetailState {
  final UserRoleEnum? currentUserRole;
  final Object? error;
  final bool? loading;
  final ResourceManagerUnit? resourceManagerUnit;
  final Farm? farm;
  final StakeHolder? stakeHolder;
  final List<StakeHolderType>? listStakeholderTypes;
  final List<FarmStakeholderSocialUpliftment>? listFarmSocialUpliftments;
  final List<FarmStakeholderCustomaryUseRight>? listFarmCustomaryUseRights;
  final List<FarmStakeholderSpecialSite>? listFarmSpecialSites;
  final List<SocialUpliftment>? listSocialUpliftments;
  final List<SpecialSite>? listSpecialSites;
  final List<CustomaryUseRight>? listCustomaryUseRights;

  final bool isSelectTypeError;
  final bool isEntityNameError;
  final bool isContactNameError;

  StakeholderDetailState({
    this.error,
    this.loading,
    this.resourceManagerUnit,
    this.farm,
    this.stakeHolder,
    this.currentUserRole,
    this.listStakeholderTypes = const <StakeHolderType>[],
    this.listFarmSocialUpliftments = const <FarmStakeholderSocialUpliftment>[],
    this.listFarmCustomaryUseRights = const <FarmStakeholderCustomaryUseRight>[],
    this.listFarmSpecialSites = const <FarmStakeholderSpecialSite>[],
    this.listSocialUpliftments = const <SocialUpliftment>[],
    this.listSpecialSites = const <SpecialSite>[],
    this.listCustomaryUseRights = const <CustomaryUseRight>[],
    this.isSelectTypeError = false,
    this.isEntityNameError = false,
    this.isContactNameError = false,
  });

  StakeholderDetailState copyWith({
    Object? error,
    bool? loading,
    ResourceManagerUnit? resourceManagerUnit,
    Farm? farm,
    StakeHolder? stakeHolder,
    List<StakeHolderType>? listStakeholderTypes,
    List<FarmStakeholderSocialUpliftment>? listFarmSocialUpliftments,
    List<FarmStakeholderCustomaryUseRight>? listFarmCustomaryUseRights,
    List<FarmStakeholderSpecialSite>? listFarmSpecialSites,
    List<SocialUpliftment>? listSocialUpliftments,
    List<SpecialSite>? listSpecialSites,
    List<CustomaryUseRight>? listCustomaryUseRights,
    UserRoleEnum? currentUserRole,
    bool? isSelectTypeError,
    bool? isEntityNameError,
    bool? isContactNameError,
  }) {
    return StakeholderDetailState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      resourceManagerUnit: resourceManagerUnit ?? this.resourceManagerUnit,
      farm: farm ?? this.farm,
      stakeHolder: stakeHolder ?? this.stakeHolder,
      listStakeholderTypes: listStakeholderTypes ?? this.listStakeholderTypes,
      listFarmSocialUpliftments: listFarmSocialUpliftments ?? this.listFarmSocialUpliftments,
      listFarmCustomaryUseRights: listFarmCustomaryUseRights ?? this.listFarmCustomaryUseRights,
      listFarmSpecialSites: listFarmSpecialSites ?? this.listFarmSpecialSites,
      listSocialUpliftments: listSocialUpliftments ?? this.listSocialUpliftments,
      listSpecialSites: listSpecialSites ?? this.listSpecialSites,
      listCustomaryUseRights: listCustomaryUseRights ?? this.listCustomaryUseRights,
      currentUserRole: currentUserRole ?? this.currentUserRole,
      isSelectTypeError: isSelectTypeError ?? this.isSelectTypeError,
      isEntityNameError: isEntityNameError ?? this.isEntityNameError,
      isContactNameError: isContactNameError ?? this.isContactNameError,
    );
  }
}
