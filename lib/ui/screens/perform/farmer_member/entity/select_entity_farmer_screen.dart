import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/entity_cubit/farmer/select_entity_farmer_cubit.dart';
import 'package:cmo/state/entity_cubit/farmer/select_entity_farmer_state.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_cubit.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/screens/perform/farmer_member/entity/farmer_sync_onboarding_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectEntityFarmerScreen<T> extends StatefulWidget {

  const SelectEntityFarmerScreen({super.key});

  static PageRoute pageRoute() {
    return MaterialPageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => SelectEntityFarmerCubit(),
        child: const SelectEntityFarmerScreen(),
      );
    });
  }

  @override
  State<SelectEntityFarmerScreen> createState() => _SelectEntityFarmerScreenState();
}

class _SelectEntityFarmerScreenState<T> extends State<SelectEntityFarmerScreen<T>> {
  Farm? _selectedItem;

  @override
  void initState() {
    super.initState();
    final entityCubit = context.read<SelectEntityFarmerCubit>();
    entityCubit.fetchFarms();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FarmerSyncSummaryCubit>(
        create: (_) => FarmerSyncSummaryCubit(
              userDeviceCubit: context.read<UserDeviceCubit>(),
            ),
        child: CmoTappable(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: CmoAppBar(
              title: LocaleKeys.entity.tr(),
            ),
            body: Stack(
              children: [
                BlocSelector<SelectEntityFarmerCubit, SelectEntityFarmerState, List<Farm>>(
                  selector: (state) => state.farms,
                  builder: (context, farms) {
                    if (farms.isEmpty) {
                      return Text(
                        LocaleKeys.there_are_no_farms.tr(),
                        style: context.textStyles.bodyBold,
                      );
                    }
                    final entities = farms
                        .map((e) => EntityItem<Farm>(e,
                            displayString: () => e.farmName ?? ''))
                        .toList();
                    return BlocBuilder<FarmerSyncSummaryCubit,
                        FarmerSyncSummaryState>(
                      builder: (context, farmSyncState) {
                        if (farmSyncState.isSyncing) {
                          return Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(farmSyncState.syncMessage ??
                                      LocaleKeys.sync.tr()),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, bottom: 40),
                                child: CmoFilledButton(
                                  title: LocaleKeys.sync.tr(),
                                  onTap: _selectedItem == null
                                      ? null
                                      : () async {
                                          await _handleSyncFarmButton(context);
                                        },
                                ),
                              ),
                            ],
                          );
                        }

                        return Column(
                          children: [
                            Expanded(
                              child: EntityList(
                                entityItems: entities,
                                selectedItem: entities.firstWhereOrNull(
                                    (e) => e.rawData == _selectedItem),
                                onTap: (item) {
                                  _selectedItem = item.rawData;
                                  context
                                      .read<SelectEntityFarmerCubit>()
                                      .setSelectedFarm(_selectedItem!);
                                  setState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 40),
                              child: CmoFilledButton(
                                title: LocaleKeys.sync.tr(),
                                onTap: _selectedItem == null
                                    ? null
                                    : () async {
                                        await _handleSyncFarmButton(context);
                                      },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                BlocSelector<SelectEntityFarmerCubit, SelectEntityFarmerState, bool>(
                  selector: (state) => state.isLoading,
                  builder: (context, state) => state
                      ? Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: const CircularProgressIndicator(),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _handleSyncFarmButton(BuildContext context) async {
    context.read<FarmerSyncSummaryCubit>().onSyncStatus('Syncing...');
    await context.read<UserInfoCubit>().getPerformUserInfo();

    final state = context.read<SelectEntityFarmerCubit>().state;
    final userInfo = context.read<UserInfoCubit>().state.performUserInfo;
    final farm = state.selectedFarm;

    if (farm == null) {
      return;
    }

    final futures = <Future<dynamic>>[];

    futures
      ..add(configService.setActiveUser(userInfo: userInfo!))
      ..add(
          configService.setActiveUserRole(userRole: UserRoleEnum.farmerMember))
      ..add(configService.setActiveFarm(farm: farm))
      ..add(context.read<UserInfoCubit>().setActiveUserInfo(isBehave: false))
      ..add(context.read<UserDeviceCubit>().createPerformUserDevice());
    await Future.wait(futures).then((_) async {
      if (mounted) {
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => FarmerSyncOnboardingScreen(),
          ),
        );
      }
    });
  }
}
