import 'package:cmo/di.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/data/farm_member_objective_answer.dart';
import 'package:cmo/model/data/farm_member_risk_profile_answer.dart';
import 'package:cmo/model/data/farm_property_ownership_type.dart';
import 'package:cmo/model/data/province.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

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
    final farmMemberObjective = await cmoDatabaseMasterService
        .getAllFarmMemberObjectiveByGroupSchemeId(groupScheme!.groupSchemeId!);
    final farmObjectiveOption = await cmoDatabaseMasterService
        .getFarmObjectiveOptionByGroupSchemeId(groupScheme.groupSchemeId!);
    if (!loadedFarmPropertyOwnerShipType) return;

    if (farm != null) {
      emit(state.copyWith(farm: farm));
      final farmMemberObjectiveAnswer = await cmoDatabaseMasterService
          .getFarmMemberObjectiveAnswerByFarmId(farm.farmId);
      final farmMemberRiskProfileAnswer = await cmoDatabaseMasterService
          .getFarmMemberRiskProfileAnswerByFarmId(farm.farmId);

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
          lat: farm.latitude ?? 0.0,
          lng: farm.longitude ?? 0.0,
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

      final firstAnswerMRA = farmMemberRiskProfileAnswer
          .firstWhere(
            (element) => element.riskProfileQuestionId == 1,
            orElse: () =>
                FarmMemberRiskProfileAnswer(answer: farm.isChemicalsUsed),
          )
          .answer;
      final secondAnswerMRA = farmMemberRiskProfileAnswer
          .firstWhere((element) => element.riskProfileQuestionId == 2,
              orElse: () =>
                  FarmMemberRiskProfileAnswer(answer: farm.isHcvNeighbouring))
          .answer;
      final thirdAnswerMRA = farmMemberRiskProfileAnswer
          .firstWhere((element) => element.riskProfileQuestionId == 3,
              orElse: () => FarmMemberRiskProfileAnswer(
                  answer: farm.isRiversOrStreamsNeighbouring))
          .answer;
      final fourthAnswerMRA = farmMemberRiskProfileAnswer
          .firstWhere((element) => element.riskProfileQuestionId == 4,
              orElse: () => FarmMemberRiskProfileAnswer(
                  answer: farm.isCommunitiesNeighbouring))
          .answer;

      final addMemberMRAIsComplete = firstAnswerMRA != null &&
          secondAnswerMRA != null &&
          thirdAnswerMRA != null &&
          fourthAnswerMRA != null;
      final addMemberMRA = AddMemberMRA(
        isComplete: addMemberMRAIsComplete,
        firstAnswer: firstAnswerMRA,
        secondAnswer: secondAnswerMRA,
        thirdAnswer: thirdAnswerMRA,
        fourthAnswer: fourthAnswerMRA,
      );

      final firstAnswerMFO = farmMemberObjectiveAnswer
          .firstWhere((element) => element.farmObjectiveOptionId == 1,
              orElse: () => const FarmMemberObjectiveAnswer())
          .farmMemberObjectiveId;
      final secondAnswerMFO = farmMemberObjectiveAnswer
          .firstWhere((element) => element.farmObjectiveOptionId == 2,
              orElse: () => const FarmMemberObjectiveAnswer())
          .farmMemberObjectiveId;
      final thirdAnswerMFO = farmMemberObjectiveAnswer
          .firstWhere((element) => element.farmObjectiveOptionId == 3,
              orElse: () => const FarmMemberObjectiveAnswer())
          .farmMemberObjectiveId;
      final fourthAnswerMFO = farmMemberObjectiveAnswer
          .firstWhere((element) => element.farmObjectiveOptionId == 4,
              orElse: () => const FarmMemberObjectiveAnswer())
          .farmMemberObjectiveId;

      final addMemberMFOIsComplete = firstAnswerMFO != null &&
          secondAnswerMFO != null &&
          thirdAnswerMFO != null &&
          fourthAnswerMFO != null;
      final addMemberMFO = AddMemberMFO(
        isComplete: addMemberMFOIsComplete,
        firstAnswer: firstAnswerMFO,
        secondAnswer: secondAnswerMFO,
        thirdAnswer: thirdAnswerMFO,
        fourthAnswer: fourthAnswerMFO,
      );

      emit(state.copyWith(
        addMemberMPO: addMemberMPO,
        addMemberMDetails: addMemberMDetail,
        addMemberSDetails: addMemberSDetail,
        addMemberInclusionDate: addMemberInclusionDate,
        addMemberMRA: addMemberMRA,
        addMemberMFO: addMemberMFO,
      ));

      debugPrint('Done loading farm data');
    } else {
      emit(state.copyWith(
          farm: Farm(
        farmId: DateTime.now().millisecondsSinceEpoch.toString(),
        groupSchemeId: groupScheme.groupSchemeId,
        regionalManagerUnitId: groupSchemeUnit?.regionalManagerUnitId,
        isActive: true,
      )));
    }
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

    if (state.addMemberMRA.isComplete) {
      stepCount++;
    }

    if (state.addMemberMFO.isComplete) {
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
      addMemberSLIMF:
          AddMemberSLIMF(isSlimfCompliant: isSlimf, isComplete: true),
    ));

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
          latitude: currentData.addMemberSiteLocations.lat,
          longitude: currentData.addMemberSiteLocations.lng,
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
      ),
    ));

    checkIsProspectMember();
    if (state.addMemberMPO.isComplete) {
      await cacheFarm();
    }
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
              state.addMemberMRA.isComplete &&
              state.addMemberMFO.isComplete &&
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

  Future<void> onDataChangeMRA({
    bool? firstAnswer,
    bool? secondAnswer,
    bool? thirdAnswer,
    bool? fourthAnswer,
  }) async {
    final data = state.addMemberMRA;

    emit(state.copyWith(
        addMemberMRA: data.copyWith(
      firstAnswer: firstAnswer ?? data.firstAnswer,
      secondAnswer: secondAnswer ?? data.secondAnswer,
      thirdAnswer: thirdAnswer ?? data.thirdAnswer,
      fourthAnswer: fourthAnswer ?? data.fourthAnswer,
    )));

    final isComplete = state.addMemberMRA.firstAnswer != null &&
        state.addMemberMRA.secondAnswer != null &&
        state.addMemberMRA.thirdAnswer != null &&
        state.addMemberMRA.fourthAnswer != null;

    emit(state.copyWith(
        farm: state.farm?.copyWith(
          isChemicalsUsed: state.addMemberMRA.firstAnswer,
          isHcvNeighbouring: state.addMemberMRA.secondAnswer,
          isRiversOrStreamsNeighbouring: state.addMemberMRA.thirdAnswer,
          isCommunitiesNeighbouring: state.addMemberMRA.fourthAnswer,
        ),
        addMemberMRA: state.addMemberMRA.copyWith(isComplete: isComplete)));

    var now = DateTime.now().millisecondsSinceEpoch;
    if (isComplete) {
      final listAnswer = [
        FarmMemberRiskProfileAnswer(
          farmMemberRiskProfileAnswerNo: (now++).toString(),
          farmMemberRiskProfileAnswerId: const Uuid().v4(),
          farmId: state.farm?.farmId,
          riskProfileQuestionId: 1,
          answer: state.addMemberMRA.firstAnswer,
          isActive: true,
        ),
        FarmMemberRiskProfileAnswer(
          farmMemberRiskProfileAnswerNo: (now++).toString(),
          farmMemberRiskProfileAnswerId: const Uuid().v4(),
          farmId: state.farm?.farmId,
          riskProfileQuestionId: 2,
          answer: state.addMemberMRA.secondAnswer,
          isActive: true,
        ),
        FarmMemberRiskProfileAnswer(
          farmMemberRiskProfileAnswerNo: (now++).toString(),
          farmMemberRiskProfileAnswerId: const Uuid().v4(),
          farmId: state.farm?.farmId,
          riskProfileQuestionId: 3,
          answer: state.addMemberMRA.thirdAnswer,
          isActive: true,
        ),
        FarmMemberRiskProfileAnswer(
          farmMemberRiskProfileAnswerNo: (now++).toString(),
          farmMemberRiskProfileAnswerId: const Uuid().v4(),
          farmId: state.farm?.farmId,
          riskProfileQuestionId: 4,
          answer: state.addMemberMRA.fourthAnswer,
          isActive: true,
        )
      ];

      emit(state.copyWith(
          farm: state.farm?.copyWith(riskProfileAnswers: listAnswer)));

      final futures = <Future<dynamic>>[];

      for (final item in listAnswer) {
        futures.add(
            cmoDatabaseMasterService.cacheFarmMemberRiskProfileAnswer(item));
      }

      futures.add(cacheFarm());

      await Future.wait(futures);
    }
  }

  Future<void> onDataChangeMFO({
    int? firstAnswer,
    int? secondAnswer,
    int? thirdAnswer,
    int? fourthAnswer,
  }) async {
    final data = state.addMemberMFO;

    emit(state.copyWith(
        addMemberMFO: data.copyWith(
      firstAnswer: firstAnswer ?? data.firstAnswer,
      secondAnswer: secondAnswer ?? data.secondAnswer,
      thirdAnswer: thirdAnswer ?? data.thirdAnswer,
      fourthAnswer: fourthAnswer ?? data.fourthAnswer,
    )));

    final isComplete = state.addMemberMFO.firstAnswer != null &&
        state.addMemberMFO.secondAnswer != null &&
        state.addMemberMFO.thirdAnswer != null &&
        state.addMemberMFO.fourthAnswer != null;

    emit(state.copyWith(
        addMemberMFO: state.addMemberMFO.copyWith(isComplete: isComplete)));

    var now = DateTime.now().millisecondsSinceEpoch;
    if (isComplete) {
      final listAnwser = [
        FarmMemberObjectiveAnswer(
          farmMemberObjectiveAnswerId: const Uuid().v4(),
          farmMemberObjectiveAnswerNo: (now++).toString(),
          farmId: state.farm?.farmId,
          farmObjectiveOptionId: 1,
          farmMemberObjectiveId: state.addMemberMFO.firstAnswer,
          isActive: true,
        ),
        FarmMemberObjectiveAnswer(
          farmMemberObjectiveAnswerId: const Uuid().v4(),
          farmMemberObjectiveAnswerNo: (now++).toString(),
          farmId: state.farm?.farmId,
          farmObjectiveOptionId: 2,
          farmMemberObjectiveId: state.addMemberMFO.secondAnswer,
          isActive: true,
        ),
        FarmMemberObjectiveAnswer(
          farmMemberObjectiveAnswerId: const Uuid().v4(),
          farmMemberObjectiveAnswerNo: (now++).toString(),
          farmId: state.farm?.farmId,
          farmObjectiveOptionId: 3,
          farmMemberObjectiveId: state.addMemberMFO.thirdAnswer,
          isActive: true,
        ),
        FarmMemberObjectiveAnswer(
          farmMemberObjectiveAnswerId: const Uuid().v4(),
          farmMemberObjectiveAnswerNo: (now++).toString(),
          farmId: state.farm?.farmId,
          farmObjectiveOptionId: 4,
          farmMemberObjectiveId: state.addMemberMFO.fourthAnswer,
          isActive: true,
        ),
      ];

      emit(state.copyWith(
          farm: state.farm?.copyWith(objectiveAnswers: listAnwser)));

      final futures = <Future<dynamic>>[];

      for (final item in listAnwser) {
        futures
            .add(cmoDatabaseMasterService.cacheFarmMemberObjectiveAnswer(item));
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
}
