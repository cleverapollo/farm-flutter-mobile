import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/entity.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/ui/screen/dashboard/dashboard_screen.dart';
import 'package:cmo/ui/screen/entity/entity_search_screen.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:cmo/ui/widget/cmo_option_tile.dart';

class GroupSchemeEntityScreen extends StatefulWidget {
  const GroupSchemeEntityScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const GroupSchemeEntityScreen(),
      ),
    );
  }

  @override
  State<GroupSchemeEntityScreen> createState() =>
      _GroupSchemeEntityScreenState();
}

class _GroupSchemeEntityScreenState
    extends State<GroupSchemeEntityScreen> {
  Entity? selected;

  Future<void> toEntitySearchScreen(EntityType type) async {
    final result =
    await EntitySearchScreen.push(context, type: type, selected: selected);
    if (result is! Entity) return;

    selected = result;
    setState(() {});
  }

  Widget buildOptionType({required EntityType type, required String title}) {
    return CmoTappable(
      onTap: () => toEntitySearchScreen(type),
      child: CmoOptionTile(title: title),
    );
  }

  Future<void> submit() async {
    if (selected == null) return;
    await context.read<UserDeviceCubit>().createUserDevice(context);
    if (context.mounted) {
      await context.read<EntityCubit>().sync(selected!);
    }
    if (context.mounted) DashboardScreen.push(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: CmoAppBar(title: LocaleKeys.entity.tr()),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CmoHeaderTile(title: LocaleKeys.groupSchemeManagement.tr()),
            buildOptionType(
              type: EntityType.gs,
              title: LocaleKeys.groupScheme.tr(),
            ),
            buildOptionType(
              type: EntityType.rmu,
              title: LocaleKeys.resourceManagementUnit.tr(),
            ),
            const SizedBox(height: 51),
            CmoHeaderTile(title: LocaleKeys.operationsManagement.tr()),
            buildOptionType(
              type: EntityType.cpy,
              title: LocaleKeys.company.tr(),
            ),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}
