import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_cubit.dart';
import 'package:cmo/ui/components/sync_summary_component/sync_item_widget.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class FarmerSyncSummaryScreen extends StatelessWidget {
  FarmerSyncSummaryScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => FarmerSyncSummaryScreen()),
    );
  }

  FarmerSyncSummaryCubit cubit = FarmerSyncSummaryCubit()..initData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CmoAppBarV2(
        title: 'Sync Summary',
        showLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: cubit.data.map((e) {
          if (e.isTitle) {
            return SyncItemWidget(label: e.title, isTitle: e.isTitle);
          }
          return SyncItemWidget(
              label: e.title, count: e.count, isHighlight: e.isActive);
        }).toList()),
      ),
    );
  }
}
