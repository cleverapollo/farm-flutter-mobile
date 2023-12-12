part of 'add_stake_holder_complaint_cubit.dart';

class AddStakeHolderComplaintState {
  AddStakeHolderComplaintState({
    required this.farm,
    required this.complaint,
    this.isAddNew = true,
    this.isDataReady = false,
    this.complaints = const [],
    this.isDateClosedError = false,
    this.dateClosedErrorText,
  });

  final Farm farm;
  final bool isDataReady;
  final bool isAddNew;
  ComplaintsAndDisputesRegister complaint;
  final List<StakeHolder> complaints;
  final bool isDateClosedError;
  final String? dateClosedErrorText;

  AddStakeHolderComplaintState copyWith({
    bool? isDataReady,
    ComplaintsAndDisputesRegister? complaint,
    List<StakeHolder>? complaints,
    bool? isDateClosedError,
    String? dateClosedErrorText,
  }) {
    return AddStakeHolderComplaintState(
      isDataReady: isDataReady ?? this.isDataReady,
      complaint: complaint ?? this.complaint,
      complaints: complaints ?? this.complaints,
      isAddNew: isAddNew,
      farm: farm,
      isDateClosedError: isDateClosedError ?? this.isDateClosedError,
      dateClosedErrorText: dateClosedErrorText ?? this.dateClosedErrorText,
    );
  }
}
