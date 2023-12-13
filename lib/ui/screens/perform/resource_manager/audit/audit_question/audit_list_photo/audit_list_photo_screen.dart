import 'dart:convert';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_photo/audit_question_photo_detail_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/editable_photo_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditListPhotoScreen extends BaseStatefulWidget {
  AuditListPhotoScreen({
    super.key,
    required this.auditQuestion,
    required this.auditId,
    required this.totalAuditPhotos,
  }) : super(screenName: LocaleKeys.pictures.tr());

  static Future<bool?> push(
    BuildContext context, {
    required FarmQuestion auditQuestion,
    required int? auditId,
    required int totalAuditPhotos,
  }) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => AuditQuestionPhotoCubit(),
          child: AuditListPhotoScreen(
            auditQuestion: auditQuestion,
            auditId: auditId,
            totalAuditPhotos: totalAuditPhotos,
          ),
        ),
      ),
    );
  }

  final FarmQuestion auditQuestion;

  final int? auditId;

  final int totalAuditPhotos;
  
  @override
  State<AuditListPhotoScreen> createState() => _AuditListPhotoScreenState();
}

class _AuditListPhotoScreenState extends BaseStatefulWidgetState<AuditListPhotoScreen> {
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

  bool verifyMaximumAuditPhotos() {
    final canUpload = widget.totalAuditPhotos < Constants.MAX_UPLOADED_PHOTOS_AUDIT;
    if (!canUpload) {
      showSnackError(msg: LocaleKeys.react_maximum_audit_photos.tr());
    }

    return canUpload;
  }

  Future<void> removePhoto(QuestionPhoto photo) async {
    if (context.mounted) {
      setState(() {
        loading = true;
      });

      await context.read<AuditQuestionPhotoCubit>().removePhoto(photo: photo);
      await context.read<AuditListQuestionsCubit>().refreshAfterUploadPhoto();

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
      builder: (context, state) {
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.pictures.tr(),
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
            onTapTrailing: Navigator.of(context).pop,
          ),
          body: ListView.separated(
            itemCount: state.photos.length,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            itemBuilder: (BuildContext context, int index) {
              if (state.photos[index].photo == null) return const SizedBox();
              return InkWell(
                onTap: () {
                  AuditQuestionsPhotoDetailScreen.push(
                    context,
                    auditQuestionPhoto: state.photos[index],
                    savePhoto: _replacePhoto,
                  );
                },
                child: EditablePhotoItem(
                  photoDetail: PhotoDetail.fromQuestionPhoto(state.photos[index]),
                  onRemoved: () async {
                    await removePhoto(state.photos[index]);
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 12),
              child: CmoFilledButton(
                onTap: () =>
                    Navigator.of(context).pop(state.photos.isNotEmpty),
                title: LocaleKeys.save.tr(),
                loading: loading,
              ),
            ),
          ],
        );
      },
    );
  }
}
