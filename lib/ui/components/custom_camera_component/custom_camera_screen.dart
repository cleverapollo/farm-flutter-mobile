import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/main.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class CustomCameraScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CustomCameraScreenState();

  static Future<bool?> push(
      BuildContext context,
      ) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            CustomCameraScreen(
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
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      cameras.first,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: 'Camera Preview',
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Column(
                children: [
              Expanded(
                child: CameraPreview(
                _controller,),
              ),
              Container(
                    alignment: Alignment.center,
                    child: SvgGenImage(Assets.icons.icSelectPhotoMap.path).svg(
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CmoFilledButton(
                    onTap: () {},
                    title: LocaleKeys.done.tr(),
                  ),
                ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // persistentFooterAlignment: AlignmentDirectional.center,
      // persistentFooterButtons: [
      //   Column(
      //     children: [
      //       Container(
      //         alignment: Alignment.center,
      //         child: SvgGenImage(Assets.icons.icSelectPhotoMap.path).svg(
      //           height: 60,
      //           width: 60,
      //         ),
      //       ),
      //       const SizedBox(height: 32,),
      //       CmoFilledButton(
      //         onTap: () {},
      //         title: LocaleKeys.done.tr(),
      //       ),
      //     ],
      //   ),
      // ],
      // floatingActionButton: FloatingActionButton(
      //   // Provide an onPressed callback.
      //   onPressed: () async {
      //     // Take the Picture in a try / catch block. If anything goes wrong,
      //     // catch the error.
      //     try {
      //       // Ensure that the camera is initialized.
      //       await _initializeControllerFuture;
      //
      //       // Attempt to take a picture and get the file `image`
      //       // where it was saved.
      //       final image = await _controller.takePicture();
      //
      //       if (!mounted) return;
      //
      //       // If the picture was taken, display it on a new screen.
      //       await Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => DisplayPictureScreen(
      //             // Pass the automatically generated path to
      //             // the DisplayPictureScreen widget.
      //             imagePath: image.path,
      //           ),
      //         ),
      //       );
      //     } catch (e) {
      //       // If an error occurs, log the error to the console.
      //       print(e);
      //     }
      //   },
      //   child: const Icon(Icons.camera_alt),
      // ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}