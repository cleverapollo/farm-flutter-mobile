import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/sync_summary/farmer_sync_summary_enum.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerSyncSummaryScreen extends BaseStatefulWidget {
  FarmerSyncSummaryScreen({super.key}) : super(screenName: LocaleKeys.syncSummary.tr());

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FarmerSyncSummaryScreen(),
      ),
    );
  }

  @override
  FarmerSyncSummaryScreenState createState() => FarmerSyncSummaryScreenState();
}

class FarmerSyncSummaryScreenState extends BaseStatefulWidgetState<FarmerSyncSummaryScreen> {
  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider<FarmerSyncSummaryCubit>(
      create: (_) => FarmerSyncSummaryCubit(
        userDeviceCubit: context.read<UserDeviceCubit>(),
      )..initDataSync(),
      child: BlocSelector<FarmerSyncSummaryCubit, FarmerSyncSummaryState, bool>(
        selector: (state) => state.isSyncing,
        builder: (context, isSyncing) {
          return Scaffold(
            appBar: CmoAppBar(
              title: LocaleKeys.syncSummary.tr(),
              leading: Assets.icons.icBackButton.svgBlack,
              onTapLeading: () {
                if (isSyncing) return;
                Navigator.pop(context);
              },
            ),
            body: BlocBuilder<FarmerSyncSummaryCubit, FarmerSyncSummaryState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.isSyncing) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                          child: Text(
                        state.syncMessage ?? LocaleKeys.sync.tr(),
                        textAlign: TextAlign.center,
                        style: context.textStyles.bodyNormal.black,
                      )),
                      Positioned(
                          bottom: 30,
                          child: CmoFilledButton(
                            loading: isSyncing,
                            title: LocaleKeys.sync.tr(),
                            onTap: () {
                              if (!state.isSyncing) {
                                context.read<FarmerSyncSummaryCubit>().syncFarmerSummary();
                              }
                            },
                          )),
                    ],
                  );
                }

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                          children: FarmerSyncSummaryEnum.all.getViews
                            ..add(const SizedBox(height: 80))),
                    ),
                    Positioned(
                        bottom: 30,
                        child: CmoFilledButton(
                          title: LocaleKeys.sync.tr(),
                          onTap: () {
                            if (!state.isSyncing) {
                              context.read<FarmerSyncSummaryCubit>().syncFarmerSummary();
                            }
                          },
                        )),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
