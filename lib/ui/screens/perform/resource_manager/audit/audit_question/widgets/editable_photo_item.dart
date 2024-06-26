import 'dart:convert';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhotoDetail {
  String photoBase64;
  String photoName;
  Uint8List? imageBytesDecoded;
  int photoId;

  PhotoDetail({
    required this.photoId,
    required this.photoBase64,
    required this.photoName,
    required this.imageBytesDecoded,
  });

  factory PhotoDetail.fromQuestionPhoto(QuestionPhoto questionPhoto) =>
      PhotoDetail(
        photoBase64: questionPhoto.photo ?? '',
        photoId: questionPhoto.photoId ?? DateTime.now().microsecondsSinceEpoch,
        photoName: (questionPhoto.photoId ?? '').toString(),
        imageBytesDecoded: base64Decode(questionPhoto.photo ?? ''),
      );

  factory PhotoDetail.fromAsiPhoto(AsiPhoto asiPhoto) =>
      PhotoDetail(
        photoBase64: asiPhoto.photo ?? '',
        photoId: asiPhoto.asiRegisterLocalId ?? DateTime.now().microsecondsSinceEpoch,
        photoName: (asiPhoto.asiRegisterPhotoNo ?? DateTime.now().microsecondsSinceEpoch).toString(),
        imageBytesDecoded: base64Decode(asiPhoto.photo ?? ''),
      );
}

class EditablePhotoItem extends StatefulWidget {
  final PhotoDetail photoDetail;
  final void Function() onRemoved;
  final void Function(PhotoDetail photoDetail)? onChanged;
  final bool isAllowUploadNewPhoto;
  final bool isAllowUpdateName;

  const EditablePhotoItem({
    required this.photoDetail,
    required this.onRemoved,
    this.onChanged,
    this.isAllowUploadNewPhoto = false,
    this.isAllowUpdateName = false,
    super.key,
  });

  @override
  State<EditablePhotoItem> createState() => _EditablePhotoItemState();
}

class _EditablePhotoItemState extends State<EditablePhotoItem> {
  final _controller = TextEditingController();

  late PhotoDetail photoDetail;

  @override
  void initState() {
    super.initState();
    photoDetail = widget.photoDetail;
    _controller.text = photoDetail.photoName;
  }

  @override
  Widget build(BuildContext context) {
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
              if (photoDetail.photoBase64.isNotBlank && photoDetail.imageBytesDecoded.isNotBlank) {
                final imageProvider = MemoryImage(photoDetail.imageBytesDecoded!);
                showImageViewer(context, imageProvider);
              }
            },
            child: photoDetail.imageBytesDecoded.isNotBlank
                ? Image.memory(
                    key: Key(widget.photoDetail.photoId.toString()),
                    widget.photoDetail.imageBytesDecoded!,
                    fit: BoxFit.fitHeight,
                    width: 74,
                    height: 74,
                  )
                : const SizedBox(
                    width: 74,
                    height: 74,
                  ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: widget.isAllowUpdateName
                ? TextField(
              controller: _controller,
              style: context.textStyles.bodyBold.black,
              onChanged: (value) {
                setState(() {
                  photoDetail.photoName = value;
                });
                widget.onChanged?.call(photoDetail);
              },
            )
                : Text(
              widget.photoDetail.photoName ?? '',
              style: context.textStyles.bodyBold.blueDark2,
            ),
          ),
          if (widget.isAllowUploadNewPhoto) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () async {
                final croppedFile =
                await ImagePickerService().pickImageFromGallery();
                if (croppedFile != null) {
                  final base64 =
                  await FileUtil.croppedFileToBase64(croppedFile);
                  setState(() {
                    photoDetail.photoBase64 = base64;
                    widget.onChanged?.call(photoDetail);
                  });
                }
              },
              child: Assets.icons.icSelectPhotoMap
                  .svg(width: 32, height: 32),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () async {
                final croppedFile =
                await ImagePickerService().pickImageFromCamera();
                if (croppedFile != null) {
                  final base64 =
                  await FileUtil.croppedFileToBase64(croppedFile);
                  setState(() {
                    photoDetail.photoBase64 = base64;
                    widget.onChanged?.call(photoDetail);
                  });
                }
              },
              child: Assets.icons.icTakePhotoMap.svg(
                width: 32,
                height: 32,
              ),
            ),
          ],
          const SizedBox(width: 8),
          CmoTappable(
            onTap: widget.onRemoved,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Assets.icons.icClose.svgBlack,
            ),
          ),
        ],
      ),
    );
  }
}
