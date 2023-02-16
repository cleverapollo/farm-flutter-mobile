import 'package:cmo/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';

extension BuildContextExt on BuildContext {
  ColorExt get colors => Theme.of(this).extension<ColorExt>()!;

  TextStyleExt get textStyles => Theme.of(this).extension<TextStyleExt>()!;
}

abstract class AppTheme {
  static ThemeData create() {
    return ThemeData(
      fontFamily: FontFamily.montserrat,
      scaffoldBackgroundColor: AppColor.white,
      canvasColor: AppColor.white,
      primaryColor: AppColor.blue,
      extensions: const [
        ColorExt(),
        TextStyleExt(),
      ],
    );
  }

  static SystemUiOverlayStyle get uiOverlayStyle => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      );
}

class ColorExt extends ThemeExtension<ColorExt> {
  const ColorExt();

  final white = AppColor.white;
  final greyLight1 = AppColor.greyLight1;
  final grey = AppColor.grey;
  final black = AppColor.black;
  final blue = AppColor.blue;
  final blueDark1 = AppColor.blueDark1;
  final blueDark2 = AppColor.blueDark2;
  final red = AppColor.red;
  final green = AppColor.green;
  final yellow = AppColor.yellow;

  @override
  ThemeExtension<ColorExt> copyWith() => this;

  @override
  ThemeExtension<ColorExt> lerp(other, t) => this;
}

class TextStyleExt extends ThemeExtension<TextStyleExt> {
  const TextStyleExt();

  TextStyle get bodyNormal => const TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        height: 19.5 / 16,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyBold => bodyNormal.copyWith(fontWeight: FontWeight.bold);

  TextStyle get titleBold => const TextStyle(
        color: AppColor.blueDark2,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 29 / 24,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get headlineBold => const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColor.blue,
        fontSize: 48,
        height: 58.5 / 48,
        leadingDistribution: TextLeadingDistribution.even,
      );

  @override
  ThemeExtension<TextStyleExt> copyWith() => this;

  @override
  ThemeExtension<TextStyleExt> lerp(other, t) => this;
}
