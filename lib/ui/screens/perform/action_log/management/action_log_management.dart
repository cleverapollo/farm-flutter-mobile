import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/state.dart';
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
    // await AddMemberScreen.push(context, farm: farm);
    // await context.read<MemberManagementCubit>().refresh();
    // await context.read<DashboardCubit>().getResourceManagerMembers();
  }

  @override
  Widget buildContent(BuildContext context) {
    return BlocSelector<ActionLogManagementCubit, ActionLogManagementState, ResourceManagerUnit?>(
      selector: (state) => state.activeRMU,
      builder: (context, resourceManagerUnit) => Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.action_log.tr(),
          subtitle: resourceManagerUnit?.regionalManagerUnitName,
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedAddButton.svgBlack,
          onTapTrailing: onNavigateToDetail,
        ),
        body: Column(
          children: [
            const ActionLogStatusFilter(),
            const SizedBox(height: 12),
            // Expanded(
            //   child: BlocSelector<MemberManagementCubit, MemberManagementState, MemberManagementStatusFilter>(
            //     selector: (state) => state.statusFilter,
            //     builder: (context, statusFilter) {
            //       switch (statusFilter) {
            //         case MemberManagementStatusFilter.incomplete:
            //           return MembersListView(
            //             shouldShowSearchField: false,
            //             onNavigateToDetail: (farm) =>
            //                 onNavigateToDetail(farm: farm),
            //             onRemoveFarm: onRemoveFarm,
            //           );
            //         case MemberManagementStatusFilter.complete:
            //           return completedMemberContent();
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
