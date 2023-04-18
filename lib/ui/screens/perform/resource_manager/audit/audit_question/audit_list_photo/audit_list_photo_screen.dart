import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/state/assessment_question_cubit/assessment_question_cubit.dart';
import 'package:cmo/state/audit_list_questions_cubit/audit_list_questions_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_photo/audit_question_photo_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditListPhotoScreen extends StatefulWidget {
  const AuditListPhotoScreen({
    super.key,
    required this.questionId,
  });

  static void push(
      BuildContext context, {
        required int? questionId,
      }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditListPhotoScreen(questionId: questionId),
      ),
    );
  }

  final int? questionId;

  @override
  State<AuditListPhotoScreen> createState() =>
      _AuditListPhotoScreenState();
}

class _AuditListPhotoScreenState extends State<AuditListPhotoScreen> {
  final ImagePickerService _imagePickerService = ImagePickerService();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectPhotoFromCamera() async {
    final croppedImage = await _imagePickerService.pickImageFromCamera(title: DateTime.now().toString());
    if (croppedImage != null) {
      if (context.mounted) {
        await context.read<AuditListQuestionsCubit>().addPhoto(
          questionId: widget.questionId,
          photoPath: croppedImage.path,
          photoName: DateTime.now().toString(),
        );
      }
    }
  }

  Future<void> _selectPhotoFromGallery() async {
    final croppedImage = await _imagePickerService.pickImageFromGallery(title: DateTime.now().toString(),);
    if (croppedImage != null) {
      if (context.mounted) {
        await context.read<AuditListQuestionsCubit>().addPhoto(
          questionId: widget.questionId,
          photoPath: croppedImage.path,
          photoName: DateTime.now().toString(),
        );
      }
    }
  }

  void removeImage(QuestionPhoto photo) {
    context.read<AuditListQuestionsCubit>().removePhoto(photo: photo);
  }

  @override
  Widget build(BuildContext context) {
    final images = context
        .watch<AuditListQuestionsCubit>()
        .state
        .auditQuestionPhotos
        .where(
          (e) => e.questionId == widget.questionId,
    )
        .toList();

    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.pictures.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: ListView.separated(
        itemCount: images.length,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        itemBuilder: (BuildContext context, int index) {
          if (images[index].photoPath == null) return const SizedBox();
          return InkWell(
            onTap: () {
              AuditQuestionsPhotoDetailScreen.push(
                context,
                auditQuestionPhoto: images[index],
                savePhoto: (auditPhoto) {},
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
                    File(images[index].photoPath!),
                    fit: BoxFit.fitHeight,
                    width: 74,
                    height: 74,
                  ),
                  const SizedBox(width: 24,),
                  Expanded(
                    child: Text(
                      images[index].photoName!,
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
            onTap: () => Navigator.of(context).pop(),
            title: LocaleKeys.done.tr(),
          ),
        ),
      ],
    );
  }
}
