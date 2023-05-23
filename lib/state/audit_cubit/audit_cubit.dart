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

  void updateCacheCreateData(Map<String, dynamic> data) {
    emit(
      state.copyWith(
        cacheCreateData: data,
      ),
    );
  }

  void cleanCache() {
    emit(state.copyWith(cacheCreateData: <String, dynamic>{}));
  }

  void updateSelectedSiteName(int siteId) {
    final siteName = state.sites.firstWhereOrNull((element) => element.siteId == siteId, orElse: null)?.siteName;
    emit(state.copyWith(selectedSiteName: siteName ?? ''));
  }

  void updateSelectedCompartmentName(int compartmentId) {
    final compartmentName = state.compartments
        .firstWhereOrNull((element) => element.compartmentId == compartmentId, orElse: null)
        ?.compartmentName;
    emit(state.copyWith(selectedCompartmentName: compartmentName ?? ''));
  }

  void updateSelectedAuditTemplateName(int auditTemplateId) {
    final auditTemplateName = state.auditTemplates
        .firstWhereOrNull((element) => element.auditTemplateId == auditTemplateId, orElse: null)
        ?.auditTemplateName;
    emit(state.copyWith(selectedAuditTemplateName: auditTemplateName ?? ''));
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

  Future<void> initialize() async {
    try {

      const auditTemplates = <AuditTemplate>[
        AuditTemplate(auditTemplateId: 1, auditTemplateName: 'An Audit Template 1'),
        AuditTemplate(auditTemplateId: 2, auditTemplateName: 'An Audit Template 2'),
      ];

      emit(state.copyWith(auditTemplates: auditTemplates));

      const sites = <Site>[
        Site(siteId: 1, siteName: 'Site name 1'),
        Site(siteId: 2, siteName: 'Site name 2'),
      ];

      emit(state.copyWith(sites: sites));

      final compartments = <Compartment>[
        Compartment(compartmentId: 1, compartmentName: 'Compartment 1'),
        Compartment(compartmentId: 2, compartmentName: 'Compartment 2'),
      ];

      emit(state.copyWith(compartments: compartments));

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
