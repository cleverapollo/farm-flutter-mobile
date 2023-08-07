import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_membership_contract_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widget/expandable_item_widget.dart';
import 'farm_member_objective_question_widget.dart';

class FarmMemberObjectivesWidget extends StatefulWidget {
  const FarmMemberObjectivesWidget();

  @override
  State<StatefulWidget> createState() => _FarmMemberObjectivesWidgetState();
}

class _FarmMemberObjectivesWidgetState
    extends State<FarmMemberObjectivesWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState,
        FarmMemberObjectivesState>(
      selector: (state) => state.farmMemberObjectivesState,
      builder: (context, FarmMemberObjectivesState farmMemberObjectivesState) {
        return ExpandableItemWidget(
          showTick: farmMemberObjectivesState.isComplete,
          title: LocaleKeys.member_farm_objectives.tr(),
          isCollapse: farmMemberObjectivesState.isSectionCollapse,
          onTap: context.read<AddMemberCubit>().onChangeMemberFarmObjectiveState,
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
              ),
          ),
        );
      },
    );
  }
}

