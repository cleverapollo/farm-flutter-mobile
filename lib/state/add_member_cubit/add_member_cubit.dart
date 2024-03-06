import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberDetailCubit extends Cubit<MemberDetailState> {
  MemberDetailCubit(Farm? farm) : super(MemberDetailState(farm: farm)) {
    initData();
  }

  Future<void> initData() async {
    emit(state.copyWith(isLoading: true));
    final activeGroupScheme = await configService.getActiveGroupScheme();
    final activeRmu = await configService.getActiveRegionalManager();
    emit(
      state.copyWith(
        activeGroupScheme: activeGroupScheme,
        farm: state.farm ?? Farm(
          farmId: DateTime
              .now()
              .millisecondsSinceEpoch
              .toString(),
          groupSchemeId: activeGroupScheme?.groupSchemeId,
          regionalManagerUnitId: activeRmu?.regionalManagerUnitId,
          isActive: true,
          createDT: DateTime.now(),
          updateDT: DateTime.now(),
          inclusionDate: DateTime.now().toString(),
        ),
      ),
    );

    await initMemberSLIMFState();
    await initMemberPropertyOwnershipState();
    initMemberDetailsState();
    await initMemberSiteDetailsState();
    await initDataRiskProfileQuestion();
    await initDataFarmMemberObjectives();
    initAddMemberSAF();
    emit(state.copyWith(isLoading: false));
  }

  Future<void> initMemberSLIMFState() async {
    final isMemberSLIMFStateCompleted = state.farm?.isSlimfCompliant != null;
    final memberSLIMFState = MemberSLIMFState(
      isComplete: isMemberSLIMFStateCompleted,
      isSlimfCompliant: state.farm?.isSlimfCompliant,
    );

    emit(
      state.copyWith(
        memberSLIMFState: memberSLIMFState,
      ),
    );
  }

  Future<void> initMemberPropertyOwnershipState() async {
    final propertyTypes = await cmoDatabaseMasterService.getFarmPropertyOwnershipType();
    FarmPropertyOwnershipType? propertyTypeSelected;
    for (final item in propertyTypes) {
      if (item.farmPropertyOwnershipTypeId == state.farm?.propertyOwnershipTypeId) {
        propertyTypeSelected = item;
      }
    }

    final addMemberMPOIsComplete = propertyTypeSelected != null;
    final memberPropertyOwnershipState = MemberPropertyOwnershipState(
      isComplete: addMemberMPOIsComplete,
      propertyTypeSelected: propertyTypeSelected,
      propertyTypes: propertyTypes,
    );

    emit(
      state.copyWith(
        memberPropertyOwnershipState: memberPropertyOwnershipState,
      ),
    );
  }

  void initMemberDetailsState() {
    emit(
      state.copyWith(
        memberDetailSectionState: MemberDetailSectionState(
          firstName: state.farm?.firstName,
          lastName: state.farm?.lastName,
          idNumber: state.farm?.idNumber,
          mobileNumber: state.farm?.mobileNumber,
          emailAddress: state.farm?.email,
        ),
      ),
    );
  }

  Future<void> initMemberSiteDetailsState() async {
    await updateFarmSizeByCompartments();
    final asis = await cmoDatabaseMasterService.getAsiRegisterByFarmId(state.farm?.farmId);

    final isCompleteASI = asis.isNotEmpty;
    final memberSiteDetailsState = MemberSiteDetailsState(
      isCompleteASI: isCompleteASI,
      siteName: state.farm?.farmName,
      town: state.farm?.town,
      province: state.farm?.province,
      lat: double.tryParse(state.farm?.latitude ?? ''),
      lng: double.tryParse(state.farm?.longitude ?? ''),
      addMemberAsisState: AddMemberAsisState(asis: asis),
    );

    emit(
      state.copyWith(
        memberSiteDetailsState: memberSiteDetailsState,
      ),
    );
  }

  void initAddMemberSAF() {
    final addMemberSAF = AddMemberSAF(
      signatureDate: state.farm?.signatureDate,
      signatureImage: state.farm?.signatureImage,
      signaturePoints: state.farm?.signaturePoints,
      isComplete: state.farm?.signatureDate != null,
    );

    emit(
      state.copyWith(
        addMemberSAF: addMemberSAF,
      ),
    );
  }

  Future<void> initDataRiskProfileQuestion() async {
    final activeGroupScheme = await configService.getActiveGroupScheme();

    final riskProfileQuestions =
        await cmoDatabaseMasterService.getRiskProfileQuestionByGroupSchemeId(
      activeGroupScheme?.groupSchemeId,
    );

    final farmMemberRiskProfileAnswer = await cmoDatabaseMasterService
        .getFarmMemberRiskProfileAnswerByFarmId(state.farm?.farmId);

    final listAnswer = <FarmMemberRiskProfileAnswer>[];

    var now = DateTime.now().millisecondsSinceEpoch;

    for (final question in riskProfileQuestions) {
      final currentAnswer = farmMemberRiskProfileAnswer.firstWhereOrNull(
        (element) =>
            element.riskProfileQuestionId == question.riskProfileQuestionId,
      );

      if (currentAnswer != null) {
        listAnswer.add(currentAnswer);
      } else {
        final answer = FarmMemberRiskProfileAnswer(
          farmId: state.farm?.farmId,
          riskProfileQuestionId: question.riskProfileQuestionId,
          farmMemberRiskProfileAnswerNo: (now++).toString(),
        );

        listAnswer.add(answer);
      }
    }

    emit(
      state.copyWith(
        farmMemberRiskAssessmentsState:
            state.farmMemberRiskAssessmentsState.copyWith(
          listRiskProfileQuestions: riskProfileQuestions,
          listFarmMemberRiskProfileAnswers: listAnswer,
        ),
      ),
    );
  }

  Future<void> initDataFarmMemberObjectives() async {
    final activeGroupScheme = await configService.getActiveGroupScheme();

    final farmMemberObjective =
        await cmoDatabaseMasterService.getAllFarmMemberObjectiveByGroupSchemeId(
      activeGroupScheme?.groupSchemeId,
    );

    final farmObjectiveOption =
        await cmoDatabaseMasterService.getFarmObjectiveOptionByGroupSchemeId(
      activeGroupScheme?.groupSchemeId,
    );

    final farmMemberObjectiveAnswer = await cmoDatabaseMasterService
        .getFarmMemberObjectiveAnswerByFarmId(state.farm?.farmId);

    final listAnswer = <FarmMemberObjectiveAnswer>[];

    var now = DateTime.now().millisecondsSinceEpoch;

    for (final question in farmMemberObjective) {
      final currentAnswer = farmMemberObjectiveAnswer.firstWhereOrNull(
          (element) =>
              element.farmMemberObjectiveId == question.farmMemberObjectiveId);
      if (currentAnswer != null) {
        listAnswer.add(currentAnswer);
      } else {
        final answer = FarmMemberObjectiveAnswer(
          farmMemberObjectiveId: question.farmMemberObjectiveId,
          farmMemberObjectiveAnswerNo: (now++).toString(),
          farmId: state.farm?.farmId,
        );

        listAnswer.add(answer);
      }
    }

    emit(
      state.copyWith(
        farmMemberObjectivesState: state.farmMemberObjectivesState.copyWith(
          listFarmMemberObjectiveAnswers: listAnswer,
          listFarmObjectiveOptions: farmObjectiveOption,
          listFarmMemberObjectives: farmMemberObjective,
        ),
      ),
    );
  }

  Future<void> cacheFarm() async {
    await cmoDatabaseMasterService.cacheFarm(
      state.farm?.copyWith(
        isMasterDataSynced: false,
        createDT: state.farm?.createDT ?? DateTime.now(),
        updateDT: DateTime.now(),
      ),
    );
  }

  Future<void> onUpdateSlimfSection(bool isSlimf) async {
    emit(
      state.copyWith(
        farm: state.farm?.copyWith(
          isSlimfCompliant: isSlimf,
          isMasterDataSynced: false,
        ),
        memberSLIMFState: MemberSLIMFState(
          isSlimfCompliant: isSlimf,
          isComplete: true,
          isSectionCollapse: true,
        ),
      ),
    );

    onChangeMPOState(isCollapse: false);
    checkIsGroupSchemeMember();
    await cacheFarm();
  }

  Future<void> onUpdateMemberPropertyOwnershipState(
      FarmPropertyOwnershipType? propertyTypeSelected,
      ) async {
    emit(
      state.copyWith(
        farm: state.farm?.copyWith(
          propertyOwnershipTypeId: propertyTypeSelected?.farmPropertyOwnershipTypeId,
          isMasterDataSynced: false,
        ),
        memberPropertyOwnershipState: state.memberPropertyOwnershipState.copyWith(
          propertyTypeSelected: propertyTypeSelected,
          isComplete: true,
          isSectionCollapse: true,
        ),
      ),
    );

    checkIsGroupSchemeMember();
    onChangeMemberDetailState(isCollapse: false);
    await cacheFarm();
  }

  Future<void> onChangeMemberDetailSection({
    String? firstName,
    String? lastName,
    String? idNumber,
    String? mobileNumber,
    String? emailAddress,
  }) async {
    emit(
      state.copyWith(
        memberDetailSectionState: state.memberDetailSectionState.copyWith(
          firstName: firstName ?? state.memberDetailSectionState.firstName,
          lastName: lastName ?? state.memberDetailSectionState.lastName,
          idNumber: idNumber ?? state.memberDetailSectionState.idNumber,
          mobileNumber: mobileNumber ?? state.memberDetailSectionState.mobileNumber,
          emailAddress: emailAddress ?? state.memberDetailSectionState.emailAddress,
        ),
      ),
    );

    emit(
      state.copyWith(
        farm: state.farm?.copyWith(
          firstName: state.memberDetailSectionState.firstName,
          lastName: state.memberDetailSectionState.lastName,
          idNumber: state.memberDetailSectionState.idNumber,
          mobileNumber: state.memberDetailSectionState.mobileNumber,
          email: state.memberDetailSectionState.emailAddress,
          isMasterDataSynced: false,
        ),
        memberDetailSectionState: state.memberDetailSectionState.copyWith(
          isFirstNameError:
              firstName?.isBlank ?? state.memberDetailSectionState.isFirstNameError,
          isLastNameError:
              lastName?.isBlank ?? state.memberDetailSectionState.isLastNameError,
          isIdNumberError: idNumber == null
              ? state.memberDetailSectionState.isIdNumberError
              : (idNumber.isBlank || idNumber.length < 8),
          isMobileNumberError: mobileNumber == null
              ? state.memberDetailSectionState.isMobileNumberError
              : (mobileNumber.isBlank || mobileNumber.length < 8),
          isEmailError: emailAddress == null
              ? state.memberDetailSectionState.isEmailError
              : (state.memberDetailSectionState.emailAddress.isNullOrEmpty ||
                  !state.memberDetailSectionState.emailAddress.validEmail),
        ),
      ),
    );

    if (state.memberDetailSectionState.isComplete) {
      checkIsGroupSchemeMember();
      await Future.delayed(const Duration(milliseconds: 500));
      await cacheFarm();
    }
  }

  Future<void> updateFarmSizeByCompartments({
    bool shouldCacheFarm = false,
  }) async {
    final compartments = await cmoDatabaseMasterService.getCompartmentByFarmId(
      state.farm?.farmId,
    );

    var totalArea = 0.0;
    for (final compartment in compartments) {
      totalArea += compartment.polygonArea ?? 0;
    }

    emit(
      state.copyWith(
        farm: state.farm?.copyWith(farmSize: totalArea),
      ),
    );

    if (shouldCacheFarm) {
      await Future.delayed(const Duration(milliseconds: 500));
      await cacheFarm();
    }
  }

  Future<void> onChangeMemberSiteDetailSection({
    String? siteName,
    String? town,
    String? province,
    double? siteLocationLat,
    double? siteLocationLng,
    String? siteLocationAddress,
    List<Asi>? asis,
  }) async {
    final data = state.memberSiteDetailsState;
    if (asis != null) {
      emit(state.copyWith(
          memberSiteDetailsState: data.copyWith(
              addMemberAsisState: AddMemberAsisState(asis: asis))));
    }

    emit(
      state.copyWith(
        memberSiteDetailsState: state.memberSiteDetailsState.copyWith(
          siteName: siteName ?? state.memberSiteDetailsState.siteName,
          town: town ?? state.memberSiteDetailsState.town,
          province: province ?? state.memberSiteDetailsState.province,
          isSiteNameError: siteName?.isBlank ?? state.memberSiteDetailsState.isSiteNameError,
          isTownError: town?.isBlank ?? state.memberSiteDetailsState.isTownError,
          isProvinceError: province?.isBlank ?? state.memberSiteDetailsState.isProvinceError,
          lat: siteLocationLat ?? state.memberSiteDetailsState.lat,
          lng: siteLocationLng ?? state.memberSiteDetailsState.lng,
        ),
      ),
    );

    final currentData = state.memberSiteDetailsState;

    final isCompleteAsi = currentData.addMemberAsisState.asis.isNotEmpty;

    emit(state.copyWith(
        farm: state.farm?.copyWith(
          farmName: currentData.siteName,
          town: currentData.town,
          province: currentData.province,
          latitude: currentData.lat.toString(),
          longitude: currentData.lng.toString(),
          streetName: currentData.initAddressForSiteLocation(),
          isMasterDataSynced: false,
        ),
        memberSiteDetailsState: currentData.copyWith(
          isCompleteASI: isCompleteAsi,
        )));

    if (currentData.isComplete) {
      checkIsGroupSchemeMember();
      await Future.delayed(const Duration(milliseconds: 500));
      await cacheFarm();
    }
  }

  Future<void> onAnswerRiskProfileQuestion({
    required RiskProfileQuestion question,
    required bool answer,
  }) async {
    final farmMemberRiskAssessmentsState = state.farmMemberRiskAssessmentsState;
    final listFarmMemberRiskProfileAnswers = <FarmMemberRiskProfileAnswer>[];
    listFarmMemberRiskProfileAnswers.addAll(farmMemberRiskAssessmentsState.listFarmMemberRiskProfileAnswers);
    var currentAnswer = listFarmMemberRiskProfileAnswers.firstWhereOrNull(
          (element) =>
      element.riskProfileQuestionId == question.riskProfileQuestionId,
    );

    if (currentAnswer != null) {
      listFarmMemberRiskProfileAnswers.remove(currentAnswer);
      currentAnswer = currentAnswer.copyWith(answer: answer);
      listFarmMemberRiskProfileAnswers.add(
        currentAnswer.copyWith(
          isMasterDataSynced: false,
        ),
      );
      emit(
        state.copyWith(
          farm: state.farm?.copyWith(riskProfileAnswers: listFarmMemberRiskProfileAnswers),
          farmMemberRiskAssessmentsState: state.farmMemberRiskAssessmentsState.copyWith(
            listFarmMemberRiskProfileAnswers: listFarmMemberRiskProfileAnswers,
          ),
        ),
      );

      final futures = <Future<dynamic>>[];

      for (final item in listFarmMemberRiskProfileAnswers) {
        futures.add(cmoDatabaseMasterService.cacheFarmMemberRiskProfileAnswer(item));
      }

      checkIsGroupSchemeMember();
      futures.add(cacheFarm());

      await Future.wait(futures);

      if (question.id == state.farmMemberRiskAssessmentsState.listRiskProfileQuestions.last.id) {
        onChangeMemberRiskAssessmentState(isCollapse: true);
        onChangeMemberFarmObjectiveState(isCollapse: false);
      }
    }
  }

  Future<void> onAnswerFarmMemberObjective({
    required FarmMemberObjective question,
    required int farmObjectiveOptionId,
  }) async {
    final farmMemberObjectivesState = state.farmMemberObjectivesState;
    final listFarmMemberObjectiveAnswers = <FarmMemberObjectiveAnswer>[];
    listFarmMemberObjectiveAnswers
        .addAll(farmMemberObjectivesState.listFarmMemberObjectiveAnswers);
    var currentAnswer = listFarmMemberObjectiveAnswers.firstWhereOrNull(
            (element) =>
        element.farmMemberObjectiveId == question.farmMemberObjectiveId);
    if (currentAnswer != null) {
      listFarmMemberObjectiveAnswers.remove(currentAnswer);
      currentAnswer = currentAnswer.copyWith(
        farmObjectiveOptionId: farmObjectiveOptionId,
        isMasterDataSynced: false,
      );
      listFarmMemberObjectiveAnswers.add(currentAnswer);
      emit(
        state.copyWith(
          farm: state.farm?.copyWith(
            objectiveAnswers: listFarmMemberObjectiveAnswers,
            isMasterDataSynced: false,
          ),
          farmMemberObjectivesState: state.farmMemberObjectivesState.copyWith(
            listFarmMemberObjectiveAnswers: listFarmMemberObjectiveAnswers,
          ),
        ),
      );

      final futures = <Future<dynamic>>[];

      for (final item in listFarmMemberObjectiveAnswers) {
        futures.add(cmoDatabaseMasterService.cacheFarmMemberObjectiveAnswer(item));
      }

      checkIsGroupSchemeMember();
      futures.add(cacheFarm());

      await Future.wait(futures);
    }
  }

  void checkIsGroupSchemeMember() {
    final isGroupSchemeMember = state.memberSLIMFState.isComplete &&
        state.memberPropertyOwnershipState.isComplete &&
        state.memberDetailSectionState.isComplete &&
        state.memberSiteDetailsState.isComplete &&
        state.farmMemberRiskAssessmentsState.isComplete &&
        state.farmMemberObjectivesState.isComplete &&
        state.addMemberSAF.isComplete;

    final isProspectMember = !isGroupSchemeMember &&
        state.memberSLIMFState.isComplete &&
        state.memberPropertyOwnershipState.isComplete &&
        state.memberDetailSectionState.isComplete;

    emit(
      state.copyWith(
        farm: state.farm?.copyWith(
          isGroupSchemeMember: isGroupSchemeMember,
          isProspectMember: isProspectMember,
        ),
      ),
    );
  }

  void onExpandedSAF(bool p0) {
    emit(state.copyWith(
        addMemberSAF: state.addMemberSAF.copyWith(isExpanded: p0)));
  }

  Future<void> onDataChangeMemberSignContract(
    String? image,
    String? points,
    String? date,
  ) async {
    if (image != null && points != null && date != null) {
      emit(
        state.copyWith(
          farm: state.farm?.copyWith(
            signatureImage: image,
            signatureDate: date,
            inclusionDate: date,
            signaturePoints: points,
            isMasterDataSynced: false,
          ),
          addMemberSAF: state.addMemberSAF.copyWith(
            signatureImage: image,
            signatureDate: date,
            signaturePoints: points,
            isComplete: true,
          ),
        ),
      );

      checkIsGroupSchemeMember();
      await cacheFarm();
    }
  }

  void onClearSignature() {
    emit(state.copyWith(
        farm: state.farm?.copyWith(
          signatureImage: null,
          signatureDate: null,
          signaturePoints: null,
          isGroupSchemeMember: false,
          isMasterDataSynced: false,
        ),
        addMemberSAF: const AddMemberSAF()));
  }

  void checkErrorAllSteps() {
    emit(
      state.copyWith(
        // Step 3 with MemberDetailsSection
        memberDetailSectionState: state.memberDetailSectionState.copyWith(
          isFirstNameError: state.memberDetailSectionState.firstName.isBlank,
          isLastNameError: state.memberDetailSectionState.lastName.isBlank,
          isIdNumberError: state.memberDetailSectionState.idNumber.isBlank || state.memberDetailSectionState.idNumber!.length < 8,
          isMobileNumberError: state.memberDetailSectionState.mobileNumber.isBlank || state.memberDetailSectionState.mobileNumber!.length < 8,
          isEmailError: state.memberDetailSectionState.emailAddress.isBlank
              ? false
              : !state.memberDetailSectionState.emailAddress.validEmail,
        ),

        // Step 4 with MemberSiteDetailsState
        memberSiteDetailsState: state.memberSiteDetailsState.copyWith(
          isSiteNameError: state.memberSiteDetailsState.siteName.isBlank,
          isTownError: state.memberSiteDetailsState.town.isBlank,
          isProvinceError: state.memberSiteDetailsState.province.isBlank,
        ),
      ),
    );
  }

  Future<void> onComplete({
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    if (state.isAllCompleted) {
      emit(
        state.copyWith(
          farm: state.farm?.copyWith(
            isGroupSchemeMember: true,
            isProspectMember: true,
            updateDT: DateTime.now(),
          ),
        ),
      );
      await cacheFarm();
      onSuccess();
    } else {
      checkErrorAllSteps();
      onError();
    }
  }

  void onChangeSlimfState({bool? isCollapse}) {
    emit(
      state.copyWith(
        memberSLIMFState: state.memberSLIMFState.copyWith(
          isSectionCollapse:
              isCollapse ?? !state.memberSLIMFState.isSectionCollapse,
        ),
      ),
    );
  }

  void onChangeMPOState({bool? isCollapse}) {
    emit(
      state.copyWith(
        memberPropertyOwnershipState: state.memberPropertyOwnershipState.copyWith(
          isSectionCollapse:
              isCollapse ?? !state.memberPropertyOwnershipState.isSectionCollapse,
        ),
      ),
    );
  }

  void onChangeMemberDetailState({bool? isCollapse}) {
    emit(
      state.copyWith(
        memberDetailSectionState: state.memberDetailSectionState.copyWith(
          isSectionCollapse:
              isCollapse ?? !state.memberDetailSectionState.isSectionCollapse,
          sectionKey: UniqueKey(),
        ),
      ),
    );
  }

  void onChangeSiteDetailState({bool? isCollapse}) {
    emit(
      state.copyWith(
        memberSiteDetailsState: state.memberSiteDetailsState.copyWith(
          isSectionCollapse:
              isCollapse ?? !state.memberSiteDetailsState.isSectionCollapse,
          sectionKey: UniqueKey(),
        ),
      ),
    );
  }

  void onChangeMemberRiskAssessmentState({bool? isCollapse}) {
    emit(
      state.copyWith(
        farmMemberRiskAssessmentsState:
            state.farmMemberRiskAssessmentsState.copyWith(
          isSectionCollapse: isCollapse ??
              !state.farmMemberRiskAssessmentsState.isSectionCollapse,
          sectionKey: UniqueKey(),
        ),
      ),
    );
  }

  void onChangeMemberFarmObjectiveState({bool? isCollapse}) {
    emit(
      state.copyWith(
        farmMemberObjectivesState: state.farmMemberObjectivesState.copyWith(
          isSectionCollapse:
              isCollapse ?? !state.farmMemberObjectivesState.isSectionCollapse,
        ),
      ),
    );
  }
}
