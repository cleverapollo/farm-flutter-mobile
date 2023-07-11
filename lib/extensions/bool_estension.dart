extension BoolExtension on bool? {
  int get toInt {
    return this ?? false ? 1 : 0;
  }
}
