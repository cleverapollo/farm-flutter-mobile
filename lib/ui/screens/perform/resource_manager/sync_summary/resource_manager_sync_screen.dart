import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/sync_summary_component/sync_item_widget.dart';
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
      appBar: CmoAppBarV2(
        title: LocaleKeys.syncSummary.tr(),
        showLeading: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SyncItemWidget(label: LocaleKeys.audit_detail.tr(), isTitle: true),
                    SyncItemWidget(label: LocaleKeys.unsynced.tr(), count: 0),
                    SyncItemWidget(label: LocaleKeys.in_progress.tr(), count: 0),
                  ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CmoFilledButton(
                    onTap: () async {},
                    title: LocaleKeys.sync.tr(),
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
