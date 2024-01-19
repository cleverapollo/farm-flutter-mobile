import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/widget/farm_member_objective_question_widget.dart';

class MemberObjectivesSection extends StatefulWidget {
  const MemberObjectivesSection({super.key});

  @override
  State<StatefulWidget> createState() => _MemberObjectivesSectionState();
}

class _MemberObjectivesSectionState extends State<MemberObjectivesSection> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<MemberDetailCubit, MemberDetailState,
        FarmMemberObjectivesState>(
      selector: (state) => state.farmMemberObjectivesState,
      builder: (context, FarmMemberObjectivesState farmMemberObjectivesState) {
        return ExpandableItemWidget(
          showTick: farmMemberObjectivesState.isComplete,
          title: LocaleKeys.member_farm_objectives.tr(),
          isCollapse: farmMemberObjectivesState.isSectionCollapse,
          onTap:
              context.read<MemberDetailCubit>().onChangeMemberFarmObjectiveState,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
