import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/enum/user_role_enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/stake_holder_list_cubit/stake_holder_list_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/create_new_stake_holder/stake_holder_detail_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/widgets/farmer_mode_stake_holder_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/widgets/rm_mode_stake_holder_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StakeHolderManagementScreen extends BaseStatefulWidget {

  StakeHolderManagementScreen({super.key}) : super(screenName: LocaleKeys.neighbours.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StakeHolderManagementScreen(),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _StakeHolderManagementScreenState();
}

class _StakeHolderManagementScreenState extends BaseStatefulWidgetState<StakeHolderManagementScreen> {
  Timer? _debounceInputTimer;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<StakeHolderListCubit>().refresh();
    });
  }

  Future<void> onNavigateToAddStakeholder() async {
    if (context.mounted) {
      StakeHolderDetailScreen.push(context);
      await context.read<StakeHolderListCubit>().refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: FutureBuilder(
        future: configService.getActiveUserRole(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          return Scaffold(
            appBar: _buildCustomAppBar(snapshot.data),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
                  child: CmoTextField(
                    name: LocaleKeys.search.tr(),
                    hintText: LocaleKeys.search.tr(),
                    suffixIcon: Assets.icons.icSearch.svg(),
                    onChanged: (input) {
                      _debounceInputTimer?.cancel();
                      _debounceInputTimer = Timer(
                        const Duration(milliseconds: 200),
                        () => context
                            .read<StakeHolderListCubit>()
                            .searching(input),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BlocSelector<StakeHolderListCubit,
                      StakeHolderListState, StakeHolderListState>(
                    selector: (state) {
                      return state;
                    },
                    builder: (context, state) {
                      if (state.loadingList) {
                        return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: context.colors.white,
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

                      return RefreshIndicator(
                        onRefresh: () {
                          return context
                              .read<StakeHolderListCubit>()
                              .loadListStakeHolders();
                        },
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 22,
                          ),
                          itemCount: state.filterListStakeHolders.length,
                          padding: const EdgeInsets.symmetric(horizontal: 21),
                          itemBuilder: (context, index) {
                            return _buildItemCard(
                              model: state.filterListStakeHolders[index],
                              haveGreyBackground: index.isEven,
                              isRM:
                                  snapshot.data == UserRoleEnum.regionalManager,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget? _buildCustomAppBar([UserRoleEnum? data]) {
    if (data == UserRoleEnum.regionalManager) {
      return PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: BlocSelector<StakeHolderListCubit, StakeHolderListState,
            ResourceManagerUnit?>(
          selector: (state) => state.resourceManagerUnit,
          builder: (context, resourceManagerUnit) {
            return CmoAppBar(
              title: LocaleKeys.neighbours.tr(),
              subtitle: '${LocaleKeys.siteName.tr()}: ${resourceManagerUnit?.regionalManagerUnitName}',
              leading: Assets.icons.icBackButton.svgBlack,
              onTapLeading: Navigator.of(context).pop,
              trailing: Assets.icons.icUpdatedAddButton.svgBlack,
              onTapTrailing: () {
                StakeHolderDetailScreen.push(context);
              },
            );
          },
        ),
      );
    } else {
      return PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: FutureBuilder(
          future: configService.getActiveFarm(),
          builder: (context, snapshot) {
            return CmoAppBar(
              title: LocaleKeys.neighbours.tr(),
              subtitle: snapshot.data?.farmName ?? '',
              leading: Assets.icons.icBackButton.svgBlack,
              onTapLeading: Navigator.of(context).pop,
              trailing: Assets.icons.icUpdatedAddButton.svgBlack,
              onTapTrailing: onNavigateToAddStakeholder,
            );
          },
        ),
      );
    }
  }

  Widget _buildItemCard({
    required StakeHolder model,
    required bool haveGreyBackground,
    required bool isRM,
  }) {
    if (isRM) {
      return CmoDismissibleItem(
        key: Key(model.id.toString()),
        title: LocaleKeys.removeStakeholder.tr(),
        subtitle: LocaleKeys.removeStakeholderAlertContent.tr(),
        onRemove: () async {
          await context.read<StakeHolderListCubit>().onRemoveStakeholder(model);
          await context.read<DashboardCubit>().refresh();
        },
        child: RmModeStakeHolderItem(
          model: model,
          onTap: () {
            StakeHolderDetailScreen.push(
              context,
              stakeHolder: model,
              isEditing: true,
            );
          },
        ),
      );
    } else {
      return CmoDismissibleItem(
        key: Key(model.id.toString()),
        title: LocaleKeys.removeStakeholder.tr(),
        subtitle: LocaleKeys.removeStakeholderAlertContent.tr(),
        onRemove: () async {
          await context.read<StakeHolderListCubit>().onRemoveStakeholder(model);
          await context.read<DashboardCubit>().refresh();
        },
        child: FarmerModeStakeHolderItem(
          model: model,
          haveGreyBackground: haveGreyBackground,
          onTap: () {
            StakeHolderDetailScreen.push(
              context,
              stakeHolder: model,
              isEditing: true,
            );
          },
        ),
      );
    }
  }
}
