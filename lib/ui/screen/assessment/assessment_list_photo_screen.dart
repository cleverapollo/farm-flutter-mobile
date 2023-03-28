import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class AssessmentListPhotoScreen extends StatefulWidget {
  const AssessmentListPhotoScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AssessmentListPhotoScreen(),
      ),
    );
  }

  @override
  State<AssessmentListPhotoScreen> createState() =>
      _AssessmentListPhotoScreenState();
}

class _AssessmentListPhotoScreenState extends State<AssessmentListPhotoScreen> {
  final ImagePickerService _imagePickerService = ImagePickerService();

  Future<void> _selectPhotoFromCamera() async {
    final croppedImage = await _imagePickerService.pickImageFromCamera();
    if (croppedImage != null) {}
  }

  Future<void> _selectPhotoFromGallery() async {
    final croppedImage = await _imagePickerService.pickImageFromGallery();
    if (croppedImage != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.takePhoto.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: const [
          Placeholder(),
        ],
      ),
      persistentFooterButtons: [
        CmoFilledButton(
          onTap: _selectPhotoFromCamera,
          title: LocaleKeys.takePhoto.tr(),
        ),
        CmoFilledButton(
          onTap: _selectPhotoFromGallery,
          title: LocaleKeys.selectPhoto.tr(),
        ),
      ],
    );
  }
}
