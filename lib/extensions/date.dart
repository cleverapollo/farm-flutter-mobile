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

  bool isSameDate(DateTime? other) {
    if (this == null || other == null) return false;
    return this!.year == other.year &&
        this!.month == other.month &&
        this!.day == other.day;
  }

  DateTime get firstDayOfMonth => DateTime(this!.year, this!.month);

  /// The last day of a given month
  DateTime get lastDayOfMonth {
    return DateTime(this!.year, this!.month + 1, 0);
  }

  DateTime get firstDayOfWeek {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    final day = DateTime.utc(this!.year, this!.month, this!.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar works from Sunday - Monday
    final decreaseNum = day.weekday % 7;
    return this!.subtract(Duration(days: decreaseNum));
  }

  DateTime get lastDayOfWeek {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    final day = DateTime.utc(this!.year, this!.month, this!.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar's Week starts on Sunday
    final increaseNum = day.weekday % 7;
    return day.add(Duration(days: 7 - increaseNum));
  }
}
