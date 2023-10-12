import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_photo/audit_list_photo_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_question_comment/audit_question_comment_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/audit_question_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/car_filter.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/compliance_filter.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/audit_progress_indicator.dart';
import 'widgets/audit_search_field.dart';
import 'widgets/imcomplete_filter.dart';

class AuditListQuestionsScreen extends StatefulWidget {
  const AuditListQuestionsScreen({
    super.key,
    required this.audit,
    required this.auditComeFrom,
  });

  final Audit audit;
  final AuditComeFromEnum auditComeFrom;

  static Future<bool?> push(
    BuildContext context,
    Audit audit,
    AuditComeFromEnum auditComeFrom,
  ) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditListQuestionsScreen(
          audit: audit,
          auditComeFrom: auditComeFrom,
        ),
      ),
    );
  }

  @override
  State<AuditListQuestionsScreen> createState() => _AuditListQuestionsScreenState();
}

class _AuditListQuestionsScreenState extends State<AuditListQuestionsScreen> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AuditListQuestionsCubit>().initialize(widget.audit);
    });
  }

  Future<void> _viewComment({
    required FarmQuestion auditQuestion,
  }) async {
    final comment = context
        .read<AuditListQuestionsCubit>()
        .state
        .questionComments
        .firstWhereOrNull(
          (element) => element.questionId == auditQuestion.questionId,
        );

    final answer = context
        .read<AuditListQuestionsCubit>()
        .state
        .answers
        .firstWhereOrNull(
          (element) => element.questionId == auditQuestion.questionId,
        );

    final result = await AuditQuestionCommentScreen.push(
      context,
      auditQuestion: auditQuestion,
      auditId: context.read<AuditListQuestionsCubit>().state.audit?.assessmentId,
      comment: comment,
      answer: answer,
    );

    if (result != null) {
      await context.read<AuditListQuestionsCubit>().refresh();
    }
  }

  Future<void> addNewComment({
    required FarmQuestion auditQuestion,
  }) async {
    final result = await AuditQuestionCommentScreen.push(
      context,
      auditQuestion: auditQuestion,
      auditId: context.read<AuditListQuestionsCubit>().state.audit?.assessmentId,
    );

    if (result != null) {
      await context.read<AuditListQuestionsCubit>().refresh();
    }
  }

  Future<void> _viewListPhoto({
    required FarmQuestion auditQuestion,
  }) async {
    final result = await AuditListPhotoScreen.push(
      context,
      auditQuestion: auditQuestion,
      auditId: context.read<AuditListQuestionsCubit>().state.audit?.assessmentId,
      totalAuditPhotos: context.read<AuditListQuestionsCubit>().state.totalPhotos,
    );

    if (result != null) {
      await context.read<AuditListQuestionsCubit>().refreshAfterUploadPhoto();
    }
  }

  Future<void> _onTapLocation({
    required FarmQuestion auditQuestion,
  }) async {
    final state = context.read<AuditListQuestionsCubit>().state;
    var answer = state.answers.firstWhereOrNull((element) => element.questionId == auditQuestion.questionId);
    final locationModel = LocationModel()
      ..longitude = answer?.longitude
      ..latitude = answer?.latitude;
    final result = await SelectLocationScreen.push(
      context,
      title: '${LocaleKeys.question.tr().capitalize()} ${auditQuestion.indicatorName ?? ''}',
      locationModel: locationModel,
      shouldShowPhotoButton: false,
      shouldShowDangerIcon: auditQuestion.xBone ?? false,
      shouldShowBackIcon: true,
      saveTitle: LocaleKeys.save.tr(),
      alwaysEnableSaveButton: true,
    );

    if (result == null) return;
    final mapResult = result as LocationModel;
    await context.read<AuditListQuestionsCubit>().updateLocationQuestionAnswer(
      questionId: auditQuestion.questionId,
      lat: mapResult.latitude,
      lng: mapResult.longitude,
    );
  }

  Future<void> _addAnswer(
    FarmQuestion question,
    Compliance compliance,
  ) async {
    await context.read<AuditListQuestionsCubit>().setAnswer(
      question,
      compliance,
      onCallback: () async {
        if (context.read<AuditListQuestionsCubit>().state.audit!.completed) {
          await context.read<AuditListCubit>().refresh();
          await context.read<DashboardCubit>().initializeRM();
        }

        if (compliance.isNC) {
          await addNewComment(auditQuestion: question);
        }
      },
    );
  }

  Future<void> _saveQuestionAnswer() async {
    if (context.mounted) {
      await context
          .read<AuditListQuestionsCubit>()
          .onSave();
      await context.read<AuditListCubit>().refresh();
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.audit.tr(),
        subtitle: widget.audit.compartmentName ?? widget.audit.farmName,
        subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: () {
          switch (widget.auditComeFrom) {
            case AuditComeFromEnum.dashboard:
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              break;
            case AuditComeFromEnum.menu:
              Navigator.of(context).pop();
          }
        },
      ),
      body: Column(
        children: [
          buildFilterSection(),
          buildInformationWidget(),
          const AuditProgressIndicator(),
          const IncompleteFilter(),
          Expanded(
            child: BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
              builder: (context, snapshot) {
                final filterQuestions = snapshot.filteredQuestions;
                return ListView.separated(
                  itemCount: filterQuestions.length,
                  itemBuilder: (context, index) {
                    final question = filterQuestions[index];
                    final answer = context
                        .watch<AuditListQuestionsCubit>()
                        .getAnswerByQuestionId(question.questionId);
                    return AuditQuestionItem(
                      question: question,
                      answer: answer,
                      compliances: snapshot.compliances,
                      onTapLocation: () async {
                        await _onTapLocation(auditQuestion: question);
                      },
                      addAnswer: (compliance) {
                        _addAnswer(
                          question,
                          compliance,
                        );
                      },
                      viewListPhoto: () {
                        _viewListPhoto(
                          auditQuestion: question,
                        );
                      },
                      viewComment: () {
                        _viewComment(
                          auditQuestion: question,
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: context.colors.grey,
                    );
                  },
                );
              },
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 12),
          //   child: AttributeItem(
          //     child: InputAttributeItem(
          //       initialValue: widget.audit.note,
          //       textStyle: context.textStyles.bodyNormal.blueDark2,
          //       labelText: LocaleKeys.notes.tr(),
          //       labelTextStyle: context.textStyles.bodyBold.blueDark2,
          //       suffixIcon: BlocSelector<AuditListQuestionsCubit,
          //           AuditListQuestionsState, String?>(
          //         selector: (state) => state.audit?.note,
          //         builder: (context, note) {
          //           return InkWell(
          //             onTap: () {
          //               final shareNote = note ?? widget.audit.note ?? '';
          //
          //               if (shareNote.isNullOrEmpty) return;
          //
          //               Share.share(shareNote);
          //             },
          //             child: Assets.icons.icShareButton.svgBlack,
          //           );
          //         },
          //       ),
          //       onChanged: context.read<AuditListQuestionsCubit>().onChangeNote,
          //     ),
          //   ),
          // ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState,
            List<QuestionAnswer>>(
          selector: (state) => state.answers,
          builder: (context, answers) {
            return CmoFilledButton(
              disable: !(answers.firstWhereOrNull(
                      (element) => element.isQuestionComplete == 1) !=
                  null),
              onTap: _saveQuestionAnswer,
              title: LocaleKeys.save.tr(),
              loading: loading,
            );
          },
        ),
      ],
    );
  }

  Widget buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Expanded(child: CarFilter()),
              const Expanded(child: ComplianceFilter()),
            ].withSpaceBetween(width: 20),
          ),
          AuditSearchField(),
        ],
      ),
    );
  }

  Widget buildInformationWidget() {
    return BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, bool>(
      selector: (state) => state.incompleteFilter == 1,
      builder: (context, incompleteFilter) => Container(
        color: context.colors.blueDark2,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState,
                  AuditListQuestionsState>(
                selector: (state) => state,
                builder: (context, state) => Text(
                  '${context.read<AuditListQuestionsCubit>().getTotalQuestionsValue()}/${state.questions.length} ${LocaleKeys.questions.tr()}',
                  style: context.textStyles.bodyBold.white,
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.icCamera.svgWhite,
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: BlocSelector<AuditListQuestionsCubit,
                        AuditListQuestionsState, int>(
                      selector: (state) => state.totalPhotos,
                      builder: (context, lengthPhoto) => Text(
                        '$lengthPhoto/${Constants.MAX_UPLOADED_PHOTOS_AUDIT.toString()}',
                        style: context.textStyles.bodyBold.white,
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(width: 20,),
            Row(
              children: [
                Assets.icons.icComment.svgWhite,
                const SizedBox(width: 6),
                BlocSelector<AuditListQuestionsCubit,
                    AuditListQuestionsState, int>(
                  selector: (state) => state.totalComments,
                  builder: (context, questionCommentsLength) => Text(
                    '$questionCommentsLength',
                    style: context.textStyles.bodyBold.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
