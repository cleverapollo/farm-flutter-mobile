import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/components/entity_component/entity_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/rm_entity_group_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalEntityScreen extends StatefulWidget {

  const GlobalEntityScreen({super.key});

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

  @override
  State<GlobalEntityScreen> createState() => _GlobalEntityScreenState();
}

class _GlobalEntityScreenState extends State<GlobalEntityScreen> {
  dynamic selectedResourceManagerUnit;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final state = context.read<AuthCubit>().state;
      final haveBehave = state.haveBehaveRole;
      final havePerform = state.havePerformRole;

      await context.read<UserInfoCubit>().getUserInfoWithRole(
            haveBehave: haveBehave,
            havePerform: havePerform,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.entity.tr(),
      ),
      body: BlocSelector<UserInfoCubit, UserInfoState, UserInfoState>(
        selector: (state) => state,
        builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }

          if (state.error != null && kDebugMode) {
            return Center(
              child: Text(
                '${state.error}',
              ),
            );
          }

          if (state.isFarmer) {
            return _farmerWidget();
          }

          if (state.isRM) {
            if (state.isBehave) {
              return _buildPerformAndBehaveWidget();
            } else {
              return _performWidget();
            }
          } else {
            return _behaveWidget();
          }
        },
      ),
    );
  }

  Widget _performWidget() {
    return const RMEntityGroupWidget();
  }

  Widget _behaveWidget() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 38),
          alignment: Alignment.centerLeft,
          color: context.colors.blueDark1,
          child: Text(
            LocaleKeys.complianceManagement.tr(),
            style: context.textStyles.bodyBold
                .copyWith(color: context.colors.white),
          ),
        ),
        EntityWidget(
          LocaleKeys.company.tr(),
          onTap: () {
            EntityBehaveScreen.push(
              context,
            );
          },
        ),
        Divider(
          height: 1,
          color: context.colors.grey,
          indent: 23,
          endIndent: 23,
        ),
      ],
    );
  }

  Widget _buildPerformAndBehaveWidget() {
    return Column(
      children: [
        _performWidget(),
        _behaveWidget(),
      ],
    );
  }

  Widget _farmerWidget() {
    return Column(
      children: [
        Divider(
          height: 1,
          color: context.colors.grey,
          indent: 23,
          endIndent: 23,
        ),
        EntityWidget(
          LocaleKeys.site.tr(),
          onTap: () async {
            await Navigator.of(context).pushReplacement(
              EntityFarmerScreen.pageRoute(),
            );
          },
        ),
        Divider(
          height: 1,
          color: context.colors.grey,
          indent: 23,
          endIndent: 23,
        ),
      ],
    );
  }
}
