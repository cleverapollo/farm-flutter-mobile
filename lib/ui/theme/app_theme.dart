import 'package:cmo/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

extension BuildContextExt on BuildContext {
  ColorExt get colorExt => Theme.of(this).extension<ColorExt>()!;
}

abstract class AppTheme {
  static ThemeData create(BuildContext context) {
    return ThemeData(
      fontFamily: FontFamily.montserrat,
      scaffoldBackgroundColor: AppColor.white,
      primaryColor: AppColor.blue,
      extensions: [ColorExt()],
    );
  }
}

class ColorExt extends ThemeExtension<ColorExt> {
  @override
  ThemeExtension<ColorExt> copyWith() {
    return this;
  }

  @override
  ThemeExtension<ColorExt> lerp(
      covariant ThemeExtension<ColorExt>? other, double t) {
    return this;
  }
}
