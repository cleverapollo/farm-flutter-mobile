import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/entity_group_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final isBehave = context.read<UserInfoCubit>().state.isBehave;
      final isPerform = context.read<UserInfoCubit>().state.isPerform;
      if (!isPerform) {
        configService.setActiveUserRole(userRole: UserRoleEnum.behave);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const EntityBehaveScreen(),
          ),
        );
        return;
      }
      if (isPerform) {
        final isResourceManager =
            context.read<UserInfoCubit>().state.isResourceManager;
        if (!isResourceManager) {
          configService.setActiveUserRole(userRole: UserRoleEnum.farmerMember);
          Navigator.of(context).pushReplacement(EntityFarmerScreen.pageRoute());
          return;
        }
        Navigator.of(context)
            .pushReplacement(EntityGroupScreen.pageRoute(isBehave: isBehave));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.entity.tr(),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
