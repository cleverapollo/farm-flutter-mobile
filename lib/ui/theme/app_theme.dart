import 'package:cmo/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
}

extension BuildContextExt on BuildContext {
  ColorExt get colors => Theme.of(this).extension<ColorExt>()!;

  TextStyleExt get textStyles => Theme.of(this).extension<TextStyleExt>()!;
}

abstract class AppTheme {
  static ThemeData create() {
    const textStyleExt = TextStyleExt();
    return ThemeData(
      fontFamily: FontFamily.montserrat,
      scaffoldBackgroundColor: _AppColor.white,
      canvasColor: _AppColor.white,
      primaryColor: _AppColor.blue,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _AppColor.grey, width: 1),
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

  @override
  ThemeExtension<ColorExt> copyWith() => this;

  @override
  ThemeExtension<ColorExt> lerp(other, t) => this;
}

class TextStyleExt extends ThemeExtension<TextStyleExt> {
  const TextStyleExt();

  TextStyle get bodyNormal => const TextStyle(
        color: _AppColor.black,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        height: 19.5 / 16,
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
  ThemeExtension<TextStyleExt> copyWith() => this;

  @override
  ThemeExtension<TextStyleExt> lerp(other, t) => this;
}
