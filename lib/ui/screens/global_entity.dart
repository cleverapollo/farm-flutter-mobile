import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/user_role_portal.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/entity_group_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/group_scheme_entity_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/resource_manager_unit_entity.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalEntityScreen extends StatefulWidget {
  static dynamic push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const GlobalEntityScreen(),
      ),
    );
  }

  static dynamic pushReplacement(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const GlobalEntityScreen(),
      ),
    );
  }

  const GlobalEntityScreen({super.key});

  @override
  State<GlobalEntityScreen> createState() => _GlobalEntityScreenState();
}

class _GlobalEntityScreenState extends State<GlobalEntityScreen> {
  dynamic selectedResourceManagerUnit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async {
      var roles = context
          .read<UserInfoCubit>()
          .data
          ?.listRoles;
      var userPortalRoles = context
          .read<UserInfoCubit>()
          .state
          .userRoles;
      var isBehave = userPortalRoles.firstWhereOrNull((element) =>
      element.isBehaveRole) != null;
      final isPerform = userPortalRoles.firstWhereOrNull((element) =>
      element.isPerformRole) != null;
      if (!isPerform) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const EntityBehaveScreen(),
          ),
        );
        return;
      }
      if (isPerform) {
        final isResourceManager = roles.firstWhereOrNull((element) =>
        element.roleName == Constants.resourceManagerRoleName) != null;
        if (!isResourceManager) {
          Navigator.of(context).pushReplacement(EntityFarmerScreen.pageRoute());
          return;
        }
        if (await configService.isRMSynced()) {
          CmoDashboardBase.push(context);
        } else {
          Navigator.of(context)
              .pushReplacement(EntityGroupScreen.pageRoute(isBehave: isBehave));
        }
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.entity.tr(),
      ),
      body: const Center(child: CircularProgressIndicator(),)
    );
  }
}
