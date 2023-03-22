import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cmo/utils/logger.dart';

Future<void> delay(int milliseconds) async {
  await Future<void>.delayed(Duration(milliseconds: milliseconds));
}

final bool isDebug = () {
  var result = false;
  assert(
    () {
      result = true;
      return true;
    }(),
    '',
  );

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
    logger.d('$e $s');
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
