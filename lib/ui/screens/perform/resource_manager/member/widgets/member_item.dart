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
  final VoidCallback? onAudit;

  MemberItem({
    required this.farm,
    this.canDelete = false,
    this.onDelete,
    this.onAudit,
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
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Dismissible(
          key: Key(farm.id.toString()),
          direction: DismissDirection.startToEnd,
          confirmDismiss: (_) async {
            await onShowWarningDialog(
              context,
              title: LocaleKeys.audit.tr(),
              subtitle: LocaleKeys.audit_member_alert_content.tr(args: [farm.farmName ?? '']),
              barColor: context.colors.blue,
              icon: Icons.settings,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            LocaleKeys.close.tr(),
                            textAlign: TextAlign.center,
                            style: context.textStyles.bodyBold.copyWith(
                              color: context.colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          Navigator.of(context).pop();
                          onAudit?.call();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            LocaleKeys.audit_now.tr(),
                            textAlign: TextAlign.center,
                            style: context.textStyles.bodyBold.copyWith(
                              color: context.colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );

            return null;
          },
          background: Container(
            color: context.colors.blue,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.icAuditFromMember.svg(),
                Text(
                  LocaleKeys.audit.tr(),
                  style: context.textStyles.bodyBold.white,
                ),
              ],
            ),
          ),
          child: child,
        ),
      );
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