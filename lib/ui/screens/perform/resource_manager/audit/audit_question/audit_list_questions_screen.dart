import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_comment/audit_list_comment_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_photo/audit_list_photo_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_question_add_comment/audit_question_add_comment_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/audit_question_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/car_filter.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/compliance_filter.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AuditListQuestionsScreen extends StatefulWidget {
  const AuditListQuestionsScreen({
    super.key,
    required this.audit,
  });

  final Audit audit;

  static Future<bool?> push(BuildContext context, Audit audit) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditListQuestionsScreen(audit: audit),
      ),
    );
  }

  @override
  State<AuditListQuestionsScreen> createState() =>
      _AuditListQuestionsScreenState();
}

class _AuditListQuestionsScreenState extends State<AuditListQuestionsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AuditListQuestionsCubit>().initialize(widget.audit);
    });
  }

  Future<void> _viewComment({
    required FarmQuestion farmQuestion,
  }) async {
    AuditListCommentScreen.push(
      context,
      auditQuestion: farmQuestion,
      auditId:
          context.read<AuditListQuestionsCubit>().state.audit?.assessmentId,
    );
  }

  Future<void> addNewComment({
    required FarmQuestion farmQuestion,
  }) async {
    final result = await AuditQuestionAddCommentScreen.push(
      context,
      auditQuestion: farmQuestion,
      auditId:
          context.read<AuditListQuestionsCubit>().state.audit?.assessmentId,
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
      auditId:
          context.read<AuditListQuestionsCubit>().state.audit?.assessmentId,
    );

    if (result != null) {
      await context.read<AuditListQuestionsCubit>().refresh();
    }
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

        if (compliance.hasRejectReason != null && compliance.hasRejectReason!) {
          await addNewComment(farmQuestion: question);
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
        subtitle: widget.audit.compartmentName,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          _buildFilterSection(),
          BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, bool>(
            selector: (state) => state.incompleteFilter == 1,
            builder: (context, incompleteFilter) => CmoHeaderTile(
              title: LocaleKeys.incomplete.tr(),
              child: Row(
                children: [
                  CmoTappable(
                    onTap: () {
                      context
                          .read<AuditListQuestionsCubit>()
                          .setIncompleteFilter(incompleteFilter ? 0 : 1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: incompleteFilter ? Colors.green : Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: incompleteFilter
                            ? Assets.icons.icTick.svgWhite
                            : Assets.icons.icTick.svg(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.icCamera.svgWhite,
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: BlocSelector<AuditListQuestionsCubit,
                              AuditListQuestionsState, int>(
                            selector: (state) => state.totalPhotos,
                            builder: (context, lengthPhoto) => Text(
                              '$lengthPhoto',
                              style: context.textStyles.bodyBold.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: BlocSelector<AuditListQuestionsCubit,
                        AuditListQuestionsState, AuditListQuestionsState>(
                      selector: (state) => state,
                      builder: (context, state) => Text(
                        '${state.getAnsweredFilteredQuestions().length}/${state.filteredQuestions.length}',
                        style: context.textStyles.bodyBold.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child:
                BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
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
                          farmQuestion: question,
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

  Widget _buildFilterSection() {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Expanded(child: CarFilter()),
                const Expanded(child: ComplianceFilter()),
              ].withSpaceBetween(width: 20),
            )
          ],
        ),
      ),
    );
  }
}
