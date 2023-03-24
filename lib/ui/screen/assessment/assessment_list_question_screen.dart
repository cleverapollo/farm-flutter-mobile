import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AssessmentQuestionCubit>().state;
    final assessment = context.watch<AssessmentQuestionCubit>().getAssessment();
    final allQuestions =
        context.watch<AssessmentQuestionCubit>().getAllQuestions();

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 32),
            child: Row(
              children: [
                Expanded(
                  child: CmoDropdown(
                    name: 'speqs',
                    hintText: LocaleKeys.speqs.tr(),
                  ),
                ),
                Expanded(
                  child: CmoDropdown(
                    name: 'pdca',
                    hintText: LocaleKeys.pdca.tr(),
                  ),
                ),
                Expanded(
                  child: CmoDropdown(
                    name: 'JobElement',
                    hintText: LocaleKeys.jobElement.tr(),
                  ),
                ),
              ].withSpaceBetween(width: 4),
            ),
          ),
          CmoHeaderTile(
            title: LocaleKeys.incomplete.tr(),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Assets.icons.icTick.svg(),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.icons.icCamera.svgWhite,
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          '4/57',
                          style: context.textStyles.bodyBold.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '4/57',
                  style: context.textStyles.bodyBold.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: allQuestions.length,
              itemBuilder: (context, index) {
                final question = allQuestions[index];
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
                                  CmoCircelButton(
                                    title: '${compliance.complianceName}',
                                    // color: context.colors.yellow,
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              CmoCircelIconButton(
                                icon: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Assets.icons.icCamera.svgBlack,
                                ),
                              ),
                              const SizedBox(width: 16),
                              CmoCircelIconButton(
                                icon: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Assets.icons.icComment.svgBlack,
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
        ],
      ),
    );
  }
}
