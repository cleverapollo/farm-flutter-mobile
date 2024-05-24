
import 'package:cmo/l10n/l10n.dart';

enum UpcomingActionLogTimeFilter {
  day,
  week,
  month;

  String get valueName {
    switch (this) {
      case UpcomingActionLogTimeFilter.day:
    return LocaleKeys.day.tr();
      case UpcomingActionLogTimeFilter.week:
    return LocaleKeys.week.tr();
      case UpcomingActionLogTimeFilter.month:
        return LocaleKeys.month.tr();
    }
  }
}
