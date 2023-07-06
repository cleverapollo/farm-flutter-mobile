import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class FarmerStakeHolderUploadAvatar extends StatefulWidget {
  final void Function(String path) onSelectAvatar;
  final String? photoUrl;

  const FarmerStakeHolderUploadAvatar({
    super.key,
    required this.onSelectAvatar,
    this.photoUrl,
  });

  @override
  State<StatefulWidget> createState() => _FarmerStakeHolderUploadAvatarState();
}

class _FarmerStakeHolderUploadAvatarState extends State<FarmerStakeHolderUploadAvatar> {
  final ImagePickerService _imagePickerService = ImagePickerService();

  String photoPath = '';

  @override
  void initState() {
    super.initState();
    photoPath = widget.photoUrl ?? '';
  }


  Future<void> _selectPhotoFromCamera() async {
    Navigator.of(context).pop();
    final croppedImage = await _imagePickerService.pickImageFromCamera(title: DateTime.now().toString());
    if (croppedImage != null) {
      if (context.mounted) {
        setState(() {
          photoPath = croppedImage.path;
        });

        widget.onSelectAvatar(photoPath);
      }
    }
  }

  Future<void> _selectPhotoFromGallery() async {
    Navigator.of(context).pop();
    final croppedImage = await _imagePickerService.pickImageFromGallery(
      title: DateTime.now().toString(),
    );
    if (croppedImage != null) {
      if (context.mounted) {
        if (context.mounted) {
          setState(() {
            photoPath = croppedImage.path;
          });

          widget.onSelectAvatar(photoPath);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CmoFilledButton(
                      onTap: _selectPhotoFromCamera,
                      title: LocaleKeys.takePhoto.tr(),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    CmoFilledButton(
                      onTap: _selectPhotoFromGallery,
                      title: LocaleKeys.selectPhoto.tr(),
                    ),
                  ],
                )
              ],
              content: Text(
                LocaleKeys.uploadAvatarDescription.tr(),
                style: context.textStyles.bodyBold.black,
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: photoPath.isEmpty ? _defaultWidget() : _buildAvatarWidget(),
      ),
    );
  }

  Widget _buildAvatarWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45),
      child: Image.file(
        File(photoPath),
        fit: BoxFit.fill,
        height: 90,
        width: 90,
      ),
    );
  }

  Widget _defaultWidget() {
    return Stack(
      children: [
        Assets.icons.icAvatar.svgBlack,
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: Assets.icons.icAdd.svgWhite,
          ),
        ),
      ],
    );
  }
}
