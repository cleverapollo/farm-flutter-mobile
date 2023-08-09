import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/sync_summary/farmer_sync_summary_enum.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerSyncSummaryScreen extends StatelessWidget {
  const FarmerSyncSummaryScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const FarmerSyncSummaryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FarmerSyncSummaryCubit>(
      create: (_) => FarmerSyncSummaryCubit(
        userDeviceCubit: context.read<UserDeviceCubit>(),
      )..initDataSync(),
      child: BlocSelector<FarmerSyncSummaryCubit, FarmerSyncSummaryState, bool>(
        selector: (state) => state.isSyncing,
        builder: (context, isSyncing) {
          return Scaffold(
            appBar: CmoAppBarV2(
              title: LocaleKeys.syncSummary.tr(),
              showLeading: true,
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
                            title: LocaleKeys.sync.tr(),
                            onTap: () {
                              if (!state.isSyncing) {
                                context.read<FarmerSyncSummaryCubit>().onSync();
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
                              context.read<FarmerSyncSummaryCubit>().onSync();
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
