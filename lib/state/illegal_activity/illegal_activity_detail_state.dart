part of 'illegal_activity_detail_cubit.dart';

class IllegalActivityDetailState {
  IllegalActivityDetailState({
    this.illegalActivityRegister,
    this.activeFarm,
    this.isIssueRaisedError = false,
    this.isDateClosedError = false,
    this.dateClosedErrorText,
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
    String? dateClosedErrorText,
  }) {
    return IllegalActivityDetailState(
      illegalActivityRegister: illegalActivityRegister ?? this.illegalActivityRegister,
      activeFarm: activeFarm ?? this.activeFarm,
      isIssueRaisedError: isIssueRaisedError ?? this.isIssueRaisedError,
      isDateClosedError: isDateClosedError ?? this.isDateClosedError,
      dateClosedErrorText: dateClosedErrorText ?? this.dateClosedErrorText,
    );
  }
}
