import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/ui/screens/behave/sync_summary/behave_sync_summary_enum.dart';
import 'package:cmo/ui/screens/behave/sync_summary/widget/sync_summary_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class ResourceManagerSyncSummaryScreen extends StatelessWidget {
  const ResourceManagerSyncSummaryScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => const ResourceManagerSyncSummaryScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CmoAppBarV2(
        title: 'Sync Summary',
        showLeading: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SyncItemWidget(first: 'Audit Detail', isTitle: true),
                    SyncItemWidget(first: 'Unsynced', count: 0),
                    SyncItemWidget(first: 'In Progress', count: 0),
                  ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CmoFilledButton(
                    onTap: () async {},
                    title: 'Sync',
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildLoadingIndicator extends StatelessWidget {
  const _BuildLoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
