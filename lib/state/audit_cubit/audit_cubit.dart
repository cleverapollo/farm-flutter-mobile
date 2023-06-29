import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
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

  Future<void> updateSelectedFarm(String siteId) async {
    final farm = state.farms.firstWhereOrNull((element) => element.farmId == siteId, orElse: null);
    emit(state.copyWith(selectedFarm: farm));
    await getListCompartments();
  }

  void updateSelectedCompartment(int compartmentId) {
    final compartment = state.compartments.firstWhereOrNull(
      (element) => element.compartmentId == compartmentId,
      orElse: null,
    );
    emit(state.copyWith(selectedCompartment: compartment));
  }

  void updateSelectedAuditTemplate(int auditTemplateId) {
    final auditTemplate = state.auditTemplates.firstWhereOrNull(
      (element) => element.auditTemplateId == auditTemplateId,
      orElse: null,
    );
    emit(state.copyWith(selectedAuditTemplate: auditTemplate));
  }

  Future<bool> submit(
    Audit value,
  ) async {
    try {
      emit(state.copyWith(loading: true));
      final service = cmoDatabaseMasterService;
      int? newId;
      newId = await service.cacheAudit(value);
      showSnackSuccess(msg: 'Save audit success with id: $newId');
    } catch (e) {
      showSnackError(msg: e.toString());
      return false;
    } finally {
      emit(state.copyWith(loading: false));
    }

    return true;
  }

  Future<void> getListAuditTemplates() async {
    final service = cmoDatabaseMasterService;
    final auditTemplates = await service.getAuditTemplates();
    emit(state.copyWith(auditTemplates: auditTemplates));
  }

  Future<void> getListSites() async {
    final rmu = await configService.getActiveRegionalManager();
    final service = cmoDatabaseMasterService;
    final sites = await service.getFarmByRmuId(rmu?.regionalManagerUnitId);
    emit(state.copyWith(farms: sites));
  }

  Future<void> getListCompartments() async {
    final rmu = await configService.getActiveRegionalManager();
    final compartments =
        await cmoDatabaseMasterService.getCompartmentsByRmuIdAndSiteId(
      rmuId: rmu?.regionalManagerUnitId,
      siteId: state.selectedFarm?.farmId,
    );

    emit(state.copyWith(compartments: compartments));
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

  @override
  AuditState? fromJson(Map<String, dynamic> json) {
    return AuditState(cacheCreateData: json);
  }

  @override
  Map<String, dynamic>? toJson(AuditState state) {
    return state.cacheCreateData;
  }
}
