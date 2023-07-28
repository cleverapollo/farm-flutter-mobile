import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocSelector<AddMemberCubit, AddMemberState, FarmMemberObjectivesState>(
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
