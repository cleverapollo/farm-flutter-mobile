import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/farm.dart';
import 'package:cmo/state/entity_cubit/farmer/farmer_entity_cubit.dart';
import 'package:cmo/state/entity_cubit/farmer/farmer_entity_state.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_cubit.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntityFarmerScreen<T> extends StatefulWidget {
  final Farm? selectedEntity;

  const EntityFarmerScreen({this.selectedEntity, super.key});

  static PageRoute pageRoute() {
    return MaterialPageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => FarmerEntityCubit(),
        child: const EntityFarmerScreen(selectedEntity: null),
      );
    });
  }

  @override
  State<EntityFarmerScreen> createState() => _EntityFarmerScreenState();
}

class _EntityFarmerScreenState<T> extends State<EntityFarmerScreen<T>> {
  Farm? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedEntity;
    final entityCubit = context.read<FarmerEntityCubit>();
    entityCubit.fetchFarms(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FarmerSyncSummaryCubit>(
        create: (_) => FarmerSyncSummaryCubit(
              userInfoCubit: context.read<UserInfoCubit>(),
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
                BlocSelector<FarmerEntityCubit, FarmerEntityState, List<Farm>>(
                  selector: (state) => state.farms,
                  builder: (context, farms) {
                    if (farms.isEmpty) {
                      return Container(
                        child: Text(
                          LocaleKeys.there_are_no_farms.tr(),
                          style: context.textStyles.bodyBold,
                        ),
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
                                  title: 'Sync',
                                  onTap: _selectedItem == null
                                      ? null
                                      : () async {
                                          await _handleSyncFarmButton(context)
                                              .then((_) =>
                                                  CmoDashboardBase.push(
                                                      context));
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
                                      .read<FarmerEntityCubit>()
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
                                        await _handleSyncFarmButton(context)
                                            .then((_) =>
                                                CmoDashboardBase.push(context));
                                      },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                BlocSelector<FarmerEntityCubit, FarmerEntityState, bool>(
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

    final state = context.read<FarmerEntityCubit>().state;
    final farm = state.selectedFarm;

    final futures = <Future<dynamic>>[];

    futures
      ..add(
          configService.setActiveUserRole(userRole: UserRoleEnum.farmerMember))
      ..add(configService.setActiveFarmId(farmId: '${farm?.id}'))
      ..add(configService.setActiveFarmGroupSchemeId(
          groupSchemeId: '${farm?.groupSchemeId}'));

    await Future.wait(futures).then((_) async {
      if (context.mounted) {
        await context.read<FarmerSyncSummaryCubit>().onSync();
      }
    });
  }
}
