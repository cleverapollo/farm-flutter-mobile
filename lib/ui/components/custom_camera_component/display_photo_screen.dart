import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class DisplayPictureScreen extends StatefulWidget {

  final String imagePath;
  final void Function(String) onDone;

  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    required this.onDone,
  });

  static Future<bool?> push(
    BuildContext context, {
    required String imagePath,
    required void Function(String) onDone,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DisplayPictureScreen(
          imagePath: imagePath,
          onDone: onDone,
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  late String imagePath;
  bool loading = false;
  CroppedFile? selectedFile;

  @override
  void initState() {
    super.initState();
    imagePath = widget.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.image_detail.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.file(
              File(imagePath),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: Navigator.of(context).pop,
                child: Assets.icons.icRefreshMap.svg(),
              ),
              const SizedBox(
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  onTap: () async {
                    final croppedFile = await ImagePickerService().pickImageFromGallery();
                    if (croppedFile != null) {
                      setState(() {
                        selectedFile = croppedFile;
                        imagePath = croppedFile.path;
                      });
                    }
                  },
                  child: Assets.icons.icSelectPhotoMap.svg(),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    loading = true;
                  });

                  String base64;
                  if (selectedFile != null) {
                    base64 = await FileUtil.croppedFileToBase64(selectedFile);
                  } else {
                    base64 = await FileUtil.imagePathToBase64(imagePath);
                  }

                  setState(() {
                    widget.onDone(base64);
                    loading = false;
                  });

                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Assets.icons.icAcceptMap.svg(),
              ),
            ],
          ),

          const SizedBox(height: 32,),
        ],
      ),
    );
  }
}
