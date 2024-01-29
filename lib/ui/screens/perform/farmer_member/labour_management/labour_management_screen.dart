import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/labour_management/labour_management_cubit.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/labour_detail/labour_detail_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/widgets/labour_management_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabourManagementScreen extends BaseStatefulWidget {
  LabourManagementScreen({super.key}) : super(screenName: LocaleKeys.labourManagement.tr());

  @override
  State<StatefulWidget> createState() => _LabourManagementScreenState();

  static Future<dynamic> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => LabourManagementCubit(),
          child: LabourManagementScreen(
          ),
        ),
      ),
    );
  }
}

class _LabourManagementScreenState extends BaseStatefulWidgetState<LabourManagementScreen> {
  Timer? _debounceInputTimer;

  Future<void> navigateToDetail({
    FarmerWorker? farmerWorker,
  }) async {
    await LabourDetailScreen.push(
      context,
      farmerWorker: farmerWorker,
    );

    await context.read<LabourManagementCubit>().loadListWorkers();
    await context.read<DashboardCubit>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.labourManagement.tr(),
        subtitle:
            context.watch<LabourManagementCubit>().state.activeFarm?.farmName,
        subtitleTextStyle: context.textStyles.bodyBold.blue,
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
        onTapTrailing: () => navigateToDetail(),
      ),
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
                  () => context.read<LabourManagementCubit>().searching(input),
                );
              },
            ),
          ),
          Expanded(
            child: BlocSelector<LabourManagementCubit, LabourManagementState,
                List<FarmerWorker>>(
              selector: (state) {
                return state.filterWorkers;
              },
              builder: (builder, filterWorkers) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 22,
                  ),
                  itemCount: filterWorkers.length,
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  itemBuilder: (context, index) {
                    return CmoDismissibleItem(
                      key: Key(filterWorkers[index].id.toString()),
                      title: LocaleKeys.removeLabour.tr(),
                      subtitle: LocaleKeys.removeLabourAlertContent.tr(),
                      onRemove: () async {
                        await context
                            .read<LabourManagementCubit>()
                            .onRemoveLabour(filterWorkers[index]);
                      },
                      child: LabourManagementItem(
                        farmerWorker: filterWorkers[index],
                        onTap: () => navigateToDetail(farmerWorker: filterWorkers[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
