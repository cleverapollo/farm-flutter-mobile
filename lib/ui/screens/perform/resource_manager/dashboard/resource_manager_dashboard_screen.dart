import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/member_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/stake_holder_management_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/sync_summary/resource_manager_sync_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class ResourceManagerDashboardScreen extends StatelessWidget {
  const ResourceManagerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      children: [
        CmoTappable(
          onTap: () {
            MemberManagementScreen.push(context);
          },
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.member_s.tr()),
              CmoCardItem(title: LocaleKeys.onboarded.tr(), value: '5/10'),
              CmoCardItem(title: LocaleKeys.incomplete.tr(), value: '8/10'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CmoTappable(
          onTap: () {
            AuditManagementScreen.push(context);
          },
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.audit_s.tr()),
              CmoCardItem(title: LocaleKeys.onboarded.tr(), value: '5/10'),
              CmoCardItem(title: LocaleKeys.incomplete.tr(), value: '8/10'),
              CmoCardItemHighlighted(
                title: LocaleKeys.membersOutstanding.tr(),
                value: '8/10',
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CmoTappable(
          onTap: () {
            StakeHolderManagementScreen.push(context);
          },
          child: CmoCard(
            content: [
              CmoCardHeader(title: LocaleKeys.stakeholders.tr()),
              CmoCardItem(title: LocaleKeys.national.tr(), value: '50'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CmoCard(
          content: [
            CmoCardHeader(title: LocaleKeys.cars.tr()),
            CmoCardItem(title: LocaleKeys.opened.tr(), value: '5'),
            CmoCardItem(title: LocaleKeys.overdue.tr(), value: '5'),
          ],
        ),
        const SizedBox(height: 20),
        CmoTappable(
          onTap: () {
            ResourceManagerSyncSummaryScreen.push(context);
          },
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
