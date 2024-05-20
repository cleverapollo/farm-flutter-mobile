import 'package:cmo/extensions/extensions.dart';
import 'package:intl/intl.dart';

enum DateFormatEnum {
  mmDDYYYYWithSlash,
  ddMMYYYYWithSlash,
  yyyyMMDDWithSlash,
  mmDDYYYYWithDash,
  ddMMYYYYWithDash,
  yyyyMMDDWithDash,
  mmmDDYYYYWithComma,
  ddMMMYYYYWithComma;

  String get valueName {
    switch (this) {
      case DateFormatEnum.mmDDYYYYWithSlash:
        return 'MM/DD/YYYY';
      case DateFormatEnum.ddMMYYYYWithSlash:
        return 'DD/MM/YYYY';
      case DateFormatEnum.yyyyMMDDWithSlash:
        return 'YYYY/MM/DD';
      case DateFormatEnum.mmDDYYYYWithDash:
        return 'MM-DD-YYYY';
      case DateFormatEnum.ddMMYYYYWithDash:
        return 'DD-MM-YYYY';
      case DateFormatEnum.yyyyMMDDWithDash:
        return 'YYYY-MM-DD';
      case DateFormatEnum.mmmDDYYYYWithComma:
        return 'MMM DD, YYYY';
      case DateFormatEnum.ddMMMYYYYWithComma:
        return 'DD MMM, YYYY';
    }
  }

  String displayFormat(DateTime? dateTime) {
    if (dateTime == null) return '';
    return dateTime.formatWithPattern(getDateTimeFormat());
  }

  String getDateTimeFormat() {
    switch (this) {
      case DateFormatEnum.mmDDYYYYWithSlash:
        return 'MM/dd/yyyy';
      case DateFormatEnum.ddMMYYYYWithSlash:
        return 'dd/MM/yyyy';
      case DateFormatEnum.yyyyMMDDWithSlash:
        return 'yyyy/MM/dd';
      case DateFormatEnum.mmDDYYYYWithDash:
        return 'MM-dd-yyyy';
      case DateFormatEnum.ddMMYYYYWithDash:
        return 'dd-MM-yyyy';
      case DateFormatEnum.yyyyMMDDWithDash:
        return 'yyyy-MM-dd';
      case DateFormatEnum.mmmDDYYYYWithComma:
        return 'MMM dd, yyyy';
      case DateFormatEnum.ddMMMYYYYWithComma:
        return 'dd MMM, yyyy';
    }
  }

  DateTime? parseDateTimeWithFormat(String? dateTimeString) {
    if (dateTimeString.isBlank) return null;
    final dateFormat = DateFormat(getDateTimeFormat(), 'EN');
    return dateFormat.parse(dateTimeString!);
  }

  String hintText() {
    switch (this) {
      case DateFormatEnum.mmDDYYYYWithSlash:
        return 'MM/dd/yyyy';
      case DateFormatEnum.ddMMYYYYWithSlash:
        return 'dd/MM/yyyy';
      case DateFormatEnum.yyyyMMDDWithSlash:
        return 'yyyy/MM/dd';
      case DateFormatEnum.mmDDYYYYWithDash:
        return 'MM-dd-yyyy';
      case DateFormatEnum.ddMMYYYYWithDash:
        return 'dd-MM-yyyy';
      case DateFormatEnum.yyyyMMDDWithDash:
        return 'yyyy-MM-dd';
      case DateFormatEnum.mmmDDYYYYWithComma:
        return 'MMM dd, yyyy';
      case DateFormatEnum.ddMMMYYYYWithComma:
        return 'dd MMM, yyyy';
    }
  }

  RegExp validateRegex() {
    switch (this) {
      case DateFormatEnum.mmDDYYYYWithSlash:
        return RegExp(r'(0[1-9]|1[1,2])\/(0[1-9]|[12][0-9]|3[01])\/(19|20)\d{2}');
      case DateFormatEnum.ddMMYYYYWithSlash:
        return RegExp(r'(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[1,2])\/(19|20)\d{2}');
      case DateFormatEnum.yyyyMMDDWithSlash:
        return RegExp(r'(19|20)\d{2}\/(0[1-9]|1[1,2])\/(0[1-9]|[12][0-9]|3[01])');
      case DateFormatEnum.mmDDYYYYWithDash:
        return RegExp(r'(0[1-9]|1[1,2])-(0[1-9]|[12][0-9]|3[01])-(19|20)\d{2}');
      case DateFormatEnum.ddMMYYYYWithDash:
        return RegExp(r'(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[1,2])-(19|20)\d{2}');
      case DateFormatEnum.yyyyMMDDWithDash:
        return RegExp(r'(19|20)\d{2}-(0[1-9]|1[1,2])-(0[1-9]|[12][0-9]|3[01])');
      case DateFormatEnum.mmmDDYYYYWithComma:
        return RegExp(r'(0[1-9]|1[1,2]) (0[1-9]|[12][0-9]|3[01]), (19|20)\d{2}');
      case DateFormatEnum.ddMMMYYYYWithComma:
        return RegExp(r'(0[1-9]|[12][0-9]|3[01]) (0[1-9]|1[1,2]), (19|20)\d{2}');
    }
  }
}
