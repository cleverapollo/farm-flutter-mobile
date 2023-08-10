import 'dart:convert';
import 'dart:typed_data';

import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class RteSpeciesPhoto extends StatelessWidget {
  final RteSpeciesPhotoModel rteSpeciesPhotoModel;
  final void Function()? onRemoved;

  const RteSpeciesPhoto({
    required this.rteSpeciesPhotoModel,
    this.onRemoved,
    Key? key,
  }) : super(key: key);

  Future<Uint8List?> decodeImage() async {
    try {
      return base64Decode(rteSpeciesPhotoModel.photo ?? '');
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: decodeImage(),
      builder: (context, snap) {
        if (snap.data == null) {
          return const SizedBox.shrink();
        }
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: context.colors.white,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (rteSpeciesPhotoModel.photo.isNotBlank) {
                    final imageProvider = MemoryImage(
                        base64Decode(rteSpeciesPhotoModel.photo ?? ''));
                    showImageViewer(context, imageProvider);
                  }
                },
                child: Image.memory(
                  snap.data!,
                  fit: BoxFit.fitHeight,
                  width: 74,
                  height: 74,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Text(
                  rteSpeciesPhotoModel.photoName ?? '',
                  style: context.textStyles.bodyBold.blueDark2,
                ),
              ),
              const SizedBox(width: 8),
              CmoTappable(
                onTap: () => onRemoved?.call(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Assets.icons.icClose.svgBlack,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
