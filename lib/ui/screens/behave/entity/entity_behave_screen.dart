import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/enum/user_role_enum.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/model/user_role_config/user_role_config.dart';
import 'package:cmo/state/assessment_cubit/assessment_cubit.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/screens/cmo_dashboard_base.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntityBehaveScreen extends StatefulWidget {
  final void Function(Company)? onSelectedCompany;

  const EntityBehaveScreen({
    super.key,
    this.onSelectedCompany,
  });

  static dynamic push(
    BuildContext context, {
    void Function(Company)? onSelectedCompany,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EntityBehaveScreen(
          onSelectedCompany: onSelectedCompany,
        ),
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
      if (context.mounted) {
        final entityCubit = context.read<EntityCubit>();
        final isRM = context.read<UserInfoCubit>().state.isRM;

        if (!isRM) {
          final userId = context.read<UserInfoCubit>().state.behaveUserInfo?.userId;
          await entityCubit.getBehaveCompanies(
            userId: userId,
          );
        } else {
          final userId = context.read<UserInfoCubit>().state.performUserInfo?.userId;
          await entityCubit.getPerformCompanies(
            userId: userId,
          );
        }

        setState(() {
          isReady = true;
          companies = context.read<EntityCubit>().state.companies;
          selected = context.read<EntityCubit>().state.company;
        });
      }
    });
  }

  Future<void> submit() async {
    if (selected == null) return;
    if (loading == true) return;

    try {
      setState(() => loading = true);
      context.read<AssessmentCubit>().cleanCache();
      if (context.mounted) {
        await configService.setActiveCompany(company: selected!);
        await configService.setActiveUserRole(userRole: UserRoleEnum.behave);
        await context.read<UserDeviceCubit>().createBehaveUserDevice();
        await context.read<UserInfoCubit>().setActiveUserInfo(isBehave: true);
        await context.read<EntityCubit>().syncBehave(
              company: selected!,
              userDeviceId: context.read<UserDeviceCubit>().data?.userDeviceId,
            );

        CmoDashboardBase.push(context);
      }
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
                  onTap: () async => submit(),
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
    return EntityList(
      entityItems: companies
          .map((e) => EntityItem(e,
              displayString: () => e.companyName ?? e.companyId.toString()))
          .toList(),
      onTap: (item) => onTapTile(item.rawData),
    );
  }
}
