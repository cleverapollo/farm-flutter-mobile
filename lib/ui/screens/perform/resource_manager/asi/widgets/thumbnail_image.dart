
import 'dart:convert';
import 'dart:io';

import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/state/rm_asi/asi_detail_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThumbnailImage extends StatefulWidget {
  final AsiPhoto asiPhoto;
  final void Function()? onRemoved;
  final void Function(AsiPhoto)? onChanged;

  const ThumbnailImage({
        required this.asiPhoto,
        this.onRemoved,
        this.onChanged,
        Key? key,
      }) : super(key: key);

  @override
  State<ThumbnailImage> createState() => _ThumbnailImageState();
}

class _ThumbnailImageState extends State<ThumbnailImage> {
  final _controller = TextEditingController();

  late AsiPhoto asiPhoto;
  @override
  void initState() {
    super.initState();
    asiPhoto = widget.asiPhoto;
    _controller.text = asiPhoto.photoName ?? '';
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
              if (asiPhoto.photo.isNotBlank) {
                final imageProvider = MemoryImage(base64Decode(asiPhoto.photo ?? ''));
                showImageViewer(context, imageProvider);
              }
            },
            child: Image.memory(
              base64Decode(asiPhoto.photo ?? ''),
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
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              final croppedFile = await ImagePickerService().pickImageFromGallery();
              if (croppedFile != null) {
                final base64 = await FileUtil.croppedFileToBase64(croppedFile);
                setState(() {
                  asiPhoto = asiPhoto.copyWith(photo: base64);
                  widget.onChanged?.call(asiPhoto);
                });
              }
            },
            child: Assets.icons.icSelectPhotoMap.svg(width: 32, height: 32),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              final croppedFile = await ImagePickerService().pickImageFromCamera();
              if (croppedFile != null) {
                final base64 = await FileUtil.croppedFileToBase64(croppedFile);
                setState(() {
                  asiPhoto = asiPhoto.copyWith(photo: base64);
                  widget.onChanged?.call(asiPhoto);
                });
              }
            },
            child: Assets.icons.icTakePhotoMap.svg(
              width: 32,
              height: 32,
            ),
          ),
          const SizedBox(width: 8),
          CmoTappable(
            onTap: () => widget.onRemoved?.call(),
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
