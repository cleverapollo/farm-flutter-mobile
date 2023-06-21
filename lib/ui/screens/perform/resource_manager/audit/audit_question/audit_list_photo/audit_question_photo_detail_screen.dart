import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        auditPhoto = auditPhoto.copyWith(
          photo: croppedImage.path,
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
        auditPhoto = auditPhoto.copyWith(
          photo: croppedImage.path,
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
            Image.file(
              File(auditPhoto.photo!),
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
              onTap: _reselectPhotoFromCamera,
              title: LocaleKeys.retakePhoto.tr(),
            ),
            CmoFilledButton(
              onTap: _reselectPhotoFromGallery,
              title: LocaleKeys.reselectPhoto.tr(),
            ),
          ],
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 12),
          child: CmoFilledButton(
            onTap: () {
              widget.savePhoto(auditPhoto);
              Navigator.of(context).pop();
            },
            title: LocaleKeys.save.tr(),
          ),
        ),
      ],
    );
  }
}
