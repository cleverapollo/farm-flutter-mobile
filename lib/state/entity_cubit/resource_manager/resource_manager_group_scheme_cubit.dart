import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/state/entity_cubit/resource_manager/resource_manager_group_scheme_state.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ResourceManagerGroupSchemeCubit extends Cubit<ResourceManagerGroupSchemeState> {
  ResourceManagerGroupSchemeCubit() : super(const ResourceManagerGroupSchemeState());

  Future fetchGroupSchemes({
    required BuildContext context,
  }) async {
    emit(state.copyWith(isGroupSchemeLoading: true));
    List<GroupScheme>? groupSchemes;
    if (context.mounted) {
      groupSchemes = await cmoPerformApiService.fetchGroupSchemes();

      groupSchemes?.sort((first, second) {
        return (first.groupSchemeName ?? '')
            .toLowerCase()
            .compareTo((second.groupSchemeName ?? '').toLowerCase());
      });
    }
    emit(
      state.copyWith(
        isGroupSchemeLoading: false,
        groupSchemes: groupSchemes,
      ),
    );
  }

  void setSelectedGroupScheme(GroupScheme selectedGroupScheme) {
    emit(
      state.copyWith(
        selectedGroupScheme: selectedGroupScheme,
      ),
    );
  }
}
