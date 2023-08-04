import 'package:cmo/di.dart';
import 'package:cmo/extensions/date.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberCubit extends Cubit<AddMemberState> {
  AddMemberCubit() : super(const AddMemberState());

  Future<void> initAddMember({Farm? farm}) async {
    emit(state.cleanCache().copyWith(isLoading: true));
    await initDataFarm(farm);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> initDataFarm(Farm? farm) async {
    final groupScheme = await configService.getActiveGroupScheme();
    final groupSchemeUnit = await configService.getActiveRegionalManager();
    final loadedFarmPropertyOwnerShipType =
        await getAllFarmPropertyOwnerShipType();
    if (!loadedFarmPropertyOwnerShipType) return;

    if (farm != null) {
      emit(state.copyWith(farm: farm));
      final compartments =
          await cmoDatabaseMasterService.getCompartmentByFarmId(farm.farmId);
      final asis =
          await cmoDatabaseMasterService.getAsiRegisterByFarmId(farm.farmId);

      final addMemberSlimfIsComplete = farm.isSlimfCompliant != null;
      final addMemberSlimf = AddMemberSLIMF(
        isComplete: addMemberSlimfIsComplete,
        isSlimfCompliant: farm.isSlimfCompliant,
      );

      emit(
        state.copyWith(
          addMemberSLIMF: addMemberSlimf,
        ),
      );

      FarmPropertyOwnershipType? propertyTypeSelected;

      for (final item in state.addMemberMPO.propertyTypes) {
        if (item.farmPropertyOwnershipTypeId == farm.propertyOwnershipTypeId) {
          propertyTypeSelected = item;
        }
      }

      final addMemberMPOIsComplete = propertyTypeSelected != null;
      final addMemberMPO = AddMemberMPO(
        isComplete: addMemberMPOIsComplete,
        propertyTypeSelected: propertyTypeSelected,
        propertyTypes: state.addMemberMPO.propertyTypes,
      );

      final addMemberMDetailIsComplete = farm.firstName != null &&
          farm.lastName != null &&
          farm.idNumber != null &&
          farm.mobileNumber != null;
      final addMemberMDetail = AddMemberMDetails(
        isComplete: addMemberMDetailIsComplete,
        firstName: farm.firstName,
        lastName: farm.lastName,
        idNumber: farm.idNumber,
        mobileNumber: farm.mobileNumber,
        emailAddress: farm.email,
      );

      final isCompleteSiteLocation = farm.latitude != null &&
          farm.longitude != null &&
          farm.streetName != null;
      final isCompleteCompartments = compartments?.isNotEmpty ?? false;
      final isCompleteASI = asis.isNotEmpty;
      final addMemberSDetailIsComplete = isCompleteSiteLocation &&
          farm.farmName != null &&
          farm.town != null &&
          farm.province != null;
      final addMemberSDetail = AddMemberSDetails(
        isComplete: addMemberSDetailIsComplete,
        isCompleteSiteLocation: isCompleteSiteLocation,
        isCompleteCompartments: isCompleteCompartments,
        isCompleteASI: isCompleteASI,
        siteName: farm.farmName,
        town: farm.town,
        province: farm.province,
        addMemberSiteLocations: AddMemberSiteLocations(
          lat: double.tryParse(farm.latitude ?? ''),
          lng: double.tryParse(farm.longitude ?? ''),
          address: farm.streetName,
        ),
        addMemberCompartmentsState: AddMemberCompartmentsState(
          compartments: compartments ?? [],
          farmSize: farm.farmSize,
        ),
        addMemberAsisState: AddMemberAsisState(asis: asis),
      );

      final addMemberInclusionDateIsComplete = farm.inclusionDate != null;
      final addMemberInclusionDate = AddMemberInclusionDate(
          isComplete: addMemberInclusionDateIsComplete,
          inclusionDate: farm.inclusionDate);
      emit(state.copyWith(
        addMemberMPO: addMemberMPO,
        addMemberMDetails: addMemberMDetail,
        addMemberSDetails: addMemberSDetail,
        addMemberInclusionDate: addMemberInclusionDate,
      ));

      debugPrint('Done loading farm data');
    } else {
      emit(state.copyWith(
          farm: Farm(
        farmId: DateTime.now().millisecondsSinceEpoch.toString(),
        groupSchemeId: groupScheme?.groupSchemeId,
        regionalManagerUnitId: groupSchemeUnit?.regionalManagerUnitId,
        isActive: true,
      )));
    }

    await initDataRiskProfileQuestion();
    await initDataFarmMemberObjectives();
  }

  Future<void> initDataRiskProfileQuestion() async {
    final activeGroupScheme = await configService.getActiveGroupScheme();

    final riskProfileQuestions = await cmoDatabaseMasterService.getRiskProfileQuestionByGroupSchemeId(
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

    final farmMemberObjective = await cmoDatabaseMasterService.getAllFarmMemberObjectiveByGroupSchemeId(
      activeGroupScheme?.groupSchemeId,
    );

    final farmObjectiveOption = await cmoDatabaseMasterService.getFarmObjectiveOptionByGroupSchemeId(
      activeGroupScheme?.groupSchemeId,
    );

    final farmMemberObjectiveAnswer = await cmoDatabaseMasterService.getFarmMemberObjectiveAnswerByFarmId(state.farm?.farmId);

    final listAnswer = <FarmMemberObjectiveAnswer>[];

    var now = DateTime.now().millisecondsSinceEpoch;

    for (final question in farmMemberObjective) {
      final currentAnswer = farmMemberObjectiveAnswer.firstWhereOrNull((element) => element.farmMemberObjectiveId == question.farmMemberObjectiveId);
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

  Future<void> stepCount() async {
    var stepCount = 0;

    if (state.addMemberSLIMF.isComplete) {
      stepCount++;
    }

    if (state.addMemberMPO.isComplete) {
      stepCount++;
    }

    if (state.addMemberMDetails.isComplete) {
      stepCount++;
    }

    if (state.addMemberSDetails.isComplete) {
      stepCount++;
    }

    if (state.addMemberInclusionDate.isComplete) {
      stepCount++;
    }

    if (state.farmMemberRiskAssessmentsState.isComplete) {
      stepCount++;
    }

    if (state.farmMemberObjectivesState.isComplete) {
      stepCount++;
    }

    if (state.addMemberContract.isComplete) {
      stepCount++;
    }

    if (state.addMemberSAF.isComplete) {
      stepCount++;
    }

    if (state.addMemberClose.isComplete) {
      stepCount++;
    }

    debugPrint(stepCount.toString());
    if (state.farm?.isGroupSchemeMember == false ||
        state.farm?.isGroupSchemeMember == null) {
      emit(state.copyWith(
        farm: state.farm?.copyWith(
            stepCount: stepCount, isGroupSchemeMember: stepCount == 10),
      ));
    }
    if (stepCount != 0) {
      await cacheFarm();
    }
  }

  Future<void> cacheFarm() async {
    await cmoDatabaseMasterService.cacheFarmAddMember(state.farm!);
  }

  Future<void> onTapSlimf({required bool isSlimf}) async {
    emit(state.copyWith(
      farm: state.farm?.copyWith(isSlimfCompliant: isSlimf),
      addMemberSLIMF: AddMemberSLIMF(
        isSlimfCompliant: isSlimf,
        isComplete: true,
        isSectionCollapse: true,
      ),
    ),);
    onChangeMPOState(isCollapse: false);
    checkIsProspectMember();
    if (state.addMemberSLIMF.isComplete) {
      await cacheFarm();
    }
  }

  Future<bool> getAllFarmPropertyOwnerShipType() async {
    final data = await cmoDatabaseMasterService.getFarmPropertyOwnershipType();

    final addMemberMPO = state.addMemberMPO;

    if (data.isNotEmpty) {
      emit(state.copyWith(
        addMemberMPO: addMemberMPO.copyWith(propertyTypes: data),
      ));
      return true;
    }
    return false;
  }

  Future<void> onDataChangeSiteDetail({
    String? siteName,
    String? town,
    String? province,
    Province? provinceSelected,
    bool? isExpansionOpen,
    double? siteLocationLat,
    double? siteLocationLng,
    String? siteLocationAddress,
    AddingCompartmentResult? addingCompartmentResult,
    List<Asi>? asis,
  }) async {
    final data = state.addMemberSDetails;

    if (isExpansionOpen != null) {
      emit(state.copyWith(
          addMemberSDetails: data.copyWith(isExpansionOpen: true)));
    }

    if (provinceSelected == null) {
      emit(state.copyWith(
          addMemberSDetails: data.copyWith(isExpansionOpen: false)));
    }

    if (addingCompartmentResult != null) {
      final compartments = <Compartment>[];

      if ((addingCompartmentResult.compartments ?? []).isEmpty) return;

      compartments.addAll(addingCompartmentResult.compartments!);

      emit(state.copyWith(
          addMemberSDetails: data.copyWith(
              addMemberCompartmentsState: AddMemberCompartmentsState(
        compartments: compartments,
        farmSize: addingCompartmentResult.totalAreaHa,
      ))));
    }

    if (asis != null) {
      emit(state.copyWith(
          addMemberSDetails: data.copyWith(
              addMemberAsisState: AddMemberAsisState(asis: asis))));
    }

    emit(state.copyWith(
        addMemberSDetails: state.addMemberSDetails.copyWith(
      siteName: siteName ?? state.addMemberSDetails.siteName,
      town: town ?? state.addMemberSDetails.town,
      province: province ?? state.addMemberSDetails.province,
      isSiteNameError: siteName?.isBlank ?? state.addMemberSDetails.isSiteNameError,
      isTownError: town?.isBlank ?? state.addMemberSDetails.isTownError,
      isProvinceError: province?.isBlank ?? state.addMemberSDetails.isProvinceError,
      addMemberSiteLocations:
          state.addMemberSDetails.addMemberSiteLocations.copyWith(
        lat: siteLocationLat ??
            state.addMemberSDetails.addMemberSiteLocations.lat,
        lng: siteLocationLng ??
            state.addMemberSDetails.addMemberSiteLocations.lng,
        address: siteLocationAddress ??
            state.addMemberSDetails.addMemberSiteLocations.address,
      ),
    )));

    final currentData = state.addMemberSDetails;

    final isCompleteSiteLocation =
        currentData.addMemberSiteLocations.lat != null &&
            currentData.addMemberSiteLocations.lng != null &&
            currentData.addMemberSiteLocations.address != null;

    final isCompleteCompartments =
        currentData.addMemberCompartmentsState.compartments.isNotEmpty &&
            currentData.addMemberCompartmentsState.farmSize != null;

    final isCompleteAsi = currentData.addMemberAsisState.asis.isNotEmpty;

    final isComplete = currentData.siteName != null &&
        currentData.town != null &&
        currentData.province != null &&
        isCompleteSiteLocation &&
        isCompleteCompartments &&
        isCompleteAsi;

    emit(state.copyWith(
        farm: state.farm?.copyWith(
          farmName: currentData.siteName,
          town: currentData.town,
          latitude: currentData.addMemberSiteLocations.lat.toString(),
          longitude: currentData.addMemberSiteLocations.lng.toString(),
          streetName: currentData.addMemberSiteLocations.address,
          province: currentData.province,
          farmSize: currentData.addMemberCompartmentsState.farmSize,
        ),
        addMemberSDetails: currentData.copyWith(
          isComplete: isComplete,
          isCompleteSiteLocation: isCompleteSiteLocation,
          isCompleteCompartments: isCompleteCompartments,
          isCompleteASI: isCompleteAsi,
        )));

    if (isComplete) {
      await cacheFarm();
    }
  }

  Future<void> onDataChangeMPO(
      FarmPropertyOwnershipType? propertyTypeSelected) async {
    final addMemberMPO = state.addMemberMPO;

    emit(state.copyWith(
      farm: state.farm?.copyWith(
          propertyOwnershipTypeId:
              propertyTypeSelected?.farmPropertyOwnershipTypeId),
      addMemberMPO: addMemberMPO.copyWith(
        propertyTypeSelected: propertyTypeSelected,
        isExpansionOpen: false,
        isComplete: true,
        isSectionCollapse: true,
      ),
    ));

    checkIsProspectMember();
    if (state.addMemberMPO.isComplete) {
      await cacheFarm();
    }
    onChangeMemberDetailState(isCollapse: false);
  }

  void checkIsProspectMember() {
    emit(
      state.copyWith(
        farm: state.farm?.copyWith(
          isProspectMember: state.addMemberSLIMF.isComplete &&
              state.addMemberMPO.isComplete &&
              state.addMemberMDetails.isComplete,
        ),
      ),
    );
  }

  void checkIsGroupSchemeMember() {
    emit(
      state.copyWith(
        farm: state.farm?.copyWith(
          isGroupSchemeMember: state.addMemberSLIMF.isComplete &&
              state.addMemberMPO.isComplete &&
              state.addMemberMDetails.isComplete &&
              state.addMemberSDetails.isComplete &&
              state.addMemberInclusionDate.isComplete &&
              state.farmMemberRiskAssessmentsState.isComplete &&
              state.farmMemberObjectivesState.isComplete &&
              state.addMemberContract.isComplete &&
              state.addMemberSAF.isComplete &&
              state.addMemberClose.isComplete,
        ),
      ),
    );
  }

  Future<void> onExpansionChangedMPO(bool isExpansionOpen) async {
    final addMemberMPO = state.addMemberMPO;

    emit(state.copyWith(
      addMemberMPO: addMemberMPO.copyWith(isExpansionOpen: isExpansionOpen),
    ));
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
      listFarmMemberRiskProfileAnswers.add(currentAnswer);
      emit(
        state.copyWith(
          farm: state.farm
              ?.copyWith(riskProfileAnswers: listFarmMemberRiskProfileAnswers),
          farmMemberRiskAssessmentsState:
              state.farmMemberRiskAssessmentsState.copyWith(
            listFarmMemberRiskProfileAnswers: listFarmMemberRiskProfileAnswers,
          ),
        ),
      );

      final futures = <Future<dynamic>>[];

      for (final item in listFarmMemberRiskProfileAnswers) {
        futures.add(
            cmoDatabaseMasterService.cacheFarmMemberRiskProfileAnswer(item));
      }

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
    required FarmObjectiveOption option,
  }) async {
    final farmMemberObjectivesState = state.farmMemberObjectivesState;
    final listFarmMemberObjectiveAnswers = <FarmMemberObjectiveAnswer>[];
    listFarmMemberObjectiveAnswers.addAll(farmMemberObjectivesState.listFarmMemberObjectiveAnswers);
    var currentAnswer = listFarmMemberObjectiveAnswers.firstWhereOrNull((element) => element.farmMemberObjectiveId == question.farmMemberObjectiveId);
    if (currentAnswer != null) {
      listFarmMemberObjectiveAnswers.remove(currentAnswer);
      currentAnswer = currentAnswer.copyWith(farmObjectiveOptionId: option.id);
      listFarmMemberObjectiveAnswers.add(currentAnswer);
      emit(
        state.copyWith(
          farm: state.farm?.copyWith(objectiveAnswers: listFarmMemberObjectiveAnswers),
          farmMemberObjectivesState: state.farmMemberObjectivesState.copyWith(
            listFarmMemberObjectiveAnswers: listFarmMemberObjectiveAnswers,
          ),
        ),
      );

      final futures = <Future<dynamic>>[];

      for (final item in listFarmMemberObjectiveAnswers) {
        futures.add(cmoDatabaseMasterService.cacheFarmMemberObjectiveAnswer(item));
      }

      futures.add(cacheFarm());

      await Future.wait(futures);
    }
  }

  Future<void> onDataChangeMemberDetail({
    String? firstName,
    String? lastName,
    String? idNumber,
    String? mobileNumber,
    String? emailAddress,
  }) async {
    final data = state.addMemberMDetails;

    emit(state.copyWith(
      addMemberMDetails: data.copyWith(
        firstName: firstName ?? data.firstName,
        lastName: lastName ?? data.lastName,
        idNumber: idNumber ?? data.idNumber,
        mobileNumber: mobileNumber ?? data.mobileNumber,
        emailAddress: emailAddress ?? data.emailAddress,
      ),
    ));

    final isComplete = !state.addMemberMDetails.firstName.isNullOrEmpty &&
        !state.addMemberMDetails.lastName.isNullOrEmpty &&
        !state.addMemberMDetails.idNumber.isNullOrEmpty &&
        !state.addMemberMDetails.mobileNumber.isNullOrEmpty;

    emit(state.copyWith(
        farm: state.farm?.copyWith(
          firstName: state.addMemberMDetails.firstName,
          lastName: state.addMemberMDetails.lastName,
          idNumber: state.addMemberMDetails.idNumber,
          mobileNumber: state.addMemberMDetails.mobileNumber,
          email: state.addMemberMDetails.emailAddress,
        ),
        addMemberMDetails: state.addMemberMDetails.copyWith(
          isComplete: isComplete,
          isFirstNameError: firstName?.isBlank ?? state.addMemberMDetails.isFirstNameError,
          isLastNameError: lastName?.isBlank ?? state.addMemberMDetails.isLastNameError,
          isIdNumberError: idNumber?.isBlank ?? state.addMemberMDetails.isIdNumberError,
          isMobileNumberError: mobileNumber?.isBlank ?? state.addMemberMDetails.isMobileNumberError,
        ),
      ),
    );

    checkIsProspectMember();
    if (isComplete) {
      await cacheFarm();
    }
  }

  Future<void> onDataChangeInclusionDate(DateTime? dateTime) async {
    if (dateTime != null) {
      emit(state.copyWith(
          farm: state.farm?.copyWith(inclusionDate: dateTime.toIso8601String()),
          addMemberInclusionDate: state.addMemberInclusionDate.copyWith(
            inclusionDate: dateTime.toIso8601String(),
            isComplete: true,
          )));
      onChangeInclusionDateState(isCollapse: true);
      onChangeMemberRiskAssessmentState(isCollapse: false);
      await cacheFarm();
    }
  }

  Future<void> onDataChangeMemberContract() async {
    emit(state.copyWith(
        farm: state.farm?.copyWith(isMasterDataSynced: 0),
        addMemberContract: state.addMemberContract
            .copyWith(isAccept: true, isComplete: true)));

    await cacheFarm();
  }

  Future<void> onDataChangeMemberSignContract(
      String? image, String? points, String? date) async {
    if (image != null && points != null && date != null) {
      emit(state.copyWith(
          farm: state.farm?.copyWith(
            signatureImage: image,
            signatureDate: date,
            signaturePoints: points,
          ),
          addMemberSAF: state.addMemberSAF.copyWith(
        signatureImage: image,
        signatureDate: date,
        signaturePoints: points,
        isComplete: true,
      )));

      checkIsGroupSchemeMember();
      await cacheFarm();
    }
  }

  Future<void> onDataChangeClose() async {
    emit(state.copyWith(
        addMemberClose: state.addMemberClose.copyWith(
      isClose: true,
      isComplete: true,
    )));
  }

  void checkErrorAllSteps() {
    // Step 3 with AddMemberMDetails
    emit(
      state.copyWith(
        addMemberMDetails: state.addMemberMDetails.copyWith(
          isFirstNameError: state.addMemberMDetails.firstName.isBlank,
          isLastNameError: state.addMemberMDetails.lastName.isBlank,
          isIdNumberError: state.addMemberMDetails.idNumber.isBlank,
          isMobileNumberError: state.addMemberMDetails.mobileNumber.isBlank,
        ),
      ),
    );
  }

  void onChangeSlimfState({bool? isCollapse}) {
    emit(
      state.copyWith(
        addMemberSLIMF: state.addMemberSLIMF.copyWith(
          isSectionCollapse: isCollapse ?? !state.addMemberSLIMF.isSectionCollapse,
        ),
      ),
    );
  }

  void onChangeMPOState({bool? isCollapse}) {
    emit(
      state.copyWith(
        addMemberMPO: state.addMemberMPO.copyWith(
          isSectionCollapse: isCollapse ?? !state.addMemberMPO.isSectionCollapse,
        ),
      ),
    );
  }

  void onChangeMemberDetailState({bool? isCollapse}) {
    emit(
      state.copyWith(
        addMemberMDetails: state.addMemberMDetails.copyWith(
          isSectionCollapse: isCollapse ?? !state.addMemberMDetails.isSectionCollapse,
          sectionKey: UniqueKey(),
        ),
      ),
    );
  }

  void onChangeSiteDetailState({bool? isCollapse}) {
    emit(
      state.copyWith(
        addMemberSDetails: state.addMemberSDetails.copyWith(
          isSectionCollapse: isCollapse ?? !state.addMemberSDetails.isSectionCollapse,
          sectionKey: UniqueKey(),
        ),
      ),
    );
  }

  void onChangeInclusionDateState({bool? isCollapse}) {
    emit(
      state.copyWith(
        addMemberInclusionDate: state.addMemberInclusionDate.copyWith(
          isSectionCollapse: isCollapse ?? !state.addMemberInclusionDate.isSectionCollapse,
          sectionKey: UniqueKey(),
        ),
      ),
    );
  }

  void onChangeMemberRiskAssessmentState({bool? isCollapse}) {
    emit(
      state.copyWith(
        farmMemberRiskAssessmentsState: state.farmMemberRiskAssessmentsState.copyWith(
          isSectionCollapse: isCollapse ?? !state.farmMemberRiskAssessmentsState.isSectionCollapse,
          sectionKey: UniqueKey(),
        ),
      ),
    );
  }

  void onChangeMemberFarmObjectiveState({bool? isCollapse}) {
    emit(
      state.copyWith(
        farmMemberObjectivesState: state.farmMemberObjectivesState.copyWith(
          isSectionCollapse: isCollapse ?? !state.farmMemberObjectivesState.isSectionCollapse,
        ),
      ),
    );
  }
}
