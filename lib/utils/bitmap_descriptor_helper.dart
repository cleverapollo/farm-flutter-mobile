import 'dart:math';
import 'dart:ui';
import 'package:cmo/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

class BitmapDescriptorHelper {
  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
    String assetName, [
    Size size = const Size(48, 48),
  ]) async {
    final pictureInfo = await vg.loadPicture(SvgAssetLoader(assetName), null);

    double devicePixelRatio = window.devicePixelRatio;
    int width = (size.width * devicePixelRatio).toInt();
    int height = (size.height * devicePixelRatio).toInt();

    final scaleFactor = min(
      width / pictureInfo.size.width,
      height / pictureInfo.size.height,
    );

    final recorder = PictureRecorder();

    Canvas(recorder)
      ..scale(scaleFactor)
      ..drawPicture(pictureInfo.picture);

    final rasterPicture = recorder.endRecording();

    final image = rasterPicture.toImageSync(width, height);
    final bytes = (await image.toByteData(format: ImageByteFormat.png))!;

    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }

  static Future<BitmapDescriptor> getBytesFromCanvasDynamic({
    String? title,
    String? subtitle,
  }) async {
    const textStyle = TextStyle(
      fontSize: 40,
      color: Colors.white,
      letterSpacing: 1.0,
      overflow: TextOverflow.ellipsis,
    );

    final paint = Paint()..color = Colors.transparent;
    final pictureRecorder = PictureRecorder();
    final canvas = Canvas(pictureRecorder);

    TextPainter? titleTextPainter;
    TextPainter? subtitleTextPainter;

    final span = TextSpan(
      style: textStyle,
      text: title,
    );
    titleTextPainter = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.ltr,
    );
    titleTextPainter.layout(
      minWidth: 0,
    );
    final titleWidth = titleTextPainter.width.toInt() + (titleTextPainter.width * 0.20).toInt();
    final titleHeight = titleTextPainter.height.toInt() + titleTextPainter.height ~/ 2;

    final titleRect =
        Rect.fromLTWH(0, 0, titleWidth.toDouble(), titleHeight.toDouble());

    canvas.drawRect(titleRect, paint);

    // painter.paint(canvas, Offset(fortyPercentWidth / 2, halfTextHeight.toDouble() / 2));
    titleTextPainter.paint(canvas, Offset(titleWidth * 0.2, 0));

    subtitleTextPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.ltr,
      text: TextSpan(
        style: textStyle,
        text: subtitle,
      ),
    );
    subtitleTextPainter.layout(
      minWidth: 0,
    );

    final subtitleWidth = subtitleTextPainter.width.toInt() +
        (subtitleTextPainter.width * 0.20).toInt();
    final subtitleHeight =
        subtitleTextPainter.height.toInt() + subtitleTextPainter.height ~/ 2;

    final rectSubtitle = Rect.fromLTWH(
      0,
      0,
      subtitleWidth.toDouble(),
      subtitleHeight.toDouble(),
    );

    canvas.drawRect(rectSubtitle, paint);
    subtitleTextPainter.paint(
      canvas,
      Offset(
        0,
        titleHeight.toDouble(),
      ),
    );

    final p = pictureRecorder.endRecording();

    final pngBytes = await (await p.toImage(
      titleWidth > subtitleWidth ? (titleWidth * 1.5).toInt() : (subtitleWidth * 1.5).toInt(),
      titleHeight + subtitleHeight,
    ))
        .toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(pngBytes!.buffer.asUint8List());
  }
}
