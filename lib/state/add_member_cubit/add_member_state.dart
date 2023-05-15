import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_member_state.freezed.dart';

@freezed
class AddMemberState with _$AddMemberState {
  const factory AddMemberState({
    AddMemberSLIMF? addMemberSLIMF,
    AddMemberMPO? addMemberMPO,
    AddMemberMDetails? addMemberMDetails,
    AddMemberSDetails? addMemberSDetails,
    AddMemberMRA? addMemberMRA,
    AddMemberMFO? addMemberMFO,
    AddMemberContract? addMemberContract,
  }) = _AddMemberState;
}

@freezed
class AddMemberContract with _$AddMemberContract {
  const factory AddMemberContract({
    @Default(false) bool isAccept,
  }) = _AddMemberContract;
}

@freezed
class AddMemberSLIMF with _$AddMemberSLIMF {
  const factory AddMemberSLIMF({
    @Default(false) bool isSlimfCompliant,
  }) = _AddMemberSLIMF;
}

@freezed
class AddMemberMPO with _$AddMemberMPO {
  const factory AddMemberMPO({
    String? propertyType,
  }) = _AddMemberMPO;
}

@freezed
class AddMemberMDetails with _$AddMemberMDetails {
  const factory AddMemberMDetails({
    String? memberDetails,
  }) = _AddMemberMDetails;
}

@freezed
class AddMemberSDetails with _$AddMemberSDetails {
  const factory AddMemberSDetails({
    String? siteName,
    String? town,
    String? province,
    String? siteLocation,
    String? compartments,
    String? asi,
  }) = _AddMemberSDetails;
}

@freezed
class AddMemberMRA with _$AddMemberMRA {
  const factory AddMemberMRA({
    @Default(false) bool firstAnswer,
    @Default(false) bool secondAnswer,
    @Default(false) bool thirdAnswer,
    @Default(false) bool fourthAnswer,
  }) = _AddMemberMRA;
}

@freezed
class AddMemberMFO with _$AddMemberMFO {
  const factory AddMemberMFO({
    @Default(false) bool firstAnswer,
    @Default(false) bool secondAnswer,
    @Default(false) bool thirdAnswer,
    @Default(false) bool fourthAnswer,
  }) = _AddMemberMFO;
}
