import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'add_aai_state.dart';

class AddAAICubit extends Cubit<AddAAIState> {
  AddAAICubit({
    required AccidentAndIncident accidentAndIncident,
    required bool isAddNew,
  }) : super(
          AddAAIState(
            accidentAndIncident: accidentAndIncident,
            isAddNew: isAddNew,
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {}

  void onDateReceiveChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident:
            state.accidentAndIncident.copyWith(dateRecieved: dateTime),
      ),
    );
  }

  void onDateOfIncidentChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident:
            state.accidentAndIncident.copyWith(dateOfIncident: dateTime),
      ),
    );
    onCalculateLostTimeInDay();
  }

  void onDateResumeChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident:
            state.accidentAndIncident.copyWith(dateResumeWork: dateTime),
      ),
    );
    onCalculateLostTimeInDay();
  }

  void onDateOfBirthChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident: state.accidentAndIncident.copyWith(
          dateOfBirth: dateTime,
        ),
      ),
    );
  }

  void onWorkDisableChanged({bool? workerDisabled}) {
    emit(
      state.copyWith(
        accidentAndIncident: state.accidentAndIncident.copyWith(
          workerDisabled: workerDisabled,
        ),
      ),
    );
  }

  void onCommentChanged(String? comment) {
    state.accidentAndIncident = state.accidentAndIncident.copyWith(
      comment: comment,
    );
  }

  void onCalculateLostTimeInDay() {
    final aai = state.accidentAndIncident;
    final lostTimeInDay = aai.dateResumeWork != null &&
            aai.dateOfIncident != null
        ? aai.dateResumeWork!.difference(aai.dateOfIncident!).inDays.toString()
        : '';
    emit(state.copyWith(lostTimeInDay: lostTimeInDay));
  }
}
