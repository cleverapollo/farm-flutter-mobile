part of 'add_stake_holder_complaint_cubit.dart';

class AddStakeHolderComplaintState extends BaseState {
  AddStakeHolderComplaintState({
    required this.farm,
    required this.complaint,
    this.isAddNew = true,
    this.isDataReady = false,
    this.stakeholders = const [],
    this.isDateClosedError = false,
    this.dateClosedErrorText,
    super.isEditing,
  });

  final Farm farm;
  final bool isDataReady;
  final bool isAddNew;
  ComplaintsAndDisputesRegister complaint;
  final bool isDateClosedError;
  final String? dateClosedErrorText;
  final List<StakeHolder> stakeholders;

  AddStakeHolderComplaintState copyWith({
    bool? isDataReady,
    bool? isEditing,
    ComplaintsAndDisputesRegister? complaint,
    bool? isDateClosedError,
    String? dateClosedErrorText,
    List<StakeHolder>? stakeholders,
  }) {
    return AddStakeHolderComplaintState(
      isEditing: isEditing ?? this.isEditing,
      isDataReady: isDataReady ?? this.isDataReady,
      complaint: complaint ?? this.complaint,
      stakeholders: stakeholders ?? this.stakeholders,
      isAddNew: isAddNew,
      farm: farm,
      isDateClosedError: isDateClosedError ?? this.isDateClosedError,
      dateClosedErrorText: dateClosedErrorText ?? this.dateClosedErrorText,
    );
  }
}
