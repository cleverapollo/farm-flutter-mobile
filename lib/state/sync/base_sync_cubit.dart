import 'package:hydrated_bloc/hydrated_bloc.dart';

class BaseSyncCubit<T> extends HydratedCubit<T> {
  BaseSyncCubit(super.state);

  @override
  T? fromJson(Map<String, dynamic> json) => fromOJson(json);

  @override
  Map<String, dynamic>? toJson(T state) => toOJson(state);

  T? fromOJson(Map<String, dynamic> json) => null;

  Map<String, dynamic>? toOJson(T state) => null;
}
