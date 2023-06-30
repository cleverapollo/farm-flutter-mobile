import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberManagementScreen extends StatefulWidget {
  const MemberManagementScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (BuildContext context) => MemberManagementCubit()..init(),
            child: const MemberManagementScreen(),
          );
        },
      ),
    );
  }

  @override
  State<MemberManagementScreen> createState() => _MemberManagementScreenState();
}

class _MemberManagementScreenState extends State<MemberManagementScreen>
    with RouteAware, TickerProviderStateMixin {
  Timer? _searchDebounce;

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: BlocSelector<MemberManagementCubit, MemberManagementState,
          ResourceManagerUnit?>(
        selector: (state) => state.resourceManagerUnit,
        builder: (context, resourceManagerUnit) => Scaffold(
          appBar: CmoAppBarV2(
            title: LocaleKeys.memberManagement.tr(),
            subtitle:
                '${LocaleKeys.rmu_name.tr()}: ${resourceManagerUnit?.regionalManagerUnitName}',
            showLeading: true,
            showTrailing: true,
            trailing: Assets.icons.icAdd.svgBlack,
            onTapTrailing: () async {
              await AddMemberScreen.push(context);
              context.read<MemberManagementCubit>().reload();
            },
          ),
          body: BlocSelector<MemberManagementCubit, MemberManagementState,
              List<Farm>>(
            selector: (state) => state.filteringFarms,
            builder: (context, filteringFarms) {
              return Column(
                children: [
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
                  Row(
                    children: [
                      const Spacer(),
                      BlocSelector<MemberManagementCubit, MemberManagementState,
                          bool>(
                        selector: (state) => state.isInCompleteSelected,
                        builder: (context, isInCompleteSelected) {
                          return CmoFilledButton(
                            onTap: () {
                              context
                                  .read<MemberManagementCubit>()
                                  .onFilterGroupChanged(true);
                            },
                            disable: !isInCompleteSelected,
                            title: LocaleKeys.incomplete.tr(),
                            titleStyle: context.textStyles.bodyBold.white
                                .copyWith(fontSize: 12),
                          );
                        },
                      ),
                      const SizedBox(width: 12),
                      BlocSelector<MemberManagementCubit, MemberManagementState,
                          bool>(
                        selector: (state) => state.isInCompleteSelected,
                        builder: (context, isInCompleteSelected) {
                          return CmoFilledButton(
                            onTap: () {
                              context
                                  .read<MemberManagementCubit>()
                                  .onFilterGroupChanged(false);
                            },
                            disable: isInCompleteSelected,
                            title: LocaleKeys.members.tr(),
                            titleStyle: context.textStyles.bodyBold.white
                                .copyWith(fontSize: 12),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: filteringFarms.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 20),
                      itemBuilder: (_, index) {
                        final farm = filteringFarms[index];
                        return CmoCard(
                          margin: const EdgeInsets.symmetric(horizontal: 23),
                          content: [
                            CmoCardHeader(title: farm.farmName ?? ''),
                            CmoCardHeader(
                                title:
                                    '${farm.firstName ?? ''} ${farm.lastName ?? ''}'),
                            SizedBox(
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      farm.isGroupSchemeMember == true
                                          ? LocaleKeys.onboarded.tr()
                                          : LocaleKeys.incomplete.tr(),
                                      textAlign: TextAlign.start,
                                      style:
                                          context.textStyles.bodyNormal.white,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Flexible(
                                    child: Align(child: buildBottom(farm)),
                                  ),
                                ],
                              ),
                            ),
                          ],
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

  Widget buildBottom(Farm farm) {
    return farm.isGroupSchemeMember == true
        ? Assets.icons.icTick.widget
        : Text(
            '${farm.stepCount}/10',
            style: context.textStyles.bodyNormal.white,
          );
  }
}
