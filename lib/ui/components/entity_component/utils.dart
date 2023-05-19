import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/user_role_portal.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/entity/entity_behave_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/entity_group_screen.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> pushEntityScreen(
  BuildContext context, {
  bool isPushingReplacement = false,
}) async {
  final userRoles = context.read<UserInfoCubit>().state.userRoles;

  final behaveRole =
      userRoles?.firstWhereOrNull((element) => element.isBehaveRole);

  final performRole =
      userRoles?.firstWhereOrNull((element) => element.isPerformRole);

  MaterialPageRoute<dynamic>? route;
  String? currentRole;

  if (behaveRole != null) {
    currentRole = Constants.behaveRoleName;

    route = MaterialPageRoute(
      builder: (_) => const EntityBehaveScreen(),
    );
  }

  if (performRole != null) {
    currentRole = Constants.performRoleName;

    route = MaterialPageRoute(
      builder: (_) => const EntityGroupScreen(),
    );
  }

  if (route == null || currentRole == null) return Future.value();

  if (context.mounted) {
    await context.read<AuthCubit>().saveUserCurrentRole(currentRole);
  }

  if (isPushingReplacement && context.mounted) {
    await Navigator.of(context).pushReplacement(route);
  } else {
    await Navigator.of(context).push(route);
  }
}
