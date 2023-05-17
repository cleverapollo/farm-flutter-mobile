import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/user_role.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/entity/entity_behave_screen.dart';
import 'package:cmo/ui/screens/onboarding/login/role_picker.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/entity_group_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> pushEntityScreen(
  BuildContext context, {
  bool isPushingReplacement = false,
}) async {
  final userRoles = context.read<UserInfoCubit>().state.userRoles;

  for (final UserRole item in userRoles ?? []) {
    debugPrint('[GET USER ROLES] ======> ${item.portalName}');
  }

  final behaveRole =
      userRoles?.firstWhereOrNull((element) => element.isBehaveRole);

  final performRole =
      userRoles?.firstWhereOrNull((element) => element.isPerformRole);

  MaterialPageRoute<dynamic>? route;

  if (behaveRole != null && performRole != null) {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const RolePickerScreen()),
    );

    if (result == 'Behave') {
      route = MaterialPageRoute(
        builder: (_) => const EntityBehaveScreen(),
      );
    }

    if (result == 'Perform') {
      route = MaterialPageRoute(
        builder: (_) => const EntityGroupScreen(),
      );
    }
  } else {
    if (behaveRole != null) {
      route = MaterialPageRoute(
        builder: (_) => const EntityBehaveScreen(),
      );
    }

    if (performRole != null) {
      route = MaterialPageRoute(
        builder: (_) => const EntityGroupScreen(),
      );
    }
  }

  if (route == null) return Future.value();

  if (isPushingReplacement) {
    await Navigator.of(context).pushReplacement(route);
  } else {
    await Navigator.of(context).push(route);
  }
}
