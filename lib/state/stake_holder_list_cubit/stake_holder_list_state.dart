part of 'stake_holder_list_cubit.dart';

class StakeHolderListState {
  const StakeHolderListState({
    this.listStakeholderTypes = const <StakeHolderType>[],
    this.listStakeHolders = const <StakeHolder>[],
    this.filterListStakeHolders = const <StakeHolder>[],
    this.loadingList = false,
    this.error,
  });

  final bool loadingList;
  final Object? error;
  final List<StakeHolder> listStakeHolders;
  final List<StakeHolder> filterListStakeHolders;
  final List<StakeHolderType> listStakeholderTypes;

  StakeHolderListState copyWith({
    bool? loadingList,
    Object? error,
    List<StakeHolderType>? listStakeholderTypes,
    List<StakeHolder>? listStakeHolders,
    List<StakeHolder>? filterListStakeHolders,
    Map<String, dynamic>? cacheCreateData,
  }) {
    return StakeHolderListState(
      loadingList: loadingList ?? this.loadingList,
      error: error ?? this.error,
      filterListStakeHolders: filterListStakeHolders ?? this.filterListStakeHolders,
      listStakeHolders: listStakeHolders ?? this.listStakeHolders,
      listStakeholderTypes: listStakeholderTypes ?? this.listStakeholderTypes,
    );
  }
}
