import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/behave/create_worker/worker_add_screen.dart';
import 'package:cmo/ui/screens/behave/sync_summary/behave_sync_summary_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/register_management.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_card.dart';
import 'package:flutter/cupertino.dart';

class BehaveDashboardScreen extends StatelessWidget {
  const BehaveDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      children: [
        CmoTappable(
          //TODO Need to remove
          //onTap: () => AssessmentScreen.push(context),
          onTap: () => RegisterManagement.push(context),
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.assessments.tr()),
              CmoCardItem(title: LocaleKeys.onboarded.tr(), value: '2/10'),
              CmoCardItem(title: LocaleKeys.incomplete.tr(), value: '8/10'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CmoTappable(
          onTap: () => WorkerAddScreen.push(context),
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.createWorker.tr()),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CmoTappable(
          onTap: () => SyncSummaryScreen.push(context),
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.sync.tr()),
              CmoCardItem(title: LocaleKeys.synced.tr(), value: '5'),
            ],
          ),
        ),
      ],
    );
  }
}
