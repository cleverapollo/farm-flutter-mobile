import 'dart:convert';
import 'dart:io';

import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/state/assessment_question_cubit/assessment_question_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';

class AssessmentListPhotoScreen extends StatefulWidget {
  const AssessmentListPhotoScreen({
    super.key,
    required this.questionId,
  });

  static void push(
    BuildContext context, {
    required int? questionId,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssessmentListPhotoScreen(questionId: questionId),
      ),
    );
  }

  final int? questionId;

  @override
  State<AssessmentListPhotoScreen> createState() =>
      _AssessmentListPhotoScreenState();
}

class _AssessmentListPhotoScreenState extends State<AssessmentListPhotoScreen> {
  final ImagePickerService _imagePickerService = ImagePickerService();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectPhotoFromCamera() async {
    final croppedImage = await _imagePickerService.pickImageFromCamera();

    if (croppedImage?.path == null) return;

    final imageFile = File(croppedImage!.path); //convert Path to File
    final imageBytes = await imageFile.readAsBytes(); //convert to bytes
    final base64String = base64.encode(imageBytes);

    if (context.mounted) {
      await context.read<AssessmentQuestionCubit>().addPhoto(
            questionId: widget.questionId,
            photoBase64: 'data:image/jpeg;base64,$base64String',
            photoPath: croppedImage.path,
          );
    }
  }

  Future<void> _selectPhotoFromGallery() async {
    final croppedImage = await _imagePickerService.pickImageFromGallery();

    if (croppedImage?.path == null) return;

    final imageFile = File(croppedImage!.path); //convert Path to File
    final imageBytes = await imageFile.readAsBytes(); //convert to bytes
    final base64String = base64.encode(imageBytes);

    if (context.mounted) {
      await context.read<AssessmentQuestionCubit>().addPhoto(
            questionId: widget.questionId,
            photoBase64: 'data:image/jpeg;base64,$base64String',
            photoPath: croppedImage.path,
          );
    }
  }

  void removeImage(QuestionPhoto photo) {
    context.read<AssessmentQuestionCubit>().removePhoto(photo: photo);
  }

  @override
  Widget build(BuildContext context) {
    final images = context
        .watch<AssessmentQuestionCubit>()
        .state
        .questionPhotos
        .where(
          (e) => e.questionId == widget.questionId,
        )
        .toList();

    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.takePhoto.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: ListView.separated(
        itemCount: images.length,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        itemBuilder: (BuildContext context, int index) {
          if (images[index].photo == null) return const SizedBox();
          return SizedBox(
            height: 200,
            child: CmoCard(
              shouldShowArrowRight: false,
              content: [
                // CmoCardHeader(
                //   title: images[index].path.split('/').lastOrNull ?? '',
                // ),
                const SizedBox(height: 6),
                Expanded(
                  child: Image.file(
                    File(images[index].photoPath!),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 6),
                CmoFilledButton(
                  onTap: () => removeImage(images[index]),
                  title: LocaleKeys.remove.tr(),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 12);
        },
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
