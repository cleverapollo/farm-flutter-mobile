import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime? {
  String yMd() {
    if (this == null) return '';
    final dateFormat = DateFormat('yyyy-MM-dd');
    final formattedDate = dateFormat.format(this!);
    return formattedDate;
  }

  String ddMMYyyy() {
    if (this == null) return '';
    final dateFormat = DateFormat('dd-MM-yyyy');
    final formattedDate = dateFormat.format(this!);
    return formattedDate;
  }

  String mmmDdYyyy() {
    if (this == null) return '';
    final dateFormat = DateFormat('MMM dd, yyyy', 'EN');
    final formattedDate = dateFormat.format(this!);
    return formattedDate;
  }

  String formatWithPattern(String dateFormatPattern) {
    if (this == null) return '';
    final dateFormat = DateFormat(dateFormatPattern, 'EN');
    final formattedDate = dateFormat.format(this!);
    return formattedDate;
  }

  int age() {
    if (this == null) return 0;
    final today = DateTime.now();
    final year = today.year - this!.year;
    final mth = today.month - this!.month;
    final days = today.day - this!.day;
    if (mth < 0 || (mth == 0 && days < 0)) {
      return year - 1;
    }

    return year;
  }
}
