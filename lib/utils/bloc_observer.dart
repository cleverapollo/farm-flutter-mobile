import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/utils/logger.dart';

class CmoGlobalObserver extends BlocObserver {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d('${bloc.runtimeType} Event: ${event.toString()}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.d(
      '${bloc.runtimeType} Change: currentState: ${change.currentState} nextState: ${change.nextState}',
    );
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    logger.d(
      '${bloc.runtimeType} Transition: currentState: ${transition.currentState} nextState: ${transition.nextState}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.d('${bloc.runtimeType} Error: $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
