part of 'illegal_activity_detail_cubit.dart';

class IllegalActivityDetailState extends BaseState {
  IllegalActivityDetailState({
    this.illegalActivityRegister,
    this.activeFarm,
    this.isIssueRaisedError = false,
    this.isDateClosedError = false,
    this.dateClosedErrorText,
    super.isEditing,
  });

  final Farm? activeFarm;
  final IllegalActivityRegister? illegalActivityRegister;
  final bool isIssueRaisedError;
  final bool isDateClosedError;
  final String? dateClosedErrorText;

  IllegalActivityDetailState copyWith({
    IllegalActivityRegister? illegalActivityRegister,
    Farm? activeFarm,
    bool? isIssueRaisedError,
    bool? isDateClosedError,
    bool? isEditing,
    String? dateClosedErrorText,
  }) {
    return IllegalActivityDetailState(
      illegalActivityRegister: illegalActivityRegister ?? this.illegalActivityRegister,
      activeFarm: activeFarm ?? this.activeFarm,
      isEditing: isEditing ?? this.isEditing,
      isIssueRaisedError: isIssueRaisedError ?? this.isIssueRaisedError,
      isDateClosedError: isDateClosedError ?? this.isDateClosedError,
      dateClosedErrorText: dateClosedErrorText ?? this.dateClosedErrorText,
    );
  }
}
