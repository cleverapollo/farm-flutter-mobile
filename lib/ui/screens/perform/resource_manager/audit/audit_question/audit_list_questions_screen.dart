import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_photo/audit_list_photo_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_question_add_comment/audit_question_add_comment_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/audit_question_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/car_filter.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/criteria_filter.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/indicator_filter.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/principle_filter.dart';
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
  State<AuditListQuestionsScreen> createState() => _AuditListQuestionsScreenState();
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
    required AuditQuestion auditQuestion,
  }) async {
    final result = await AuditQuestionAddCommentScreen.push(
      context,
      auditQuestion: auditQuestion,
    );

    if (result != null && result && context.mounted) {
      await context.read<AuditListQuestionsCubit>().markQuestionAnswerHasComment(auditQuestion);
    }
  }

  Future<void> _viewListPhoto({
    required AuditQuestion auditQuestion,
  }) async {
    final result = await AuditListPhotoScreen.push(context, auditQuestion: auditQuestion);

    if (result != null && result && context.mounted) {
      await context.read<AuditListQuestionsCubit>().markQuestionAnswerHasPhoto(auditQuestion);
    }
  }

  Future<void> _addAnswer(
    AuditQuestion question,
    AuditCompliance compliance,
  ) async {
    await context.read<AuditListQuestionsCubit>().setAnswer(question, compliance);
  }

  Future<void> _saveQuestionAnswer() async {
    await context.read<AuditListQuestionsCubit>().checkAllAuditQuestionCompleted();

    if (context.mounted) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
      bloc: context.read<AuditListQuestionsCubit>(),
      builder: (context, snapshot) {
        final filterQuestions = snapshot.filteredQuestions;
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
                selector: (state) {
                  return state.incompleteFilter == 1;
                },
                builder: (context, isComplete) => CmoHeaderTile(
                  title: isComplete ? LocaleKeys.completed.tr() : LocaleKeys.incomplete.tr(),
                  child: Row(
                    children: [
                      CmoTappable(
                        onTap: () {
                          context.read<AuditListQuestionsCubit>().setIncompleteFilter(isComplete ? 0 : 1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: !isComplete ? Colors.white : Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: !isComplete ? Assets.icons.icTick.svg() : Assets.icons.icTick.svgWhite,
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
                              child: BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, int>(
                                selector: (state) => state.auditQuestionPhotos.length,
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
                          BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, int>(
                            selector: (state) => state.questionComments.length,
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
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: filterQuestions.length,
                  itemBuilder: (context, index) {
                    final question = filterQuestions[index];
                    final answer = context.watch<AuditListQuestionsCubit>().getAnswerByQuestionId(question.questionId);

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
                ),
              ),
            ],
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            CmoFilledButton(
              onTap: _saveQuestionAnswer,
              title: LocaleKeys.save.tr(),
              loading: loading,
            ),
          ],
        );
      },
    );
  }

  Widget _buildFilterSection() {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFilterRow(
              firstChild: PrincipleFilter(formKey: _formKey),
              secondChild: CriteriaFilter(formKey: _formKey),
            ),
            const SizedBox(
              height: 12,
            ),
            _buildFilterRow(
              firstChild: CarFilter(formKey: _formKey),
              secondChild: IndicatorFilter(formKey: _formKey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterRow({required Widget firstChild, required Widget secondChild}) {
    return Row(
      children: [
        Expanded(child: firstChild),
        Expanded(child: secondChild),
      ].withSpaceBetween(width: 12),
    );
  }
}
