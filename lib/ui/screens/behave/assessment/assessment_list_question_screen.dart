import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_list_comment_screen.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_list_photo_screen.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_raised_comment.dart';
import 'package:cmo/ui/ui.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AssessmentListQuestionScreen extends StatefulWidget {
  const AssessmentListQuestionScreen({
    super.key,
    required this.assessment,
  });

  final Assessment assessment;

  static void push(BuildContext context, Assessment assessment) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssessmentListQuestionScreen(assessment: assessment),
      ),
    );
  }

  @override
  State<AssessmentListQuestionScreen> createState() =>
      _AssessmentListQuestionScreenState();
}

class _AssessmentListQuestionScreenState
    extends State<AssessmentListQuestionScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context
          .read<AssessmentQuestionCubit>()
          .initialize(widget.assessment);
    });
  }

  Future<void> _viewListComment({
    required int? questionId,
  }) async {
    AssessmentListCommentScreen.push(context, questionId: questionId);
  }

  Future<void> _viewListPhoto({
    required int? questionId,
  }) async {
    AssessmentListPhotoScreen.push(context, questionId: questionId);
  }

  Future<void> _addAnswer(
    CompanyQuestion question,
    Compliance compliance,
  ) async {
    // final haveRejectReason = compliance;
    final hasRejectReason = compliance.hasRejectReason ?? false;

    // * raise comment when choose option have reject reason
    if (hasRejectReason) {
      final rejectReasons =
          context.read<AssessmentQuestionCubit>().getRejectReasons();

      if (context.mounted) {
        await AssessmentRaiseComment.push<QuestionComment?>(
          context,
          widget.assessment,
          question,
          compliance,
          rejectReasons,
          (comment, rejectReasonId) async {
            await context
                .read<AssessmentQuestionCubit>()
                .addCommentFromReasonCode(
                  comment,
                  question,
                  compliance,
                  rejectReasonId,
                );
          },
        );
      }
    }

    if (context.mounted) {
      await context.read<AssessmentQuestionCubit>().setAnswer(
            question,
            compliance,
          );

      await context.read<AssessmentListCubit>().refresh();
      await context.read<DashboardCubit>().refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final assessment = context.watch<AssessmentQuestionCubit>().getAssessment();

    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.assessments.tr(),
        subtitle: assessment?.jobCategoryName,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Row(),
          FormBuilder(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 32),
              child: Row(
                children: [
                  Expanded(
                    child: SpeqssFilter(
                      formKey: _formKey,
                    ),
                  ),
                  Expanded(
                    child: PdcaFilter(
                      formKey: _formKey,
                    ),
                  ),
                  Expanded(
                    child: JobElementsFilter(
                      formKey: _formKey,
                    ),
                  ),
                ].withSpaceBetween(width: 4),
              ),
            ),
          ),
          BlocSelector<AssessmentQuestionCubit, AssessmentQuestionState, bool>(
            selector: (state) {
              return state.incompleteFilter == 1;
            },
            builder: (context, incompleteFilter) => CmoHeaderTile(
              title: LocaleKeys.incomplete.tr(),
              child: Row(
                children: [
                  CmoTappable(
                    onTap: () {
                      context
                          .read<AssessmentQuestionCubit>()
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
                          child: BlocSelector<AssessmentQuestionCubit,
                              AssessmentQuestionState, int>(
                            selector: (state) => state.questionPhotos.length,
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
                      BlocSelector<AssessmentQuestionCubit,
                          AssessmentQuestionState, int>(
                        selector: (state) => state.questionComments.length,
                        builder: (context, questionCommentsLength) => Text(
                          '$questionCommentsLength',
                          style: context.textStyles.bodyBold.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: BlocSelector<AssessmentQuestionCubit, AssessmentQuestionState,
                        AssessmentQuestionState>(
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
            child: BlocSelector<AssessmentQuestionCubit, AssessmentQuestionState,
                AssessmentQuestionState>(
              selector: (state) => state,
              builder: (context, state) =>ListView.separated(
                itemCount: state.filteredQuestions.length,
                itemBuilder: (context, index) {
                  final question = state.filteredQuestions[index];
                  final answer = context
                      .watch<AssessmentQuestionCubit>()
                      .getAnswerByQuestionId(question.questionId);

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${question.questionValue}',
                                style: context.textStyles.bodyNormal,
                              ),
                            ),
                            if (question.xBone ?? false)
                              Icon(
                                IconsaxOutline.danger,
                                size: 24.0,
                                color: context.colors.red,
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Wrap(
                                spacing: 16,
                                runSpacing: 8,
                                children: [
                                  for (final compliance in state.compliances)
                                    CmoTappable(
                                      onTap: ()  {
                                         _addAnswer(
                                          question,
                                          compliance,
                                        );
                                      },
                                      child: CmoCircelButton(
                                        title: '${compliance.complianceName}',
                                        color: answer != null &&
                                                answer.complianceId ==
                                                    compliance.complianceId
                                            ? context.colors.yellow
                                            : context.colors.white,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Row(
                              children: [
                                CmoTappable(
                                  onTap: () => _viewListPhoto(
                                    questionId: question.questionId,
                                  ),
                                  child: BlocSelector<AssessmentQuestionCubit,
                                      AssessmentQuestionState, bool>(
                                    selector: (state) => state.questionPhotos
                                        .where(
                                          (e) =>
                                              e.questionId == question.questionId,
                                        )
                                        .isNotBlank,
                                    builder: (context, havePhoto) =>
                                        CmoCircelIconButton(
                                      color: havePhoto
                                          ? context.colors.green
                                          : Colors.transparent,
                                      icon: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Assets.icons.icCamera.svgBlack,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                CmoTappable(
                                  onTap: () => _viewListComment(
                                    questionId: question.questionId,
                                  ),
                                  child: BlocSelector<AssessmentQuestionCubit,
                                      AssessmentQuestionState, bool>(
                                    selector: (state) => state.questionComments
                                        .where(
                                          (e) =>
                                              e.questionId == question.questionId,
                                        )
                                        .isNotBlank,
                                    builder: (context, haveComment) =>
                                        CmoCircelIconButton(
                                      color: haveComment
                                          ? context.colors.green
                                          : Colors.transparent,
                                      icon: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Assets.icons.icComment.svgBlack,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: context.colors.grey,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpeqssFilter extends StatelessWidget {
  const SpeqssFilter({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    const name = 'speqs';

    return BlocSelector<AssessmentQuestionCubit, AssessmentQuestionState,
        List<Speqs>>(
      selector: (state) {
        return state.speqss;
      },
      builder: (context, speqss) {
        return CmoDropdown(
          name: name,
          hintText: LocaleKeys.speqs.tr(),
          onChanged: (int? id) {
            if (id == -1) {
              formKey.currentState!.fields[name]?.reset();
            }
            context.read<AssessmentQuestionCubit>().setSpeqsFilter(id);
          },
          itemsData: speqss
              .map(
                (e) => CmoDropdownItem(
                  id: e.speqsId,
                  name: e.speqsName ?? '',
                ),
              )
              .toList()
            ..insert(
              0,
              CmoDropdownItem(
                id: -1,
                name: LocaleKeys.speqs.tr(),
              ),
            ),
        );
      },
    );
  }
}

class PdcaFilter extends StatelessWidget {
  const PdcaFilter({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;
  @override
  Widget build(BuildContext context) {
    const name = 'pdca';

    return BlocSelector<AssessmentQuestionCubit, AssessmentQuestionState,
        List<Pdca>>(
      selector: (state) {
        return state.pdcas;
      },
      builder: (context, pdcas) {
        return CmoDropdown(
          name: name,
          hintText: LocaleKeys.pdca.tr(),
          onChanged: (int? id) {
            if (id == -1) {
              formKey.currentState!.fields[name]?.reset();
            }
            context.read<AssessmentQuestionCubit>().setPdcaFilter(id);
          },
          itemsData: pdcas
              .map(
                (e) => CmoDropdownItem(
                  id: e.pdcaId,
                  name: e.pdcaName ?? '',
                ),
              )
              .toList()
            ..insert(
              0,
              CmoDropdownItem(
                id: -1,
                name: LocaleKeys.pdca.tr(),
              ),
            ),
        );
      },
    );
  }
}

class JobElementsFilter extends StatelessWidget {
  const JobElementsFilter({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    const name = 'JobElement';

    return BlocSelector<AssessmentQuestionCubit, AssessmentQuestionState,
        List<JobElement>>(
      selector: (state) {
        return state.jobElements;
      },
      builder: (context, jobElements) {
        return CmoDropdown(
          name: name,
          hintText: LocaleKeys.jobElement.tr(),
          onChanged: (int? id) {
            if (id == -1) {
              formKey.currentState!.fields[name]?.reset();
            }
            context.read<AssessmentQuestionCubit>().setJobElementFilter(id);
          },
          itemsData: jobElements
              .map(
                (e) => CmoDropdownItem(
                  id: e.jobElementId,
                  name: e.jobElementName ?? '',
                ),
              )
              .toList()
            ..insert(
              0,
              CmoDropdownItem(
                id: -1,
                name: LocaleKeys.jobElement.tr(),
              ),
            ),
        );
      },
    );
  }
}
