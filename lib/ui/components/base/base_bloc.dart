import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E extends Object, S extends Object> extends Bloc<E, S> {
  BaseBloc({
    required S initialState,
  }) : super(initialState) {}

  @override
  Future<void> close() async {
    await super.close();
  }
}
