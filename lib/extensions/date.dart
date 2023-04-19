import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime? {
  String yMd() {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final formattedDate = dateFormat.format(this ?? DateTime.now());
    return formattedDate;
  }

  String ddMMYyyy() {
    final dateFormat = DateFormat('dd-MM-yyyy');
    final formattedDate = dateFormat.format(this ?? DateTime.now());
    return formattedDate;
  }
}
