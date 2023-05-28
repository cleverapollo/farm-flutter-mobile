import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_cubit.dart';
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
        userInfoCubit: context.read<UserInfoCubit>(),
        userDeviceCubit: context.read<UserDeviceCubit>(),
      ),
      child: Scaffold(
        appBar: const CmoAppBarV2(
          title: 'Sync Summary',
          showLeading: true,
        ),
        body: BlocBuilder<FarmerSyncSummaryCubit, FarmerSyncSummaryState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Stack(
              alignment: Alignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(children: FarmerSyncSummaryEnum.all.getViews),
                ),
                Positioned(
                    bottom: 30,
                    child: CmoFilledButton(
                      title: state.syncMessage ?? 'Sync',
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
      ),
    );
  }
}
