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
  AuditCubit({
    Farm? selectedFarm,
  }) : super(
          AuditState(
            selectedFarm: selectedFarm,
          ),
        ) {
    initialize();
  }

  Future<void> initialize() async {
    try {
      await getListAuditTemplates();
      await getListSites();
    } catch (error) {
      handleError(error);
    }
  }

  Future<void> updateSelectedFarm(Farm farm) async {
    emit(
      state.copyWith(
        selectedFarm: farm,
        filterFarms: state.farms,
      ),
    );

    // await getListCompartments();
  }

  Future<void> updateSelectedAuditTemplate(AuditTemplate auditTemplate) async {
    emit(state.copyWith(selectedAuditTemplate: auditTemplate));
    await getPrepopulateAudit();
  }

  void updateSelectedCompartment(Compartment? compartment) {
    emit(state.copyWith(selectedCompartment: compartment));
  }

  void selectPrepopulateAudit(bool isPrepopulate) {
    if (state.isDisablePrepopulateAudit) return;
    emit(state.copyWith(isPrepopulateAudit: isPrepopulate));
  }

  Future<void> getPrepopulateAudit() async {
    if (state.selectedAuditTemplate?.auditTemplateId == null) return;
    final prepopulateAudit = await cmoDatabaseMasterService.getAuditByAuditTemplateId(
      auditTemplateId: state.selectedAuditTemplate?.auditTemplateId,
    );

    emit(
      state.copyWith(
        isDisablePrepopulateAudit: prepopulateAudit == null,
        isPrepopulateAudit: prepopulateAudit != null,
        prepopulateAudit: prepopulateAudit,
      ),
    );
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
      if (state.isPrepopulateAudit) {
        await cacheQuestionAnswersFromPrepopulateAudit(audit);
        await cacheQuestionCommentFromPrepopulateAudit(audit);
      }

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

  Future<void> cacheQuestionAnswersFromPrepopulateAudit(Audit audit) async {
    final rmu = await configService.getActiveRegionalManager();
    final answers = await cmoDatabaseMasterService.getQuestionAnswersByRmuIdAndAuditTemplateIdAndAssessmentId(
      rmuId: rmu?.regionalManagerUnitId,
      auditTemplateId: state.prepopulateAudit?.auditTemplateId,
      assessmentId: state.prepopulateAudit?.assessmentId,
    );

    final futures = <Future<void>>[];
    var now = DateTime.now().millisecondsSinceEpoch;
    for (final answer in answers) {
      futures.add(
        cmoDatabaseMasterService.cacheQuestionAnswer(
          answer.copyWith(
            assessmentId: audit.assessmentId,
            questionAnswerId: now++,
            latitude: null,
            longitude: null,
          ),
        ),
      );
    }

    await Future.wait(futures);
  }

  Future<void> cacheQuestionCommentFromPrepopulateAudit(Audit audit) async {
    final questionComments = await cmoDatabaseMasterService.getQuestionCommentsByAssessmentId(
      state.prepopulateAudit?.assessmentId,
    );

    final futures = <Future<void>>[];
    for (final questionComment in questionComments) {
      futures.add(
        cmoDatabaseMasterService.cacheQuestionComment(
          questionComment.copyWith(
            assessmentId: audit.assessmentId,
            commentId: generatorInt32Id(),
          ),
        ),
      );
    }

    await Future.wait(futures);
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
