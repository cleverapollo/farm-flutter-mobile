import 'dart:convert';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterThumbnailPhotoItem extends StatelessWidget {

  final String? photo;
  final void Function()? onRemoved;

  const RegisterThumbnailPhotoItem({
    required this.photo,
    this.onRemoved,
  });

  Future<Uint8List?> decodeImage() async {
    try {
      return base64Decode(photo ?? '');
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    const heightImage = 74.0;
    const widthImage = 80.0;
    return FutureBuilder(
      future: decodeImage(),
      builder: (context, snap) {
        if (snap.data == null) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          width: widthImage,
          height: heightImage,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (photo.isNotBlank) {
                    final imageProvider = MemoryImage(
                      base64Decode(photo ?? ''),);
                    showImageViewer(context, imageProvider);
                  }
                },
                child: Image.memory(
                  snap.data!,
                  fit: BoxFit.fitHeight,
                  width: widthImage,
                  height: heightImage,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => onRemoved?.call(),
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topRight,
                    child: Assets.icons.icUpdatedCloseButton.svg(
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}