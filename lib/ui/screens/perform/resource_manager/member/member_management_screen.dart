import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/add_member_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_status_filter.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/member_item.dart';

class MemberManagementScreen extends BaseStatefulWidget {
  MemberManagementScreen({super.key}) : super(screenName: LocaleKeys.memberManagement.tr());

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
  Timer? _searchDebounce;

  Future<void> onRemoveFarm(Farm farm) async {
    await context.read<MemberManagementCubit>().onRemoveFarm(farm);
    await context.read<DashboardCubit>().getResourceManagerMembers();
  }

  Future<void> onNavigateToDetail({
    Farm? farm,
  }) async {
    await AddMemberScreen.push(context, farm: farm);
    await context.read<MemberManagementCubit>().reload();
    await context.read<DashboardCubit>().getResourceManagerMembers();
  }

  @override
  Widget build(BuildContext context) {
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
          body: BlocSelector<MemberManagementCubit, MemberManagementState,
              List<Farm>>(
            selector: (state) => state.filteringFarms,
            builder: (context, filteringFarms) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  const MemberStatusFilter(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                    child: CmoTextField(
                      name: LocaleKeys.search.tr(),
                      prefixIcon: Assets.icons.icSearch.svg(),
                      hintText: LocaleKeys.search.tr(),
                      onChanged: (searchText) {
                        _searchDebounce?.cancel();
                        _searchDebounce = Timer(
                          const Duration(milliseconds: 300),
                          () {
                            context
                                .read<MemberManagementCubit>()
                                .onSearchTextChanged(searchText);
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<MemberManagementCubit, MemberManagementState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return ListView.separated(
                          itemCount: filteringFarms.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 20),
                          itemBuilder: (_, index) {
                            final farm = filteringFarms[index];
                            return InkWell(
                              onTap: () => onNavigateToDetail(farm: farm),
                              child: MemberItem(
                                farm: farm,
                                canDelete: state.isInCompleteSelected,
                                onDelete: () => onRemoveFarm(farm),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
