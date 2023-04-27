// status = 1 -> open;
// status = 2 -> closed;
import 'package:cmo/l10n/l10n.dart';

enum StatusFilterEnum {
  open(1),
  closed(2);

  const StatusFilterEnum(
    this.data,
  );

  final int data;

  String get valueName {
    switch (this) {
      case StatusFilterEnum.open:
        return LocaleKeys.opened.tr();
      case StatusFilterEnum.closed:
        return LocaleKeys.closed.tr();
    }
  }
}
