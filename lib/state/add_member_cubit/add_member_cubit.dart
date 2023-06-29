import 'package:cmo/di.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/data/farm_property_ownership_type.dart';
import 'package:cmo/model/data/province.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberCubit extends Cubit<AddMemberState> {
  AddMemberCubit() : super(const AddMemberState());

  void initAddMember() {
    getAllFarmPropertyOwnerShipType();
    getProvinces();
    initFarm();
  }

  void disposeAddMember() {
    emit(const AddMemberState());
  }

  void initFarm() {
    emit(state.copyWith(
        farm: Farm(
      farmId: DateTime.now().millisecondsSinceEpoch.toString(),
    )));
  }

  Future<void> cacheFarm() async {
    await cmoDatabaseMasterService.cacheFarm(state.farm);
  }

  Future<void> onTapSlimf({required bool isSlimf}) async {
    emit(state.copyWith(
      farm: state.farm.copyWith(isSlimfCompliant: isSlimf),
      addMemberSLIMF:
          AddMemberSLIMF(isSlimfCompliant: isSlimf, isComplete: true),
    ));

    if (state.addMemberSLIMF.isComplete) {
      await cacheFarm();
    }
  }

  Future<void> getAllFarmPropertyOwnerShipType() async {
    final data = await cmoDatabaseMasterService.getFarmPropertyOwnershipType();

    final addMemberMPO = state.addMemberMPO;

    if (data.isNotEmpty) {
      emit(state.copyWith(
        addMemberMPO: addMemberMPO.copyWith(propertyTypes: data),
      ));
    }
  }

  Future<void> getProvinces() async {
    final data = await cmoDatabaseMasterService.getProvinces();

    if (data.isNotEmpty) {
      emit(state.copyWith(
          addMemberSDetails: state.addMemberSDetails.copyWith(
        provinces: data,
      )));
    }
  }

  Future<void> onDataChangeSiteDetail({
    String? siteName,
    String? town,
    Province? provinceSelected,
    bool? isExpansionOpen,
    double? siteLocationLat,
    double? siteLocationLng,
    String? siteLocationAddress,
    AddingCompartmentResult? addingCompartmentResult,
  }) async {
    final data = state.addMemberSDetails;
    final siteLocation = state.addMemberSDetails.addMemberSiteLocations;

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

    emit(state.copyWith(
        addMemberSDetails: state.addMemberSDetails.copyWith(
      siteName: siteName ?? state.addMemberSDetails.siteName,
      town: town ?? state.addMemberSDetails.town,
      provinceSelected:
          provinceSelected ?? state.addMemberSDetails.provinceSelected,
      addMemberSiteLocations: siteLocation.copyWith(
        lat: siteLocationLat ?? siteLocation.lat,
        lng: siteLocationLng ?? siteLocation.lng,
        address: siteLocationAddress ?? siteLocation.address,
      ),
    )));

    final currentData = state.addMemberSDetails;

    final isCompleteSiteLocation =
        currentData.addMemberSiteLocations.lat != null &&
            currentData.addMemberSiteLocations.lng != null &&
            currentData.addMemberSiteLocations.address != null;

    final isCompleteCompartments =
        currentData.addMemberCompartmentsState.compartments.isNotEmpty;

    final isComplete = currentData.siteName != null &&
        currentData.town != null &&
        currentData.provinceSelected != null &&
        isCompleteSiteLocation &&
        isCompleteCompartments;

    emit(state.copyWith(
        farm: state.farm.copyWith(
          farmName: currentData.siteName,
          town: currentData.town,
          latitude: currentData.addMemberSiteLocations.lat.toString(),
          longitude: currentData.addMemberSiteLocations.lng.toString(),
          streetName: currentData.addMemberSiteLocations.address,
          province: currentData.provinceSelected?.provinceName,
          farmSize: currentData.addMemberCompartmentsState.farmSize,
        ),
        addMemberSDetails: currentData.copyWith(
          isComplete: isComplete,
          isCompleteSiteLocation: isCompleteSiteLocation,
          isCompleteCompartments: isCompleteCompartments,
        )));

    if (isComplete) {
      await cacheFarm();
    }
  }

  Future<void> onDataChangeMPO(
      FarmPropertyOwnershipType? propertyTypeSelected) async {
    final addMemberMPO = state.addMemberMPO;

    emit(state.copyWith(
      farm: state.farm.copyWith(
          propertyOwnershipTypeId:
              propertyTypeSelected?.farmPropertyOwnershipTypeId),
      addMemberMPO: addMemberMPO.copyWith(
        propertyTypeSelected: propertyTypeSelected,
        isExpansionOpen: false,
        isComplete: true,
      ),
    ));

    if (state.addMemberMPO.isComplete) {
      await cacheFarm();
    }
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
        farm: state.farm.copyWith(
          isChemicalsUsed: state.addMemberMRA.firstAnswer,
          isHcvNeighbouring: state.addMemberMRA.secondAnswer,
          isRiversOrStreamsNeighbouring: state.addMemberMRA.thirdAnswer,
          isCommunitiesNeighbouring: state.addMemberMRA.fourthAnswer,
        ),
        addMemberMRA: state.addMemberMRA.copyWith(isComplete: isComplete)));

    if (isComplete) {
      await cacheFarm();
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
        farm: state.farm.copyWith(),
        addMemberMFO: state.addMemberMFO.copyWith(isComplete: isComplete)));
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
        farm: state.farm.copyWith(
          firstName: state.addMemberMDetails.firstName,
          lastName: state.addMemberMDetails.lastName,
          idNumber: state.addMemberMDetails.idNumber,
          mobileNumber: state.addMemberMDetails.mobileNumber,
          email: state.addMemberMDetails.emailAddress,
        ),
        addMemberMDetails:
            state.addMemberMDetails.copyWith(isComplete: isComplete)));

    if (isComplete) {
      await cacheFarm();
    }
  }

  Future<void> onDataChangeInclusionDate(DateTime? dateTime) async {
    if (dateTime != null) {
      emit(state.copyWith(
          farm: state.farm.copyWith(inclusionDate: dateTime.toIso8601String()),
          addMemberInclusionDate: state.addMemberInclusionDate.copyWith(
            inclusionDate: dateTime.toIso8601String(),
            isComplete: true,
          )));

      await cacheFarm();
    }
  }

  Future<void> onDataChangeMemberContract() async {
    emit(state.copyWith(
        addMemberContract: state.addMemberContract
            .copyWith(isAccept: true, isComplete: true)));
  }

  Future<void> onDataChangeMemberSignContract(
      String? image, String? points, String? date) async {
    if (image != null && points != null && date != null) {
      emit(state.copyWith(
          addMemberSAF: state.addMemberSAF.copyWith(
        signatureImage: image,
        signatureDate: date,
        isComplete: true,
      )));
    }
  }

  Future<void> onDataChangeClose() async {
    emit(state.copyWith(
        addMemberClose: state.addMemberClose.copyWith(
      isClose: true,
      isComplete: true,
    )));
  }
}
