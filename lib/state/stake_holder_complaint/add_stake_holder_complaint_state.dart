part of 'add_stake_holder_complaint_cubit.dart';

class AddStakeHolderComplaintState {
  AddStakeHolderComplaintState({
    required this.farm,
    required this.complaint,
    this.isAddNew = true,
    this.isDataReady = false,
    this.complaints = const [],
  });

  final Farm farm;
  final bool isDataReady;
  final bool isAddNew;
  ComplaintsAndDisputesRegister complaint;
  final List<StakeHolder> complaints;

  AddStakeHolderComplaintState copyWith({
    bool? isDataReady,
    ComplaintsAndDisputesRegister? complaint,
    List<StakeHolder>? complaints,
  }) {
    return AddStakeHolderComplaintState(
      isDataReady: isDataReady ?? this.isDataReady,
      complaint: complaint ?? this.complaint,
      complaints: complaints ?? this.complaints,
      isAddNew: isAddNew,
      farm: farm,
    );
  }
}
