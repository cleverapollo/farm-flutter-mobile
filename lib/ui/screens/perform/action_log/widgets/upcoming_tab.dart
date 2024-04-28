import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/setting_config/setting_config.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/custom_icon_slidable_action.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum UpcomingTabStatus { overdue, due, upcoming }

class UpcomingTab extends StatelessWidget {
  final void Function(ActionLog) onNavigateToDetail;
  final void Function(ActionLog) onClose;
  final SettingConfig settingConfig;

  UpcomingTab({
    required this.onNavigateToDetail,
    required this.settingConfig,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionLogManagementCubit, ActionLogManagementState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: state.overdueActionLogs
                    .map(
                      (actionLog) => UpcomingTabActionLogItem(
                        settingConfig: settingConfig,
                        actionLog: actionLog,
                        upcomingTabStatus: UpcomingTabStatus.overdue,
                        onTap: () => onNavigateToDetail(actionLog),
                        onClose: () => onClose(actionLog),
                      ),
                    )
                    .toList() +
                state.dueActionLogs
                    .map(
                      (actionLog) => UpcomingTabActionLogItem(
                        settingConfig: settingConfig,
                        actionLog: actionLog,
                        upcomingTabStatus: UpcomingTabStatus.due,
                        onTap: () => onNavigateToDetail(actionLog),
                        onClose: () => onClose(actionLog),
                      ),
                    )
                    .toList() +
                state.upcomingActionLogs
                    .map(
                      (actionLog) => UpcomingTabActionLogItem(
                        settingConfig: settingConfig,
                        actionLog: actionLog,
                        upcomingTabStatus: UpcomingTabStatus.upcoming,
                        onTap: () => onNavigateToDetail(actionLog),
                        onClose: () => onClose(actionLog),
                      ),
                    )
                    .toList(),
          ),
        );
      },
    );
  }
}

class UpcomingTabActionLogItem extends StatelessWidget {
  final UpcomingTabStatus upcomingTabStatus;
  final ActionLog actionLog;
  final SettingConfig settingConfig;
  final void Function() onTap;
  final void Function() onClose;

  const UpcomingTabActionLogItem({
    required this.upcomingTabStatus,
    required this.actionLog,
    required this.settingConfig,
    required this.onTap,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(actionLog.actionLogId.toString()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          CustomIconSlidableAction(
            onPressed: (_) => onClose.call(),
            padding: EdgeInsets.zero,
            backgroundColor: context.colors.blue,
            foregroundColor: context.colors.white,
            icon: Assets.icons.icActionLogClose.svg(),
            label: LocaleKeys.close.tr(),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              buildTitleWidget(context),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                color: context.colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.farm.tr(),
                      style: context.textStyles.bodyNormal.blueDark2,
                    ),
                    Expanded(
                      child: Text(
                        actionLog.farmName ?? '',
                        textAlign: TextAlign.right,
                        style: context.textStyles.bodyNormal.blueDark2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: context.colors.greyLight1,
                ),
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.action_name.tr(),
                      style: context.textStyles.bodyBold.blueDark2,
                    ),
                    Text(
                      actionLog.actionName ?? '',
                      style: context.textStyles.bodyNormal.blueDark2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleWidget(BuildContext context) {
    final date = settingConfig.dateFormatEnum.displayFormat(actionLog.dueDate);
    switch (upcomingTabStatus) {
      case UpcomingTabStatus.overdue:
      case UpcomingTabStatus.upcoming:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            color: upcomingTabStatus == UpcomingTabStatus.overdue
                ? context.colors.blueDark2
                : context.colors.blue,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${upcomingTabStatus == UpcomingTabStatus.overdue ? LocaleKeys.overdue.tr() : LocaleKeys.upcoming.tr()}: $date',
                  style: context.textStyles.bodyBold.white,
                ),
              ),
            ],
          ),
        );
      case UpcomingTabStatus.due:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.blueDark2),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            color: context.colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${LocaleKeys.due.tr()}: $date',
                  style: context.textStyles.bodyBold.blueDark2,
                ),
              ),
            ],
          ),
        );
    }
  }
}
