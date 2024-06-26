import 'dart:async';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/add_audit/audit_add_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/add_member_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_detail_map_view.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_list_view.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_map_view.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_status_filter.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberManagementScreen extends BaseStatefulWidget {
  MemberManagementScreen({super.key})
      : super(screenName: LocaleKeys.memberManagement.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (BuildContext context) => MemberManagementCubit(),
            child: MemberManagementScreen(),
          );
        },
      ),
    );
  }

  @override
  State<MemberManagementScreen> createState() => _MemberManagementScreenState();
}

class _MemberManagementScreenState extends BaseStatefulWidgetState<MemberManagementScreen> {

  Future<void> onRemoveFarm(Farm farm) async {
    await context.read<MemberManagementCubit>().onRemoveFarm(farm);
    await context.read<DashboardCubit>().getResourceManagerMembers();
  }

  void onAudit(Farm farm) {
    AuditAddScreen.push(
      context,
      AuditComeFromEnum.menu,
      selectedFarm: farm,
    );
  }

  Future<void> onNavigateToDetail({
    Farm? farm,
  }) async {
    await AddMemberScreen.push(context, farm: farm);
    await context.read<MemberManagementCubit>().refresh();
    await context.read<DashboardCubit>().getResourceManagerMembers();
  }

  @override
  Widget buildContent(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: BlocSelector<MemberManagementCubit, MemberManagementState,
          ResourceManagerUnit?>(
        selector: (state) => state.activeRMU,
        builder: (context, resourceManagerUnit) => Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.memberManagement.tr(),
            subtitle:
                '${LocaleKeys.rmu_name.tr()}: ${resourceManagerUnit?.regionalManagerUnitName}',
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icUpdatedAddButton.svgBlack,
            onTapTrailing: onNavigateToDetail,
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              const MemberStatusFilter(),
              const SizedBox(height: 12),
              Expanded(
                child: BlocSelector<MemberManagementCubit,
                    MemberManagementState, MemberManagementStatusFilter>(
                  selector: (state) => state.statusFilter,
                  builder: (context, statusFilter) {
                    switch (statusFilter) {
                      case MemberManagementStatusFilter.incomplete:
                        return MembersListView(
                          shouldShowSearchField: false,
                          onNavigateToDetail: (farm) => onNavigateToDetail(farm: farm),
                          onRemoveFarm: onRemoveFarm,
                        );
                      case MemberManagementStatusFilter.complete:
                        return completedMemberContent();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget completedMemberContent() {
    return BlocBuilder<MemberManagementCubit, MemberManagementState>(
      builder: (context, state) {
        switch (state.viewMode) {
          case MemberManagementViewMode.listView:
            return MembersListView(
              onNavigateToDetail: (farm) => onNavigateToDetail(farm: farm),
              onRemoveFarm: onRemoveFarm,
              onAudit: onAudit,
            );
          case MemberManagementViewMode.mapView:
            return const MemberMapView();
          case MemberManagementViewMode.mapDetailView:
            if (state.selectedFarm == null) return const SizedBox.shrink();
            return BlocProvider(
              create: (_) => MemberDetailMapViewCubit(state.selectedFarm),
              child: MemberDetailMapView(
                state.selectedFarm!,
                onChangeViewMode: context.read<MemberManagementCubit>().onChangeViewMode,
                onNavigateToDetail: () => onNavigateToDetail(farm: state.selectedFarm),
              ),
            );
        }
      },
    );
  }
}
