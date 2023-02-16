/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_add.svg
  SvgGenImage get icAdd => const SvgGenImage('assets/icons/ic_add.svg');

  /// File path: assets/icons/ic_close.svg
  SvgGenImage get icClose => const SvgGenImage('assets/icons/ic_close.svg');

  /// File path: assets/icons/ic_drawer.svg
  SvgGenImage get icDrawer => const SvgGenImage('assets/icons/ic_drawer.svg');

  /// File path: assets/icons/ic_lang.svg
  SvgGenImage get icLang => const SvgGenImage('assets/icons/ic_lang.svg');

  /// File path: assets/icons/ic_password.svg
  SvgGenImage get icPassword =>
      const SvgGenImage('assets/icons/ic_password.svg');

  /// File path: assets/icons/ic_search.svg
  SvgGenImage get icSearch => const SvgGenImage('assets/icons/ic_search.svg');

  /// File path: assets/icons/ic_user.svg
  SvgGenImage get icUser => const SvgGenImage('assets/icons/ic_user.svg');

  /// File path: assets/icons/ic_username.svg
  SvgGenImage get icUsername =>
      const SvgGenImage('assets/icons/ic_username.svg');

  /// File path: assets/icons/ic_visible.svg
  SvgGenImage get icVisible => const SvgGenImage('assets/icons/ic_visible.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icAdd,
        icClose,
        icDrawer,
        icLang,
        icPassword,
        icSearch,
        icUser,
        icUsername,
        icVisible
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_lang.png
  AssetGenImage get icLang => const AssetGenImage('assets/images/ic_lang.png');

  /// File path: assets/images/logo.jpg
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.jpg');

  /// File path: assets/images/splash_bg.png
  AssetGenImage get splashBg =>
      const AssetGenImage('assets/images/splash_bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [icLang, logo, splashBg];
}

class $AssetsL10nGen {
  const $AssetsL10nGen();

  /// File path: assets/l10n/en-US.json
  String get enUS => 'assets/l10n/en-US.json';

  /// File path: assets/l10n/fr-FR.json
  String get frFR => 'assets/l10n/fr-FR.json';

  /// List of all assets
  List<String> get values => [enUS, frFR];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsL10nGen l10n = $AssetsL10nGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
