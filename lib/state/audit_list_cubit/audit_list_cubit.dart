import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'audit_list_state.dart';

class AuditListCubit extends HydratedCubit<AuditListState> {
  AuditListCubit() : super(const AuditListState());

  void changeIndexTab(int index) {
    emit(state.copyWith(indexTab: index));
    applyFilters();
  }

  void loadIncomplete() {
    emit(state.copyWith(loading: true));
    try {
      final data = state.listAudits
          .where((element) => element.completed == false)
          .toList();
      emit(state.copyWith(filterAudits: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void loadCompleted() {
    emit(state.copyWith(loading: true));
    try {
      final data = state.listAudits
          .where(
            (element) => element.completed == true && element.synced == false,
          )
          .toList();
      emit(state.copyWith(filterAudits: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void loadSynced() {
    emit(state.copyWith(loading: true));
    try {
      final data = state.listAudits
          .where(
            (element) => element.completed == true && element.synced == true,
          )
          .toList();
      emit(state.copyWith(filterAudits: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> loadListAudits() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;
      final data = await service.getAllAudits();
      emit(state.copyWith(listAudits: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> removeAudit(Audit item, {VoidCallback? callback}) async {
    await cmoDatabaseMasterService.cacheAudit(
      item.copyWith(
        isActive: false,
        synced: false,
      ),
    );
    
    await cmoDatabaseMasterService.removeAudit(item.assessmentId!);
    showSnackSuccess(
      msg: '${LocaleKeys.removeAudit.tr()} ${item.assessmentId}!',
    );

    callback?.call();
    await refresh();
  }

  Future<void> refresh() async {
    final rmUnit = await configService.getActiveRegionalManager();
    emit(state.copyWith(resourceManagerUnit: rmUnit));
    await loadListAudits();
    applyFilters();
  }

  void applyFilters() {
    switch (state.indexTab) {
      case 0:
        loadIncomplete();
        break;
      case 1:
        loadCompleted();
        break;
      case 2:
        loadSynced();
        break;
      default:
        break;
    }
  }

  void searching(String? searchText) {
    emit(state.copyWith(loading: true));
    try {
      if (searchText == null || searchText.isEmpty) {
        emit(
          state.copyWith(
            filterAudits: state.listAudits,
          ),
        );
        applyFilters();
      } else {
        final filteredItems = state.listAudits.where((element) {
          final containName = (element.compartmentName
                      ?.toLowerCase()
                      .contains(searchText.toLowerCase()) ??
                  false) ||
              (element.auditTemplateName
                      ?.toLowerCase()
                      .contains(searchText.toLowerCase()) ??
                  false) ||
              (element.farmName
                      ?.toLowerCase()
                      .contains(searchText.toLowerCase()) ??
                  false);

          var isFilter = false;
          switch (state.indexTab) {
            case 0:
              isFilter = element.completed == false;
              break;
            case 1:
              isFilter = element.completed == true && element.synced == false;
              break;
            case 2:
              isFilter = element.completed == true && element.synced == true;
              break;
            default:
              break;
          }

          return containName && isFilter;
        }).toList();

        emit(
          state.copyWith(
            filterAudits: filteredItems,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  @override
  AuditListState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AuditListState state) {
    return null;
  }
}
