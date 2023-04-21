import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart' hide svg;

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/gen/fonts.gen.dart';

abstract class _AppColor {
  static const white = Color(0xFFFFFFFF);
  static const greyLight1 = Color(0xFFF0F0F0);
  static const grey = Color(0xFF8A8A8A);
  static const black = Color(0xFF000000);
  static const blue = Color(0xFF2072B9);
  static const blueDark1 = Color(0xF11C3760);
  static const blueDark2 = Color(0xFF1B294A);
  static const red = Color(0xFFFF0000);
  static const green = Color(0xFF04C504);
  static const yellow = Color(0xFFFFC122);

  static const shadow = Color(0x40000000);
  static const greyD9D9 = Color(0xFFD9D9D9);
}

extension BuildContextExt on BuildContext {
  ColorThemeExt get colors => Theme.of(this).extension<ColorThemeExt>()!;

  TextThemeExt get textStyles => Theme.of(this).extension<TextThemeExt>()!;
}

abstract class AppTheme {
  static ThemeData create() {
    const textStyleExt = TextThemeExt();
    return ThemeData(
      fontFamily: FontFamily.montserrat,
      scaffoldBackgroundColor: _AppColor.white,
      canvasColor: _AppColor.white,
      primaryColor: _AppColor.blue,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _AppColor.grey),
        ),
        hintStyle: textStyleExt.bodyNormal.copyWith(
          fontStyle: FontStyle.italic,
          color: _AppColor.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _AppColor.blue, width: 2),
        ),
        contentPadding: const EdgeInsets.all(8),
      ),
      extensions: const [
        ColorThemeExt(),
        TextThemeExt(),
      ],
    );
  }

  static SystemUiOverlayStyle get uiOverlayStyle => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      );
}

class ColorThemeExt extends ThemeExtension<ColorThemeExt> {
  const ColorThemeExt();

  final white = _AppColor.white;
  final greyLight1 = _AppColor.greyLight1;
  final grey = _AppColor.grey;
  final black = _AppColor.black;
  final blue = _AppColor.blue;
  final blueDark1 = _AppColor.blueDark1;
  final blueDark2 = _AppColor.blueDark2;
  final red = _AppColor.red;
  final green = _AppColor.green;
  final yellow = _AppColor.yellow;
  final shadow = _AppColor.shadow;
  final greyD9D9 = _AppColor.greyD9D9;

  @override
  ThemeExtension<ColorThemeExt> copyWith() => this;

  @override
  ThemeExtension<ColorThemeExt> lerp(
    ThemeExtension<ColorThemeExt>? other,
    double t,
  ) =>
      this;
}

class TextThemeExt extends ThemeExtension<TextThemeExt> {
  const TextThemeExt();

  TextStyle get bodyNormal => const TextStyle(
        color: _AppColor.black,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        height: 24 / 16,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyBold => bodyNormal.copyWith(fontWeight: FontWeight.bold);

  TextStyle get titleBold => const TextStyle(
        color: _AppColor.blueDark2,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 29 / 24,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get headlineBold => const TextStyle(
        fontWeight: FontWeight.bold,
        color: _AppColor.blue,
        fontSize: 48,
        height: 58.5 / 48,
        leadingDistribution: TextLeadingDistribution.even,
      );

  @override
  ThemeExtension<TextThemeExt> copyWith() => this;

  @override
  ThemeExtension<TextThemeExt> lerp(
    ThemeExtension<TextThemeExt>? other,
    double t,
  ) =>
      this;
}

extension TextStyleExt on TextStyle {
  TextStyle get white => copyWith(color: _AppColor.white);
  TextStyle get black => copyWith(color: _AppColor.black);
  TextStyle get greyLight1 => copyWith(color: _AppColor.greyLight1);
  TextStyle get grey => copyWith(color: _AppColor.grey);
  TextStyle get blueDark2 => copyWith(color: _AppColor.blueDark2);
}

extension SvgGen on SvgGenImage {
  SvgPicture get widget => svg();

  SvgPicture get svgWhite => svg(
        colorFilter: const ColorFilter.mode(_AppColor.white, BlendMode.srcIn),
      );

  SvgPicture get svgBlack => svg(
        colorFilter: const ColorFilter.mode(_AppColor.black, BlendMode.srcIn),
      );

  SvgPicture get svgBlue => svg(
    colorFilter: const ColorFilter.mode(_AppColor.blue, BlendMode.srcIn),
  );
}
