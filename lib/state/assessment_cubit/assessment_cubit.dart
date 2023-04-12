import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:cmo/di.dart';
import 'package:cmo/model/assessment.dart';
import 'package:cmo/ui/snack/success.dart';
import 'package:cmo/utils/json_converter.dart';

part 'assessment_state.dart';

class AssessmentCubit extends HydratedCubit<AssessmentState> {
  AssessmentCubit() : super(const AssessmentState());

  void updateCacheCreateData(Map<String, dynamic> data) {
    emit(
      state.copyWith(
        cacheCreateData: data,
      ),
    );
  }

  void cleanCache() {
    emit(state.copyWith(cacheCreateData: <String, dynamic>{}));
  }

  Future<bool> submit(
    Assessment value,
  ) async {
    try {
      emit(state.copyWith(loading: true));
      final service = cmoDatabaseService;
      int? newId;
      newId = await service.cacheAssessment(value);
      showSnackSuccess(msg: 'Save assessment success with id: $newId');
    } catch (e) {
      showSnackError(msg: e.toString());
      return false;
    } finally {
      emit(state.copyWith(loading: false));
    }
    return true;
  }

  @override
  AssessmentState? fromJson(Map<String, dynamic> json) {
    return AssessmentState(cacheCreateData: json);
  }

  @override
  Map<String, dynamic>? toJson(AssessmentState state) {
    return state.cacheCreateData;
  }
}
