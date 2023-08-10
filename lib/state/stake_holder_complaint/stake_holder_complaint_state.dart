part of 'stake_holder_complaint_cubit.dart';

class StakeHolderComplaintState {
  StakeHolderComplaintState({this.isDataReady = false, this.items = const []});

  final bool isDataReady;
  final List<ComplaintsAndDisputesRegister> items;

  StakeHolderComplaintState copyWith({
    List<ComplaintsAndDisputesRegister>? items,
    bool? isDataReady,
  }) {
    return StakeHolderComplaintState(
      items: items ?? this.items,
      isDataReady: isDataReady ?? this.isDataReady,
    );
  }
}
