import 'package:cmo/di.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/data/farm_property_ownership_type.dart';
import 'package:cmo/model/data/province.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberCubit extends Cubit<AddMemberState> {
  AddMemberCubit() : super(const AddMemberState()) {
    getAllFarmPropertyOwnerShipType();
    getProvinces();
  }

  void dispose() {
    emit(const AddMemberState());
  }

  Future<void> onTapSlimf({required bool isSlimf}) async {
    emit(state.copyWith(
        addMemberSLIMF:
            AddMemberSLIMF(isSlimfCompliant: isSlimf, isComplete: true)));
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
  }) async {
    final data = state.addMemberSDetails;
    final siteLocation = state.addMemberSDetails.addMemberSiteLocations ??
        const AddMemberSiteLocations();

    if (isExpansionOpen != null) {
      emit(state.copyWith(
          addMemberSDetails: data.copyWith(isExpansionOpen: true)));
    }

    if (provinceSelected == null) {
      emit(state.copyWith(
          addMemberSDetails: data.copyWith(isExpansionOpen: false)));
    }

    emit(state.copyWith(
        addMemberSDetails: data.copyWith(
      siteName: siteName ?? data.siteName,
      town: town ?? data.town,
      provinceSelected: provinceSelected ?? data.provinceSelected,
      addMemberSiteLocations: siteLocation.copyWith(
        lat: siteLocationLat ?? siteLocation.lat,
        lng: siteLocationLng ?? siteLocation.lng,
        address: siteLocationAddress ?? siteLocation.address,
      ),
    )));

    final currentData = state.addMemberSDetails;

    final isCompleteSiteLocation =
        currentData.addMemberSiteLocations?.lat != null &&
            currentData.addMemberSiteLocations?.lng != null &&
            currentData.addMemberSiteLocations?.address != null;

    final isComplete = currentData.siteName != null &&
        currentData.town != null &&
        provinceSelected != null &&
        isCompleteSiteLocation;

    emit(state.copyWith(
        addMemberSDetails: currentData.copyWith(
      isComplete: isComplete,
      isCompleteSiteLocation: isCompleteSiteLocation,
    )));
  }

  Future<void> onDataChangeMPO(
      FarmPropertyOwnershipType? propertyTypeSelected) async {
    final addMemberMPO = state.addMemberMPO;

    emit(state.copyWith(
      addMemberMPO: addMemberMPO.copyWith(
        propertyTypeSelected: propertyTypeSelected,
        isExpansionOpen: false,
        isComplete: true,
      ),
    ));
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
        addMemberMRA: state.addMemberMRA.copyWith(isComplete: isComplete)));
  }

  void onDataChangeMFO({
    int? firstAnswer,
    int? secondAnswer,
    int? thirdAnswer,
    int? fourthAnswer,
  }) {
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
  }

  void onDataChangeMemberDetail({
    String? firstName,
    String? lastName,
    String? idNumber,
    String? mobileNumber,
    String? emailAddress,
  }) {
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
        addMemberMDetails:
            state.addMemberMDetails.copyWith(isComplete: isComplete)));
  }

  Future<void> onDataChangeInclusionDate(DateTime? dateTime) async {
    if (dateTime != null) {
      emit(state.copyWith(
          addMemberInclusionDate: state.addMemberInclusionDate.copyWith(
        inclusionDate: dateTime.toIso8601String(),
        isComplete: true,
      )));
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
