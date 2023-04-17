import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/entity/entity_behave_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/entity_group_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future pushEntityScreen(BuildContext context,
    {bool isPushingReplacement = false}) {
  final userRoles = context.read<UserInfoCubit>().state.userRoles;
  final behaveRole =
      userRoles?.firstWhereOrNull((element) => element.isBehaveRole);
  final performRole =
      userRoles?.firstWhereOrNull((element) => element.isPerformRole);
  var route = MaterialPageRoute(
    builder: (_) => const EntityBehaveScreen(),
  );
  // if (performRole != null) {
  //   route = MaterialPageRoute(
  //     builder: (_) => const EntityGroupScreen(),
  //   );
  // }
  if (route == null) return Future.value(null);

  if (isPushingReplacement) {
    return Navigator.of(context).pushReplacement(route);
  } else {
    return Navigator.of(context).push(route);
  }
}
