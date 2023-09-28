import 'dart:convert';
import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/state/assessment_question_cubit/assessment_question_cubit.dart';
import 'package:cmo/state/audit_list_questions_cubit/audit_list_questions_cubit.dart';
import 'package:cmo/state/audit_question_photo/audit_question_photo_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_photo/audit_question_photo_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditListPhotoScreen extends StatefulWidget {
  const AuditListPhotoScreen({
    super.key,
    required this.auditQuestion,
    required this.auditId,
  });

  static Future<bool?> push(
    BuildContext context, {
    required FarmQuestion auditQuestion,
    required int? auditId,
  }) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditListPhotoScreen(
          auditQuestion: auditQuestion,
          auditId: auditId,
        ),
      ),
    );
  }

  final FarmQuestion auditQuestion;

  final int? auditId;

  @override
  State<AuditListPhotoScreen> createState() => _AuditListPhotoScreenState();
}

class _AuditListPhotoScreenState extends State<AuditListPhotoScreen> {
  final ImagePickerService _imagePickerService = ImagePickerService();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AuditQuestionPhotoCubit>().initialize(
            auditQuestion: widget.auditQuestion,
            auditId: widget.auditId,
          );
    });
  }

  Future<void> _selectPhotoFromCamera() async {
    final croppedImage = await _imagePickerService.pickImageFromCamera(
      title: DateTime.now().toString(),
    );
    if (croppedImage != null) {
      if (context.mounted) {
        setState(() {
          loading = true;
        });

        final base64 = await FileUtil.toBase64(await FileUtil.writeToFileWithUint8List(await croppedImage.readAsBytes()));
        await context.read<AuditQuestionPhotoCubit>().addPhoto(
              photoPath: base64,
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

      final base64 = await FileUtil.toBase64(await FileUtil.writeToFileWithUint8List(await croppedImage.readAsBytes()));
      if (context.mounted) {
        await context.read<AuditQuestionPhotoCubit>().addPhoto(
              photoPath: base64,
            );
      }

      setState(() {
        loading = false;
      });
    }
  }

  Future<void> _replacePhoto(QuestionPhoto photo) async {
    if (context.mounted) {
      setState(() {
        loading = true;
      });

      await context.read<AuditQuestionPhotoCubit>().replacePhoto(photo: photo);

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuditQuestionPhotoCubit, AuditQuestionPhotoState>(
      bloc: context.read<AuditQuestionPhotoCubit>(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.pictures.tr(),
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
            onTapTrailing: Navigator.of(context).pop,
          ),
          body: ListView.separated(
            itemCount: snapshot.photos.length,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemBuilder: (BuildContext context, int index) {
              if (snapshot.photos[index].photo == null) return const SizedBox();
              return InkWell(
                onTap: () {
                  AuditQuestionsPhotoDetailScreen.push(
                    context,
                    auditQuestionPhoto: snapshot.photos[index],
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
                      Image.memory(
                        const Base64Decoder().convert(snapshot.photos[index].photo!),
                        fit: BoxFit.fitHeight,
                        width: 74,
                        height: 74,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Text(
                          snapshot.photos[index].photo!,
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
                onTap: () =>
                    Navigator.of(context).pop(snapshot.photos.isNotEmpty),
                title: LocaleKeys.done.tr(),
                loading: loading,
              ),
            ),
          ],
        );
      },
    );
  }
}
