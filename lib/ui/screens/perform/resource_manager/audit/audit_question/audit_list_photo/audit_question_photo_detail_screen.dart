import 'dart:convert';
import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/material.dart';

class AuditQuestionsPhotoDetailScreen extends StatefulWidget {
  AuditQuestionsPhotoDetailScreen({
    required this.questionPhoto,
    required this.savePhoto,
  });

  final QuestionPhoto questionPhoto;
  final void Function(QuestionPhoto) savePhoto;

  static void push(
    BuildContext context, {
    required QuestionPhoto auditQuestionPhoto,
    required void Function(QuestionPhoto) savePhoto,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditQuestionsPhotoDetailScreen(
          questionPhoto: auditQuestionPhoto,
          savePhoto: savePhoto,
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _AuditQuestionsPhotoDetailScreenState();
}

class _AuditQuestionsPhotoDetailScreenState extends State<AuditQuestionsPhotoDetailScreen> {
  late QuestionPhoto auditPhoto;

  final ImagePickerService _imagePickerService = ImagePickerService();

  @override
  void initState() {
    super.initState();
    auditPhoto = widget.questionPhoto;
  }

  Future<void> _reselectPhotoFromCamera() async {
    final croppedImage = await _imagePickerService.pickImageFromCamera(title: DateTime.now().toString());
    if (croppedImage != null) {
      if (context.mounted) {
        final base64 = await FileUtil.toBase64(await FileUtil.writeToFileWithUint8List(await croppedImage.readAsBytes()));
        auditPhoto = auditPhoto.copyWith(
          photo: base64,
        );

        setState(() {});
      }
    }
  }

  Future<void> _reselectPhotoFromGallery() async {
    final croppedImage = await _imagePickerService.pickImageFromGallery(
      title: DateTime.now().toString(),
    );
    if (croppedImage != null) {
      if (context.mounted) {
        final base64 = await FileUtil.toBase64(await FileUtil.writeToFileWithUint8List(await croppedImage.readAsBytes()));
        auditPhoto = auditPhoto.copyWith(
          photo: base64,
        );

        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.pictures.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 30,
        ),
        child: Column(
          children: [
            Image.memory(
              const Base64Decoder().convert(auditPhoto.photo!),
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _reselectPhotoFromGallery,
                  child: Assets.icons.icSelectPhotoMap.svg(),
                ),
                const SizedBox(width: 32,),
                InkWell(
                  onTap: _reselectPhotoFromCamera,
                  child: SvgGenImage(Assets.icons.icTakePhotoMap.path).svg(
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32,),
            Container(
              alignment: Alignment.topCenter,
              child: CmoFilledButton(
                onTap: () {
                  widget.savePhoto(auditPhoto);
                  Navigator.of(context).pop();
                },
                title: LocaleKeys.save.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
