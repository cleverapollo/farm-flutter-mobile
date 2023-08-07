

import 'package:flutter/services.dart';

class SuffixInputFormatter extends TextInputFormatter {
  SuffixInputFormatter({
    required this.symbol,
  });
  final String symbol;

  String _newString = '';

  void _formatter(String newText) {
    _newString = '$newText$symbol';
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final isRemovedCharacter =
        oldValue.text.length - 1 == newValue.text.length &&
            oldValue.text.startsWith(newValue.text);
    var newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');
    if (isRemovedCharacter && !_lastCharacterIsDigit(oldValue.text)) {
      final length = newText.length - 1;
      newText = newText.substring(0, length > 0 ? length : 0);
    }

    _formatter(newText);

    return TextEditingValue(
      text: _newString,
      selection: TextSelection.collapsed(offset: _newString.length),
    );
  }

  static bool _lastCharacterIsDigit(String text) {
    final lastChar = text.substring(text.length - 1);
    return RegExp('[0-9]').hasMatch(lastChar);
  }

  String getFormattedValue() {
    return _newString;
  }

  String format(String value) {
    _formatter(value);
    return _newString;
  }
}
