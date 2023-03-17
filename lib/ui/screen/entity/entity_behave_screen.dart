import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/screen/dashboard/dashboard_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntityBehaveScreen extends StatefulWidget {
  const EntityBehaveScreen({
    super.key,
  });

  static dynamic push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const EntityBehaveScreen(),
      ),
    );
  }

  @override
  State<EntityBehaveScreen> createState() => _EntityBehaveScreenState();
}

class _EntityBehaveScreenState extends State<EntityBehaveScreen>
    with AfterLayoutMixin {
  bool isReady = false;

  List<Company> companies = [];

  String prevQuery = '';

  Company? selected;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    final entityCubit = context.read<EntityCubit>();
    final userId = context.read<UserInfoCubit>().state.join(
          (p0) => null,
          (p0) => p0.userInfo?.userId,
          (p0) => null,
        );

    await entityCubit.getCompanies(context: context, userId: userId);
    if (context.mounted) {
      final newEntityCubit = context.read<EntityCubit>();
      setState(() {
        companies = newEntityCubit.state.companies;
        selected = newEntityCubit.state.company;
        isReady = true;
      });
    }
  }

  void filter(String? input) {
    if (input == null) return;
    final query = input.trim().toLowerCase();
    if (query == prevQuery) return;

    final entityCubit = context.read<EntityCubit>();
    companies = entityCubit.state.companies
        .where((e) => e.companyName?.toLowerCase().contains(query) ?? false)
        .toList();
    setState(() {});
    prevQuery = query;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: CmoTappable(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.entity.tr(),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: CmoTextField(
                  name: 'search_entity',
                  prefixIcon: Assets.icons.icSearch.svg(),
                  hintText: LocaleKeys.search.tr(),
                  onChanged: filter,
                ),
              ),
              Expanded(child: buildNameList()),
              BlocSelector<EntityCubit, EntityState, String?>(
                selector: (state) {
                  return state.syncMessage;
                },
                builder: (context, state) {
                  return Text(state ?? '');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: BlocSelector<EntityCubit, EntityState, bool>(
                  selector: (state) {
                    return state.isLoadingSync;
                  },
                  builder: (context, state) {
                    return CmoFilledButton(
                      title: LocaleKeys.sync.tr(),
                      loading: state,
                      onTap: selected != null
                          ? () async {
                              await context.read<EntityCubit>().syncBehave(
                                    context: context,
                                    company: selected!,
                                    userDeviceId: context
                                        .read<UserDeviceCubit>()
                                        .state
                                        .join(
                                          (p0) => null,
                                          (p0) => p0.userDevice?.userDeviceId,
                                          (p0) => null,
                                        ),
                                  );
                              if (context.mounted) {
                                DashboardScreen.push(context);
                              }
                            }
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameList() {
    if (!isReady) {
      return Center(
        child: CircularProgressIndicator(
          color: context.colors.blue,
        ),
      );
    }

    if (companies.isEmpty) {
      return Text('None', style: context.textStyles.bodyNormal);
    }

    void onTapTile(Company company) {
      setState(() {
        selected = company;
      });
    }

    bool isSelected(Company company) {
      if (selected == null) return false;
      return company.companyId == selected?.companyId;
    }

    return ListView(
      children: companies
          .map(
            (e) => CmoTappable(
              onTap: () => onTapTile(e),
              child: _ResultTile(
                title: e.companyName ?? e.companyId.toString(),
                selected: isSelected(e),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ResultTile extends StatelessWidget {
  const _ResultTile({
    required this.title,
    this.selected = false,
  });

  final String title;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: Row(
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: Text(
                  title,
                  style: context.textStyles.bodyNormal,
                ),
              ),
              if (selected) Assets.icons.icTick.svg(),
              if (selected) const SizedBox(width: 24),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          indent: 24,
          endIndent: 24,
          color: context.colors.blueDark2,
        ),
      ],
    );
  }
}
