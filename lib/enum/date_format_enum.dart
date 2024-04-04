import 'package:cmo/extensions/extensions.dart';

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

    switch (this) {
      case DateFormatEnum.mmDDYYYYWithSlash:
        return dateTime.formatWithPattern('MM/dd/yyyy');
      case DateFormatEnum.ddMMYYYYWithSlash:
        return dateTime.formatWithPattern('dd/MM/yyyy');
      case DateFormatEnum.yyyyMMDDWithSlash:
        return dateTime.formatWithPattern('yyyy/MM/dd');
      case DateFormatEnum.mmDDYYYYWithDash:
        return dateTime.formatWithPattern('MM-dd-yyyy');
      case DateFormatEnum.ddMMYYYYWithDash:
        return dateTime.formatWithPattern('dd-MM-yyyy');
      case DateFormatEnum.yyyyMMDDWithDash:
        return dateTime.formatWithPattern('yyyy-MM-dd');
      case DateFormatEnum.mmmDDYYYYWithComma:
        return dateTime.formatWithPattern('MMM dd, yyyy');
      case DateFormatEnum.ddMMMYYYYWithComma:
        return dateTime.formatWithPattern('dd MMM, yyyy');
    }
  }
}
