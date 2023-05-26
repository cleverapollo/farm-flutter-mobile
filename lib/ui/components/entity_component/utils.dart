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
  final roles = context.read<UserInfoCubit>().data?.listRoles;
  final userPortalRoles = context.read<UserInfoCubit>().state.userRoles;
  final isBehave =
      userPortalRoles.firstWhereOrNull((element) => element.isBehaveRole) !=
          null;
  final isPerform =
      userPortalRoles.firstWhereOrNull((element) => element.isPerformRole) !=
          null;
  if (!isPerform) {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const EntityBehaveScreen(),
      ),
    );
    return;
  }

  if (isPerform) {
    final isResourceManager = roles.firstWhereOrNull(
          (element) => element.roleName == Constants.resourceManagerRoleName,
        ) !=
        null;
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
