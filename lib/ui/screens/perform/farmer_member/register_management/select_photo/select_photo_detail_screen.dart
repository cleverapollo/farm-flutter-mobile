import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SelectPhotoDetailScreen extends StatefulWidget {
  const SelectPhotoDetailScreen({super.key,
    required this.photoModel,
    required this.savePhoto,
  });

  final RteSpeciesPhotoModel photoModel;
  final void Function(RteSpeciesPhotoModel) savePhoto;

  static void push(
      BuildContext context, {
        required RteSpeciesPhotoModel photoModel,
        required void Function(RteSpeciesPhotoModel) savePhoto,
      }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SelectPhotoDetailScreen(
          photoModel: photoModel,
          savePhoto: savePhoto,
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _SelectPhotoDetailScreenState();
}

class _SelectPhotoDetailScreenState extends State<SelectPhotoDetailScreen> {

  late RteSpeciesPhotoModel photoModel;

  final ImagePickerService _imagePickerService = ImagePickerService();

  @override
  void initState() {
    super.initState();
    photoModel = widget.photoModel;
  }

  Future<void> _selectPhotoFromCamera() async {
    final croppedImage = await _imagePickerService.pickImageFromCamera(title: DateTime.now().toString());
    if (croppedImage != null) {
      if (context.mounted) {
        photoModel = photoModel.copyWith(
          photoName: DateTime.now().toString(),
          photoPath: croppedImage.path,
        );

        setState(() {});
      }
    }
  }

  Future<void> _selectPhotoFromGallery() async {
    final croppedImage = await _imagePickerService.pickImageFromGallery(
      title: DateTime.now().toString(),
    );
    if (croppedImage != null) {
      if (context.mounted) {
        photoModel = photoModel.copyWith(
          photoName: DateTime.now().toString(),
          photoPath: croppedImage.path,
        );

        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.photos.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 30,
        ),
        child: Column(
          children: [
            Image.file(
              File(photoModel.photoPath!),
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CmoFilledButton(
              onTap: _selectPhotoFromCamera,
              title: LocaleKeys.retakePhoto.tr(),
            ),
            CmoFilledButton(
              onTap: _selectPhotoFromGallery,
              title: LocaleKeys.reselectPhoto.tr(),
            ),
          ],
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 12),
          child: CmoFilledButton(
            onTap: () {
              widget.savePhoto(photoModel);
              Navigator.of(context).pop();
            },
            title: LocaleKeys.save.tr(),
          ),
        ),
      ],
    );
  }
}

