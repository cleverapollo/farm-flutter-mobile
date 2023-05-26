import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
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

class _MemberManagementScreenState extends State<MemberManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CmoTappable(
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
            ),
            body: BlocSelector<MemberManagementCubit, MemberManagementState,
                List<Farm>>(
              selector: (state) => state.farms,
              builder: (context, allFarms) {
                // TODO: Need to do filter here
                final farms = allFarms;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                      child: CmoTextField(
                        name: LocaleKeys.search.tr(),
                        prefixIcon: Assets.icons.icSearch.svg(),
                        hintText: LocaleKeys.search.tr(),
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CmoFilledButton(
                          onTap: () {},
                          disable: false,
                          title: LocaleKeys.incomplete.tr(),
                          titleStyle: context.textStyles.bodyBold.white
                              .copyWith(fontSize: 12),
                        ),
                        const SizedBox(width: 12),
                        CmoFilledButton(
                          onTap: () {},
                          disable: true,
                          title: LocaleKeys.members.tr(),
                          titleStyle: context.textStyles.bodyBold.white
                              .copyWith(fontSize: 12),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        itemCount: farms.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 20),
                        itemBuilder: (_, index) {
                          final farm = farms[index];
                          return CmoCard(
                            margin: const EdgeInsets.symmetric(horizontal: 23),
                            content: [
                              CmoCardHeader(title: farm.farmName ?? ''),
                              CmoCardHeader(
                                  title: '${farm.firstName} ${farm.lastName}'),
                              CmoCardItem(
                                title: farm.isProspectMember == true
                                    ? LocaleKeys.onboarded.tr()
                                    : LocaleKeys.incomplete.tr(),
                                value: '',
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
      ),
    );
  }
}
