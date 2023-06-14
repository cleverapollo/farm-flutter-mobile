import 'package:cmo/di.dart';
import 'package:cmo/model/assessment.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'assessment_list_state.dart';

class AssessmentListCubit extends HydratedCubit<AssessmentListState> {
  AssessmentListCubit() : super(const AssessmentListState());

  void changeIndexTab(int index) {
    emit(state.copyWith(indexTab: index));
  }

  Future<void> loadStarted() async {
    emit(state.copyWith(loadingStarted: true));
    try {
      final data = await cmoDatabaseMasterService.getAllAssessmentsStarted();
      emit(state.copyWith(dataStarted: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingStarted: false));
    }
  }

  Future<void> loadCompleted() async {
    emit(state.copyWith(loadingCompleted: true));
    try {
      final data = await cmoDatabaseMasterService.getAllAssessmentsCompleted();
      emit(state.copyWith(dataCompleted: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingCompleted: false));
    }
  }

  Future<void> loadSynced() async {
    emit(state.copyWith(loadingSynced: true));
    try {
      final data = await cmoDatabaseMasterService.getAllAssessmentsSynced();
      emit(state.copyWith(dataSynced: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingSynced: false));
    }
  }

  Future<void> refresh() async {
    await loadStarted();
    await loadCompleted();
    await loadSynced();
  }

  Future<void> removeAssessment(Assessment item) async {
    await cmoDatabaseMasterService.removeAssessment(item.assessmentId!);
    return refresh();
  }

  @override
  AssessmentListState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AssessmentListState state) {
    return null;
  }
}
