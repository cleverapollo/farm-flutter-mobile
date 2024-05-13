import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/string.dart';
import 'package:lunar/lunar.dart';

const List<int> _leapYearMonths = <int>[1, 3, 5, 7, 8, 10, 12];

class DateTimeUtils {
  static int calcDateCount(int year, int month) {
    if (_leapYearMonths.contains(month)) {
      return 31;
    } else if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        return 29;
      }
      return 28;
    }
    return 30;
  }

  static DateTime? convertDateTimeToLunar(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }

    final lunarDateTime = Solar.fromDate(dateTime).getLunar();
    return DateTime(
      lunarDateTime.getYear(),
      lunarDateTime.getMonth(),
      lunarDateTime.getDay(),
    );
  }

  static DateTime? validateDateTimeWithYYYYMMDDRegex(
    String? input,
    DateFormatEnum dateFormatEnum,
  ) {
    final regexValidate = dateFormatEnum.validateRegex();
    final hasMatch = regexValidate.hasMatch(input ?? '');
    if (hasMatch && input.isNotBlank) {
      return DateTime.tryParse(input!);
    }
    return null;
  }
}
