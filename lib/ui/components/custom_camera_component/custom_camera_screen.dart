import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/main.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';

import 'display_photo_screen.dart';

class CustomCameraScreen extends StatefulWidget {

  final void Function(String) onDone;

  const CustomCameraScreen({
    super.key,
    required this.onDone,
  });

  @override
  State<StatefulWidget> createState() => _CustomCameraScreenState();

  static Future<bool?> push(
    BuildContext context, {
    required void Function(String) onDone,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CustomCameraScreen(
          onDone: onDone,
        ),
      ),
    );
  }
}

class _CustomCameraScreenState extends State<CustomCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(
                    _controller,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Positioned.fill(
            bottom: MediaQuery.of(context).padding.bottom + 24,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () async {
                  try {
                    await _initializeControllerFuture;
                    final image = await _controller.takePicture();
                    if (!mounted) return;
                    await DisplayPictureScreen.push(
                      context,
                      imagePath: image.path,
                      onDone: widget.onDone,
                    );
                  } catch (e) {
                    logger.e(e);
                  }
                },
                child: SvgGenImage(Assets.icons.icTakePhotoMap.path).svg(
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}