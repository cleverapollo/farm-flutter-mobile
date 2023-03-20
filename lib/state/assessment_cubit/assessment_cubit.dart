import 'package:cmo/model/assessment.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

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

  @override
  AssessmentState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(AssessmentState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
