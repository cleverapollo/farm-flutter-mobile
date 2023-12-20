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
}
