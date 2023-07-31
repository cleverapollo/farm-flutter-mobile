import 'package:cmo/di.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class MemberManagementCubit extends Cubit<MemberManagementState> {
  MemberManagementCubit() : super(const MemberManagementState());

  Future init() async {
    final groupScheme = await configService.getActiveGroupScheme();
    final rmUnit = await configService.getActiveRegionalManager();
    if (rmUnit?.id == null) {
      return;
    }
    var data = await cmoDatabaseMasterService.getFarmsByRMUnit(rmUnit!.id);
    if (data == null) {
      return;
    }
    emit(state.copyWith(
      groupScheme: groupScheme,
      resourceManagerUnit: rmUnit,
      allFarms: data,
    ));
    _applySearch(isInCompleteSelected: true);
  }

  Future reload() async {
    final rmUnit = await configService.getActiveRegionalManager();
    if (rmUnit?.id == null) {
      return;
    }
    // it hack to show updated member management since member on-boarding step is updating.
    await Future.delayed(Duration(seconds: 1));
    var data = await cmoDatabaseMasterService.getFarmsByRMUnit(rmUnit!.id);
    emit(state.copyWith(allFarms: data));
    _applySearch(isInCompleteSelected: state.isInCompleteSelected);
  }

  void onSearchTextChanged(String? value) {
    _applySearch(
        searchText: value, isInCompleteSelected: state.isInCompleteSelected);
  }

  void onFilterGroupChanged(bool isInCompleteSelected) {
    _applySearch(
        searchText: state.filteringText,
        isInCompleteSelected: isInCompleteSelected);
  }

  void _applySearch({String? searchText, required bool isInCompleteSelected}) {
    var filteringItems = state.allFarms.where((element) => !isInCompleteSelected
        ? element.isGroupSchemeMember == true
        : element.isGroupSchemeMember != true);
    if (searchText?.isNotEmpty ?? false) {
      filteringItems = filteringItems.where((element) {
        final searchStr = searchText!.toLowerCase();
        final existFarmName = element.farmName?.toLowerCase().contains(searchStr) ?? false;
        final existFirstName = element.firstName?.toLowerCase().contains(searchStr) ?? false;
        final existLastName = element.lastName?.toLowerCase().contains(searchStr) ?? false;
        return existFarmName || existFirstName || existLastName;
      });
    }
    emit(state.copyWith(
      filteringFarms: filteringItems.toList(),
      filteringText: searchText ?? '',
      isInCompleteSelected: isInCompleteSelected,
    ));
  }
}
