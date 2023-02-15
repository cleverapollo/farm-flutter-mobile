import 'package:cmo/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

extension BuildContextExt on BuildContext {
  ColorExt get colors => Theme.of(this).extension<ColorExt>()!;
}

abstract class AppTheme {
  static ThemeData create() {
    return ThemeData(
      fontFamily: FontFamily.montserrat,
      scaffoldBackgroundColor: AppColor.white,
      canvasColor: AppColor.white,
      primaryColor: AppColor.blue,
      extensions: const [ColorExt()],
    );
  }
}

class ColorExt extends ThemeExtension<ColorExt> {
  const ColorExt();

  final Color white = AppColor.white;
  final Color greyLight1 = AppColor.greyLight1;
  final Color grey = AppColor.grey;
  final Color black = AppColor.black;
  final Color blue = AppColor.blue;
  final Color blueDark1 = AppColor.blueDark1;
  final Color blueDark2 = AppColor.blueDark2;
  final Color red = AppColor.red;
  final Color green = AppColor.green;
  final Color yellow = AppColor.yellow;

  @override
  ThemeExtension<ColorExt> copyWith() {
    return this;
  }

  @override
  ThemeExtension<ColorExt> lerp(covariant ThemeExtension<ColorExt>? other, double t) {
    return this;
  }
}
