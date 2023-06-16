import 'package:cmo/extensions/extensions.dart';

extension MapExtension on Map<String, dynamic> {
  String mapToStringFormat() {
    final map = <String, String>{};
    forEach((key, value) {
      map.putIfAbsent(key.upperFirstLetter!, () => value.toString());
    });
    return '$map';
  }
}
