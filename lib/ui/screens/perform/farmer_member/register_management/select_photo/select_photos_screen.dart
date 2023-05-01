import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_photo/select_photo_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SelectPhotosScreen extends StatefulWidget {
  const SelectPhotosScreen({super.key, required this.listPhotos});

  final List<RteSpeciesPhotoModel> listPhotos;

  @override
  State<StatefulWidget> createState() => _SelectPhotosScreenState();

  static Future<List<RteSpeciesPhotoModel>?> push(
    BuildContext context, {
    required List<RteSpeciesPhotoModel> listPhotos,
  }) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SelectPhotosScreen(listPhotos: listPhotos),
      ),
    );
  }
}

class _SelectPhotosScreenState extends State<SelectPhotosScreen> {
  late List<RteSpeciesPhotoModel> listPhotos;

  final ImagePickerService _imagePickerService = ImagePickerService();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    listPhotos = <RteSpeciesPhotoModel>[];
    listPhotos.addAll(widget.listPhotos);
  }

  Future<void> _selectPhotoFromCamera() async {
    final croppedImage = await _imagePickerService.pickImageFromCamera(
        title: DateTime.now().toString());
    if (croppedImage != null) {
      if (context.mounted) {
        setState(() {
          loading = true;
        });

        listPhotos.add(
          RteSpeciesPhotoModel(
            photoName: DateTime.now().toString(),
            photoPath: croppedImage.path,
            photoId: DateTime.now().millisecondsSinceEpoch,
          ),
        );

        setState(() {
          loading = false;
        });
      }
    }
  }

  Future<void> _selectPhotoFromGallery() async {
    final croppedImage = await _imagePickerService.pickImageFromGallery(
      title: DateTime.now().toString(),
    );
    if (croppedImage != null) {
      setState(() {
        loading = true;
      });

      if (context.mounted) {
        listPhotos.add(
          RteSpeciesPhotoModel(
            photoName: DateTime.now().toString(),
            photoPath: croppedImage.path,
            photoId: DateTime.now().millisecondsSinceEpoch,
          ),
        );
      }

      setState(() {
        loading = false;
      });
    }
  }

  Future<void> _replacePhoto(RteSpeciesPhotoModel photo) async {
    if (context.mounted) {
      setState(() {
        loading = true;
      });

      listPhotos.removeWhere((element) => element.photoId == photo.photoId);
      listPhotos.add(photo);

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.photos.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: ListView.separated(
        itemCount: listPhotos.length,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        itemBuilder: (BuildContext context, int index) {
          if (listPhotos[index].photoPath == null) return const SizedBox();
          return InkWell(
            onTap: () {
              SelectPhotoDetailScreen.push(
                context,
                photoModel: listPhotos[index],
                savePhoto: _replacePhoto,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: context.colors.greyD9D9,
              ),
              child: Row(
                children: [
                  Image.file(
                    File(listPhotos[index].photoPath!),
                    fit: BoxFit.fitHeight,
                    width: 74,
                    height: 74,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Text(
                      listPhotos[index].photoName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyles.bodyBold.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 12);
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CmoFilledButton(
              onTap: _selectPhotoFromCamera,
              title: LocaleKeys.takePhoto.tr(),
            ),
            CmoFilledButton(
              onTap: _selectPhotoFromGallery,
              title: LocaleKeys.selectPhoto.tr(),
            ),
          ],
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 12),
          child: CmoFilledButton(
            onTap: () => Navigator.of(context).pop(listPhotos),
            title: LocaleKeys.done.tr(),
            loading: loading,
          ),
        ),
      ],
    );
  }
}
