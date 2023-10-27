import 'package:cmo/state/state.dart';
import 'package:cmo/state/sync/rm/rm_sync_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RMSyncSummaryProgressIndicator extends StatelessWidget {
  const RMSyncSummaryProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RMSyncCubit, RMSyncState>(
      builder: (context, state) {
        final totalUnsynced = state.rmSyncSummaryInformation?.totalUnsynced ?? 0;
        final totalSynced = state.rmSyncSummaryInformation?.totalSynced ?? 0;
        return Container(
          height: 6,
          color: context.colors.white,
          alignment: Alignment.centerLeft,
          child: totalUnsynced == 0 || totalSynced == 0
              ? const SizedBox.shrink()
              : Container(
            width: MediaQuery.of(context).size.width * totalSynced / totalUnsynced,
            height: 6,
            decoration: BoxDecoration(
              color: context.colors.blue,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}