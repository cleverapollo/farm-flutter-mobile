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

class RteSpeciesPhoto extends StatefulWidget {
  final RteSpeciesPhotoModel rteSpeciesPhotoModel;
  final void Function()? onRemoved;
  final void Function(RteSpeciesPhotoModel)? onChanged;

  const RteSpeciesPhoto({
    required this.rteSpeciesPhotoModel,
    this.onRemoved,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<RteSpeciesPhoto> createState() => _RteSpeciesPhotoState();
}

class _RteSpeciesPhotoState extends State<RteSpeciesPhoto> {
  final _controller = TextEditingController();

  late RteSpeciesPhotoModel rteSpeciesPhotoModel;

  @override
  void initState() {
    super.initState();
    rteSpeciesPhotoModel = widget.rteSpeciesPhotoModel;
    _controller.text = rteSpeciesPhotoModel.photoName ?? '';
  }

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
                  child: TextField(
                    controller: _controller,
                    style: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    widget.onChanged?.call(
                      rteSpeciesPhotoModel.copyWith(
                        photoName: value,
                      ),
                    );
                  },
                ),
              ),
                const SizedBox(width: 8),
                // GestureDetector(
                //   onTap: () async {
                //     final croppedFile =
                //         await ImagePickerService().pickImageFromGallery();
                //     if (croppedFile != null) {
                //       final base64 =
                //           await FileUtil.croppedFileToBase64(croppedFile);
                //       setState(() {
                //         rteSpeciesPhotoModel =
                //             rteSpeciesPhotoModel.copyWith(photo: base64);
                //         widget.onChanged?.call(rteSpeciesPhotoModel);
                //       });
                //     }
                //   },
                //   child:
                //       Assets.icons.icSelectPhotoMap.svg(width: 32, height: 32),
                // ),
                // const SizedBox(width: 8),
                // GestureDetector(
                //   onTap: () async {
                //     final croppedFile =
                //         await ImagePickerService().pickImageFromCamera();
                //     if (croppedFile != null) {
                //       final base64 =
                //           await FileUtil.croppedFileToBase64(croppedFile);
                //       setState(() {
                //         rteSpeciesPhotoModel =
                //             rteSpeciesPhotoModel.copyWith(photo: base64);
                //         widget.onChanged?.call(rteSpeciesPhotoModel);
                //       });
                //     }
                //   },
                //   child: Assets.icons.icTakePhotoMap.svg(
                //     width: 32,
                //     height: 32,
                //   ),
                // ),
                // const SizedBox(width: 8),
                CmoTappable(
                  onTap: () => widget.onRemoved?.call(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Assets.icons.icUpdatedCloseButton.svgBlack,
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
