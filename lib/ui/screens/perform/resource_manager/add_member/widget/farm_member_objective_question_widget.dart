import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'farm_member_objective_options.dart';

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
            style: context.textStyles.bodyNormal.copyWith(
              color: context.colors.black,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 12,),
        selectOption(),
        const SizedBox(height: 10,),
        Divider(
          height: 1,
          thickness: 1,
          color: context.colors.blueDark2,
        ),
      ],
    );
  }

  Widget selectOption() {
    return BlocSelector<AddMemberCubit, AddMemberState, FarmMemberObjectivesState>(
      selector: (state) {
        return state.farmMemberObjectivesState;
      },
      builder: (context, farmMemberObjectivesState) {
        return FarmMemberObjectiveOptions(
          farmObjectiveOption: farmMemberObjectivesState.listFarmObjectiveOptions,
          initFarmMemberObjectiveOptionId: farmMemberObjectivesState
              .getFarmMemberObjectiveAnswer(
                widget.farmMemberObjective.farmMemberObjectiveId,
              )
              ?.farmObjectiveOptionId,
          onTap: (farmObjectiveOptionId) async {
            await context.read<AddMemberCubit>().onAnswerFarmMemberObjective(
                  question: widget.farmMemberObjective,
                  farmObjectiveOptionId: farmObjectiveOptionId,
                );
          },
        );
      },
    );
  }
}
