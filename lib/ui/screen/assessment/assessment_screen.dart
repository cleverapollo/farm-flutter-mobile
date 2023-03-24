import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/assessment_list_cubit/assessment_list_cubit.dart';

class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AssessmentScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.assessments.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AssessmentAddScreen.push(context),
      ),
      body: Column(
        children: [
          Row(),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: BlocSelector<AssessmentListCubit, AssessmentListState, int>(
              selector: (state) {
                return state.indexTab;
              },
              builder: (context, indexTab) {
                return Row(
                  children: [
                    Expanded(
                      child: CmoFilledButton(
                        onTap: () {
                          context.read<AssessmentListCubit>().changeIndexTab(0);
                        },
                        disable: indexTab != 0,
                        title: LocaleKeys.started.tr().toUpperCase(),
                        titleStyle: context.textStyles.bodyBold.white
                            .copyWith(fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: CmoFilledButton(
                        onTap: () {
                          context.read<AssessmentListCubit>().changeIndexTab(1);
                        },
                        disable: indexTab != 1,
                        title: LocaleKeys.completed.tr().toUpperCase(),
                        titleStyle: context.textStyles.bodyBold.white
                            .copyWith(fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: CmoFilledButton(
                        onTap: () {
                          context.read<AssessmentListCubit>().changeIndexTab(2);
                        },
                        disable: indexTab != 2,
                        title: LocaleKeys.synced.tr().toUpperCase(),
                        titleStyle: context.textStyles.bodyBold.white
                            .copyWith(fontSize: 12),
                      ),
                    ),
                  ].withSpaceBetween(width: 8),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocSelector<AssessmentListCubit, AssessmentListState, int>(
              selector: (state) {
                return state.indexTab;
              },
              
              builder: (context, indexTab) {
                if (indexTab == 0) return const AssessmentListStarted();
                if (indexTab == 1) return const AssessmentListCompleted();
                if (indexTab == 2) return const AssessmentListSynced();

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
