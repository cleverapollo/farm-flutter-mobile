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
  if (context.read<UserInfoCubit>().state.userRole?.isBehave == true) {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const EntityBehaveScreen(),
      ),
    );
    return;
  }

  if (context.read<UserInfoCubit>().state.userRole?.isPerform == true ||
      context.read<UserInfoCubit>().state.userRole?.isBoth == true) {
    final isResourceManager =
        context.read<UserInfoCubit>().state.isResourceManager;
    if (!isResourceManager) {
      await Navigator.of(context).pushReplacement(
        EntityFarmerScreen.pageRoute(),
      );
      return;
    }

    await Navigator.of(context).pushReplacement(
      EntityGroupScreen.pageRoute(
        isBehave: context.read<UserInfoCubit>().state.userRole?.isBoth == true,
      ),
    );
    return;
  }
}
