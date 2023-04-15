import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/state/assessment_cubit/assessment_cubit.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/screen/entity/widgets/entity_company_tile.dart';
import 'package:cmo/ui/screens/dashboard_based.dart';
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

class _EntityBehaveScreenState extends State<EntityBehaveScreen> {
  bool isReady = false;
  bool loading = false;

  List<Company> companies = [];
  String prevQuery = '';
  Company? selected;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final entityCubit = context.read<EntityCubit>();
      final userId = context.read<UserInfoCubit>().data?.userId;

      await entityCubit.getCompanies(context: context, userId: userId);

      if (context.mounted) {
        final entityState = context.read<EntityCubit>().state;
        setState(() {
          isReady = true;
          companies = entityState.companies;
          selected = entityState.company;
        });
      }
    });
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

  Future<void> submit() async {
    if (selected == null) return;
    if (loading == true) return;

    try {
      setState(() => loading = true);
      context.read<AssessmentCubit>().cleanCache();

      await context.read<UserDeviceCubit>().createUserDevice(context);

      if (context.mounted) {
        await context.read<EntityCubit>().syncBehave(
              context: context,
              company: selected!,
              userDeviceId: context.read<UserDeviceCubit>().data?.userDeviceId,
            );
      }

      if (context.mounted) DashboardScreen.push(context);
    } finally {
      setState(() => loading = false);
    }
  }

  void onTapTile(Company company) {
    setState(() => selected = company);
  }

  bool isSelected(Company company) {
    if (selected == null) return false;
    return company.companyId == selected?.companyId;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
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
                  name: 'SearchEntity',
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
                child: CmoFilledButton(
                  title: LocaleKeys.sync.tr(),
                  loading: loading,
                  onTap: submit,
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

    return ListView.builder(
      itemCount: companies.length,
      itemBuilder: (BuildContext context, int index) {
        final e = companies[index];
        return CmoTappable(
          onTap: () => onTapTile(e),
          child: EntityCompanyTile(
            title: e.companyName ?? e.companyId.toString(),
            selected: isSelected(e),
          ),
        );
      },
    );
  }
}
