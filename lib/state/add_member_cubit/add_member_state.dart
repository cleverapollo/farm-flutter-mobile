import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_member_state.freezed.dart';

@freezed
class AddMemberState with _$AddMemberState {
  const factory AddMemberState({
    @Default(false) isLoading,
    @Default(false) isAllComplete,
    @Default(AddMemberSLIMF()) AddMemberSLIMF addMemberSLIMF,
    @Default(AddMemberMPO()) AddMemberMPO addMemberMPO,
    @Default(AddMemberMDetails()) AddMemberMDetails addMemberMDetails,
    @Default(AddMemberSDetails()) AddMemberSDetails addMemberSDetails,
    @Default(AddMemberMRA()) AddMemberMRA addMemberMRA,
    @Default(AddMemberMFO()) AddMemberMFO addMemberMFO,
    @Default(AddMemberContract()) AddMemberContract addMemberContract,
  }) = _AddMemberState;
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
    String? propertyType,
  }) = _AddMemberMPO;
}

@freezed
class AddMemberMDetails with _$AddMemberMDetails {
  const factory AddMemberMDetails({
    @Default(false) bool isComplete,
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
    String? siteName,
    String? town,
    String? province,
    AddMemberSiteLocations? addMemberSiteLocations,
    AddMemberCompartmentsState? addMemberCompartmentsState,
    AddMemberAsisState? addMemberAsisState,
  }) = _AddMemberSDetails;
}

@freezed
class AddMemberSiteLocations with _$AddMemberSiteLocations {
  const factory AddMemberSiteLocations({
    @Default(false) bool isComplete,
    String? siteLocations,
  }) = _AddMemberSiteLocations;
}

@freezed
class AddMemberCompartmentsState with _$AddMemberCompartmentsState {
  const factory AddMemberCompartmentsState({
    @Default(false) bool isComplete,
    String? compartments,
  }) = _AddMemberCompartmentsState;
}

@freezed
class AddMemberAsisState with _$AddMemberAsisState {
  const factory AddMemberAsisState({
    @Default(false) bool isComplete,
    String? asis,
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
    bool? firstAnswer,
    bool? secondAnswer,
    bool? thirdAnswer,
    bool? fourthAnswer,
  }) = _AddMemberMFO;
}
