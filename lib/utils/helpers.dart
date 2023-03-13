import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CmoGlobalObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('${bloc.runtimeType} Event: ${event.toString()}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} Change: currentState: ${change.currentState} nextState: ${change.nextState}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('${bloc.runtimeType} Transition: currentState: ${transition.currentState} nextState: ${transition.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.runtimeType} Error: $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

final bool isDebug = () {
  var result = false;
  assert(() {
    result = true;

    return true;
  }());

  return result;
}();

Future<void> showInputMethod() async {
  try {
    await SystemChannels.textInput.invokeMethod(
      'TextInput.setClient',
      <dynamic>[
        1,
        <String, dynamic>{
          'keyboardAppearance': 'Brightness.dark',
        }
      ],
    );
  } catch (e, s) {
    debugPrint('$e $s');
  }
  return SystemChannels.textInput.invokeMethod('TextInput.show');
}

Future<void> hideInputMethod() {
  return SystemChannels.textInput.invokeMethod('TextInput.hide');
}

void clearFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<void> copyText2Clipboard(String text) {
  return Clipboard.setData(ClipboardData(text: text));
}

Future<String?> pasteTextFromClipboard() {
  return Clipboard.getData('text/plain').then<String?>(
    (value) => value?.text,
  );
}
