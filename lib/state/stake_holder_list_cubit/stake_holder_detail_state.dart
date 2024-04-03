part of 'stake_holder_detail_cubit.dart';

class StakeholderDetailState extends BaseState {
  final UserRoleEnum? currentUserRole;
  final ResourceManagerUnit? resourceManagerUnit;
  final Farm? farm;
  final StakeHolder? stakeHolder;
  final List<StakeHolderType>? listStakeholderTypes;
  final List<FarmStakeholderSocialUpliftment> listFarmSocialUpliftments;
  final List<FarmStakeholderCustomaryUseRight> listFarmCustomaryUseRights;
  final List<FarmStakeholderSpecialSite> listFarmSpecialSites;
  final List<SocialUpliftment> listSocialUpliftments;
  final List<SpecialSite> listSpecialSites;
  final List<CustomaryUseRight> listCustomaryUseRights;
  final List<SocialUpliftment> selectedSocialUpliftments;
  final List<SpecialSite> selectedSpecialSites;
  final List<CustomaryUseRight> selectedCustomaryUseRights;

  final bool isSelectTypeError;
  final bool isEntityNameError;
  final bool isContactNameError;

  StakeholderDetailState({
    super.error,
    super.loading,
    super.isEditing,
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
    this.selectedSocialUpliftments = const <SocialUpliftment>[],
    this.selectedSpecialSites = const <SpecialSite>[],
    this.selectedCustomaryUseRights = const <CustomaryUseRight>[],
    this.isSelectTypeError = false,
    this.isEntityNameError = false,
    this.isContactNameError = false,
  });

  StakeholderDetailState copyWith({
    Object? error,
    bool? loading,
    bool? isEditing,
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
    List<SocialUpliftment>? selectedSocialUpliftments,
    List<SpecialSite>? selectedSpecialSites,
    List<CustomaryUseRight>? selectedCustomaryUseRights,
    UserRoleEnum? currentUserRole,
    bool? isSelectTypeError,
    bool? isEntityNameError,
    bool? isContactNameError,
  }) {
    return StakeholderDetailState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      isEditing: isEditing ?? this.isEditing,
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
      selectedSocialUpliftments: selectedSocialUpliftments ?? this.selectedSocialUpliftments,
      selectedSpecialSites: selectedSpecialSites ?? this.selectedSpecialSites,
      selectedCustomaryUseRights: selectedCustomaryUseRights ?? this.selectedCustomaryUseRights,
    );
  }
}
