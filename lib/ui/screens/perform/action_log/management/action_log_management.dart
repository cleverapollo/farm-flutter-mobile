import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/model/user/user_role.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/action_log/detail/action_log_detail.dart';
import 'package:cmo/ui/screens/perform/action_log/widgets/action_log_item.dart';
import 'package:cmo/ui/screens/perform/action_log/widgets/action_log_status_filter.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionLogManagement extends BaseStatefulWidget {
  const ActionLogManagement() : super(screenName: 'ActionLogManagement');

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => ActionLogManagementCubit(),
            child: const ActionLogManagement(),
          );
        },
      ),
    );
  }

  @override
  _ActionLogManagementState createState() => _ActionLogManagementState();
}

class _ActionLogManagementState extends BaseStatefulWidgetState<ActionLogManagement> {

  Future<void> onRemoveFarm() async {
    // await context.read<MemberManagementCubit>().onRemoveFarm(farm);
    // await context.read<DashboardCubit>().getResourceManagerMembers();
  }

  void onAudit() {
    // AuditAddScreen.push(
    //   context,
    //   AuditComeFromEnum.menu,
    //   selectedFarm: farm,
    // );
  }

  Future<void> onNavigateToDetail() async {
    await ActionLogDetail.push(context);
    // await context.read<MemberManagementCubit>().refresh();
    // await context.read<DashboardCubit>().getResourceManagerMembers();
  }

  @override
  Widget buildContent(BuildContext context) {
    return BlocBuilder<ActionLogManagementCubit, ActionLogManagementState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.action_log.tr(),
            subtitle: state.activeRMU?.regionalManagerUnitName,
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: state.activeUserRole == UserRoleEnum.farmerMember
                ? null
                : Assets.icons.icUpdatedAddButton.svgBlack,
            onTapTrailing: onNavigateToDetail,
          ),
          body: Column(
            children: [
              const ActionLogStatusFilter(),
              const SizedBox(height: 12),
              Expanded(
                child: BlocBuilder<ActionLogManagementCubit, ActionLogManagementState>(
                  builder: (context, state) {
                    var displayList = <ActionLog>[];
                    switch (state.statusFilter) {
                      case ActionLogStatusFilterEnum.open:
                        displayList = state.openActions;
                        break;
                      case ActionLogStatusFilterEnum.closed:
                        displayList = state.closedActions;
                        break;
                      default:
                        return const SizedBox.shrink();
                    }

                    return ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) {
                        return ActionLogItem(
                          actionLog: displayList[index],
                          mapData: generateInformationMapData(
                            displayList[index],
                          ),

                          onClose: (displayList[index].isClosed ?? false) ? null : () {

                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Map<String, String?> generateInformationMapData(ActionLog actionLog) {
    return {
      LocaleKeys.farm.tr(): '',
      LocaleKeys.action_name.tr(): actionLog.actionName,
      LocaleKeys.nc_reason.tr(): actionLog.rejectReasonName,
      LocaleKeys.raised_by.tr(): actionLog.raisedByName,
      LocaleKeys.due_date.tr(): convertDateTimeToLunarString(actionLog.dueDate),
    };
  }
}
