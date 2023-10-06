import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'audit_state.dart';

class AuditCubit extends HydratedCubit<AuditState> {
  AuditCubit() : super(const AuditState());

  void cleanCache() {
    emit(const AuditState());
  }

  Future<void> updateSelectedFarm(Farm farm) async {
    emit(
      state.copyWith(
        selectedFarm: farm,
        filterFarms: state.farms,
      ),
    );

    await getListCompartments();
  }

  void updateSelectedCompartment(Compartment? compartment) {
    emit(state.copyWith(selectedCompartment: compartment));
  }

  void updateSelectedAuditTemplate(AuditTemplate auditTemplate) {
    emit(state.copyWith(selectedAuditTemplate: auditTemplate));
  }

  String? checkCompleteRequiredField() {
    if (state.selectedAuditTemplate == null) {
      return LocaleKeys.audit_template_is_required.tr();
    } else if (state.selectedFarm == null) {
      return LocaleKeys.site_is_required.tr();
    }

    return null;
  }

  Future<Audit?> submit() async {
    Audit? audit;
    try {
      final errorMessage = checkCompleteRequiredField();
      if (errorMessage.isNotBlank) {
        showSnackError(msg: errorMessage!);
        return null;
      }

      emit(state.copyWith(loading: true));
      audit = Audit(
        assessmentId: DateTime.now().millisecondsSinceEpoch,
        auditTemplateId: state.selectedAuditTemplate?.auditTemplateId,
        auditTemplateName: state.selectedAuditTemplate?.auditTemplateName,
        farmName: state.selectedFarm?.farmName,
        farmId: state.selectedFarm?.farmId,
        compartmentId: state.selectedCompartment?.managementUnitId,
        compartmentName: state.selectedCompartment?.unitNumber,
        created: DateTime.now().toIso8601String(),
      );

      final service = cmoDatabaseMasterService;
      int? newId;
      newId = await service.cacheAudit(audit);
      showSnackSuccess(msg: 'Save audit success with id: $newId');
    } catch (e) {
      showSnackError(msg: e.toString());
      return null;
    } finally {
      emit(state.copyWith(loading: false));
    }

    return audit;
  }

  Future<void> getListAuditTemplates() async {
    final service = cmoDatabaseMasterService;
    final groupSchemeUnit = await configService.getActiveRegionalManager();
    final auditTemplates = await service
        .getAuditTemplatesByRMU(groupSchemeUnit?.regionalManagerUnitId ?? 0);
    emit(state.copyWith(auditTemplates: auditTemplates));
  }

  Future<void> getListSites() async {
    final rmu = await configService.getActiveRegionalManager();
    final service = cmoDatabaseMasterService;
    final sites = await service.getFarmByRmuId(rmu?.regionalManagerUnitId);
    emit(state.copyWith(
      farms: sites,
      filterFarms: sites,
    ));
  }

  Future<void> getListCompartments() async {
    final activeGroupScheme = await configService.getActiveGroupScheme();
    final compartments = await cmoDatabaseMasterService.getCompartmentsByGroupSchemeIdAndFarmId(
      groupSchemeId: activeGroupScheme?.groupSchemeId,
      farmId: state.selectedFarm?.farmId,
    );

    emit(state.copyWith(compartments: [const Compartment(unitNumber: 'None'),...compartments]));
  }

  Future<void> initialize() async {
    try {
      cleanCache();
      await getListAuditTemplates();
      await getListSites();
    } catch (error) {
      handleError(error);
    }
  }

  void handleError(Object error) {
    logger.d(error);
  }

  void searchSites(String? searchText) {
    emit(state.copyWith(loading: true));
    try {
      if (searchText == null || searchText.isEmpty) {
        emit(
          state.copyWith(
            filterFarms: state.farms,
          ),
        );
      } else {
        final filteredItems = state.farms
            .where(
              (element) =>
                  element.farmName
                      ?.toLowerCase()
                      .contains(searchText.toLowerCase()) ??
                  false,
            )
            .toList();

        emit(
          state.copyWith(
            filterFarms: filteredItems,
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
  AuditState? fromJson(Map<String, dynamic> json) {
    return AuditState(cacheCreateData: json);
  }

  @override
  Map<String, dynamic>? toJson(AuditState state) {
    return state.cacheCreateData;
  }
}
