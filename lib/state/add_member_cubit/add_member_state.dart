import 'package:cmo/model/asi.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/data/farm_property_ownership_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_member_state.freezed.dart';

@freezed
class AddMemberState with _$AddMemberState {
  const factory AddMemberState({
    @Default(false) bool isLoading,
    Farm? farm,
    @Default(AddMemberSLIMF()) AddMemberSLIMF addMemberSLIMF,
    @Default(AddMemberMPO()) AddMemberMPO addMemberMPO,
    @Default(AddMemberMDetails()) AddMemberMDetails addMemberMDetails,
    @Default(AddMemberSDetails()) AddMemberSDetails addMemberSDetails,
    @Default(AddMemberInclusionDate())
        AddMemberInclusionDate addMemberInclusionDate,
    @Default(AddMemberMRA()) AddMemberMRA addMemberMRA,
    @Default(AddMemberMFO()) AddMemberMFO addMemberMFO,
    @Default(AddMemberContract()) AddMemberContract addMemberContract,
    @Default(AddMemberSAF()) AddMemberSAF addMemberSAF,
    @Default(AddMemberClose()) AddMemberClose addMemberClose,
  }) = _AddMemberState;
}

@freezed
class AddMemberSAF with _$AddMemberSAF {
  const factory AddMemberSAF({
    @Default(false) bool isComplete,
    String? signatureImage,
    String? signaturePoints,
    String? signatureDate,
  }) = _AddMemberSAF;
}

@freezed
class AddMemberInclusionDate with _$AddMemberInclusionDate {
  const factory AddMemberInclusionDate({
    @Default(false) bool isComplete,
    String? inclusionDate,
  }) = _AddMemberInclusionDate;
}

@freezed
class AddMemberClose with _$AddMemberClose {
  const factory AddMemberClose({
    @Default(false) bool isComplete,
    bool? isClose,
  }) = _AddMemberClose;
}

@freezed
class AddMemberContract with _$AddMemberContract {
  const factory AddMemberContract({
    @Default(false) bool isComplete,
    bool? isAccept,
  }) = _AddMemberContract;
}

@freezed
class AddMemberSLIMF with _$AddMemberSLIMF {
  const factory AddMemberSLIMF({
    @Default(false) bool isComplete,
    bool? isSlimfCompliant,
  }) = _AddMemberSLIMF;
}

@freezed
class AddMemberMPO with _$AddMemberMPO {
  const factory AddMemberMPO({
    @Default(false) bool isComplete,
    @Default(false) bool isExpansionOpen,
    FarmPropertyOwnershipType? propertyTypeSelected,
    @Default([]) List<FarmPropertyOwnershipType> propertyTypes,
  }) = _AddMemberMPO;
}

@freezed
class AddMemberMDetails with _$AddMemberMDetails {
  const factory AddMemberMDetails({
    @Default(false) bool isComplete,
    @Default(false) bool isFirstNameError,
    @Default(false) bool isLastNameError,
    @Default(false) bool isIdNumberError,
    @Default(false) bool isMobileNumberError,
    String? firstName,
    String? lastName,
    String? idNumber,
    String? mobileNumber,
    String? emailAddress,
  }) = _AddMemberMDetails;
}

@freezed
class AddMemberSDetails with _$AddMemberSDetails {
  const factory AddMemberSDetails({
    @Default(false) bool isComplete,
    @Default(false) bool isCompleteSiteLocation,
    @Default(false) bool isCompleteCompartments,
    @Default(false) bool isCompleteASI,
    @Default(false) bool isExpansionOpen,
    String? siteName,
    String? town,
    String? province,
    @Default(AddMemberSiteLocations())
        AddMemberSiteLocations addMemberSiteLocations,
    @Default(AddMemberCompartmentsState())
        AddMemberCompartmentsState addMemberCompartmentsState,
    @Default(AddMemberAsisState()) AddMemberAsisState addMemberAsisState,
  }) = _AddMemberSDetails;
}

extension AddMemberSDetailsExtension on AddMemberSDetails {
  String initAddressForSiteLocation() {
    var address = '';
    if (town != null) {
      address = town!;
    }

    if (province != null) {
      if (address.isNotEmpty) {
        address = '$address, $province';
      } else {
        address = province!;
      }
    }

    return address;
  }
}

@freezed
class AddMemberSiteLocations with _$AddMemberSiteLocations {
  const factory AddMemberSiteLocations({
    double? lat,
    double? lng,
    String? address,
  }) = _AddMemberSiteLocations;
}

@freezed
class AddMemberCompartmentsState with _$AddMemberCompartmentsState {
  const factory AddMemberCompartmentsState({
    @Default([]) List<Compartment> compartments,
    double? farmSize,
  }) = _AddMemberCompartmentsState;
}

@freezed
class AddMemberAsisState with _$AddMemberAsisState {
  const factory AddMemberAsisState({
    @Default([]) List<Asi> asis,
  }) = _AddMemberAsisState;
}

@freezed
class AddMemberMRA with _$AddMemberMRA {
  const factory AddMemberMRA({
    @Default(false) bool isComplete,
    bool? firstAnswer,
    bool? secondAnswer,
    bool? thirdAnswer,
    bool? fourthAnswer,
  }) = _AddMemberMRA;
}

@freezed
class AddMemberMFO with _$AddMemberMFO {
  const factory AddMemberMFO({
    @Default(false) bool isComplete,
    int? firstAnswer,
    int? secondAnswer,
    int? thirdAnswer,
    int? fourthAnswer,
  }) = _AddMemberMFO;
}
