import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MemberItem extends StatelessWidget {

  final Farm farm;
  final bool canDelete;
  final VoidCallback? onDelete;

  MemberItem({
    required this.farm,
    this.canDelete = false,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isOnboarded = farm.isGroupSchemeMember;
    final child = CmoCard(
      margin: const EdgeInsets.symmetric(horizontal: 23),
      content: [
        CmoCardHeader(title: farm.farmName ?? ''),
        CmoCardHeader(
          title: '${farm.firstName ?? ''} ${farm.lastName ?? ''}',
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              Flexible(
                child: Text(
                  isOnboarded
                      ? LocaleKeys.onboarded.tr()
                      : LocaleKeys.incomplete.tr(),
                  textAlign: TextAlign.start,
                  style: context.textStyles.bodyNormal.white,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Align(
                  child: isOnboarded
                      ? Assets.icons.icTick.widget
                      : BlocBuilder<MemberManagementCubit, MemberManagementState>(
                          builder: (context, state) {
                            final stepCount = farm.numberStepComplete(
                              allFarmMemberObjectiveAnswers: state.allFarmMemberObjectiveAnswers,
                              allFarmMemberObjectives: state.allFarmMemberObjectives,
                              allFarmMemberRiskProfileAnswers: state.allFarmMemberRiskProfileAnswers,
                              allRiskProfileQuestions: state.allRiskProfileQuestions,
                            );

                            return Text(
                              '$stepCount/${Constants.MAX_FARM_STEPS}',
                              style: context.textStyles.bodyNormal.white,
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (!canDelete) {
      return child;
    }

    return Slidable(
      key: Key(farm.id.toString()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onDelete?.call(),
            padding: EdgeInsets.zero,
            backgroundColor: context.colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: LocaleKeys.remove.tr(),
          ),
        ],
      ),
      child: child,
    );
  }
}