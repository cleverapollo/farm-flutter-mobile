import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_membership_contract_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'expandable_item_widget.dart';

class FarmMemberObjectivesWidget extends StatefulWidget {
  const FarmMemberObjectivesWidget();

  @override
  State<StatefulWidget> createState() => _FarmMemberObjectivesWidgetState();
}

class _FarmMemberObjectivesWidgetState
    extends State<FarmMemberObjectivesWidget> {
  bool isCollapse = true;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState,
        FarmMemberObjectivesState>(
      selector: (state) => state.farmMemberObjectivesState,
      builder: (context, FarmMemberObjectivesState farmMemberObjectivesState) {
        return ExpandableItemWidget(
          showTick: farmMemberObjectivesState.isComplete,
          title: LocaleKeys.member_farm_objectives.tr(),
          isCollapse: isCollapse,
          onTap: () => setState(() {
            isCollapse = !isCollapse;
          }),
          child: Container(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              color: Colors.white,
              child: Column(
                children: [
                  ...farmMemberObjectivesState.listFarmMemberObjectives.map(
                    (question) => FarmMemberObjectiveQuestionWidget(
                      farmMemberObjective: question,
                      listFarmObjectiveOptions:
                          farmMemberObjectivesState.listFarmObjectiveOptions,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CmoFilledButton(
                        title: LocaleKeys.finalise_later.tr(),
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      BlocSelector<AddMemberCubit, AddMemberState,
                          AddMemberState>(
                        selector: (state) => state,
                        builder: (context, state) {
                          return CmoFilledButton(
                            title: LocaleKeys.next.tr(),
                            onTap: () {
                              if (state.addMemberMDetails.isComplete) {
                                AddMemberMembershipContractScreen.push(
                                  context,
                                  farm:
                                      context.read<AddMemberCubit>().state.farm,
                                );
                              } else {
                                context
                                    .read<AddMemberCubit>()
                                    .checkErrorAllSteps();
                                showSnackError(
                                    msg: 'Should complete all steps.');
                              }
                            },
                          );
                        },
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}

class FarmMemberObjectiveQuestionWidget extends StatefulWidget {
  final FarmMemberObjective farmMemberObjective;
  final List<FarmObjectiveOption> listFarmObjectiveOptions;

  @override
  State<FarmMemberObjectiveQuestionWidget> createState() =>
      _FarmMemberObjectiveQuestionWidgetState();

  FarmMemberObjectiveQuestionWidget({
    required this.farmMemberObjective,
    required this.listFarmObjectiveOptions,
  });
}

class _FarmMemberObjectiveQuestionWidgetState
    extends State<FarmMemberObjectiveQuestionWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 12),
          child: Text(
            widget.farmMemberObjective.farmMemberObjectiveName ?? '',
            style: context.textStyles.bodyBold.copyWith(
              color: context.colors.black,
              fontSize: 16,
            ),
          ),
        ),
        selectOption(),
      ],
    );
  }

  Widget selectOption() {
    return BlocSelector<AddMemberCubit, AddMemberState,
        FarmMemberObjectivesState>(
      selector: (state) {
        return state.farmMemberObjectivesState;
      },
      builder: (context, farmMemberObjectivesState) {
        return InkWell(
          onTap: () async {
            await showCustomBottomSheet(
              context,
              content: ListView.builder(
                itemCount:
                    farmMemberObjectivesState.listFarmObjectiveOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      await context
                          .read<AddMemberCubit>()
                          .onAnswerFarmMemberObjective(
                            question: widget.farmMemberObjective,
                            option: farmMemberObjectivesState
                                .listFarmObjectiveOptions[index],
                          );

                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        farmMemberObjectivesState
                                .listFarmObjectiveOptions[index]
                                .farmObjectiveOptionName ??
                            '',
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: context.colors.grey),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    farmMemberObjectivesState.getFarmMemberObjectiveAnswerTitle(
                      widget.farmMemberObjective.farmMemberObjectiveId,
                    ),
                    style: context.textStyles.bodyNormal.black,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: context.colors.black,
                  size: 40,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
