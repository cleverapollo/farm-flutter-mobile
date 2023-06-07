import 'package:cmo/di.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/entity_cubit/resource_manager/resource_manager_unit_state.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ResourceManagerUnitCubit extends Cubit<ResourceManagerUnitState> {
  int groupSchemeId;

  ResourceManagerUnitCubit({required this.groupSchemeId})
      : super(const ResourceManagerUnitState());

  Future fetchResourceManagerUnits({
    required BuildContext context,
  }) async {
    emit(state.copyWith(isResourceManagerUnitLoading: true));
    List<ResourceManagerUnit>? resourceManagerUnits;
    if (context.mounted) {
      resourceManagerUnits =
          await cmoPerformApiService.fetchResourceManagerUnits(groupSchemeId);
    }
    emit(
      state.copyWith(
        isResourceManagerUnitLoading: false,
        resourceManagerUnits: resourceManagerUnits,
      ),
    );
  }

  void setSelectedResourceManagerUnit(ResourceManagerUnit selectedItem) {
    emit(
      state.copyWith(
        selectedResourceManagerUnit: selectedItem,
      ),
    );
  }
}
