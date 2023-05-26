import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/user_role_portal.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/entity_group_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> pushEntityScreen(
  BuildContext context, {
  bool isPushingReplacement = false,
}) async {
  final isBehave = context.read<UserInfoCubit>().state.isBehave;
  final isPerform = context.read<UserInfoCubit>().state.isPerform;

  if (!isPerform) {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const EntityBehaveScreen(),
      ),
    );
    return;
  }

  if (isPerform) {
    final isResourceManager = context.read<UserInfoCubit>().state.isResourceManager;
    if (!isResourceManager) {
      await Navigator.of(context).pushReplacement(
        EntityFarmerScreen.pageRoute(),
      );
      return;
    }

    await Navigator.of(context).pushReplacement(
      EntityGroupScreen.pageRoute(
        isBehave: isBehave,
      ),
    );
    return;
  }
}
