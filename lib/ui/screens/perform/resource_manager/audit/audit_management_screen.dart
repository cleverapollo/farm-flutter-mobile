import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/dismissible_audit_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/status_button.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class AuditManagementScreen extends StatefulWidget {
  const AuditManagementScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AuditManagementScreen(),
      ),
    );
  }

  @override
  State<AuditManagementScreen> createState() => _AuditManagementScreenState();
}

class _AuditManagementScreenState extends State<AuditManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.audits.tr(),
          subtitle: 'RMU Name: Border Timbers',
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icAdd.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: CmoTextField(
                name: LocaleKeys.search.tr(),
                prefixIcon: Assets.icons.icSearch.svg(),
                hintText: LocaleKeys.search.tr(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatusButton(
                  onTap: () {},
                  isDisable: true,
                  title: LocaleKeys.incomplete.tr(),
                ),
                const SizedBox(width: 20,),
                StatusButton(
                  onTap: () {},
                  isDisable: false,
                  title: LocaleKeys.completed.tr(),
                ),
                const SizedBox(width: 20,),
                StatusButton(
                  onTap: () {},
                  isDisable: true,
                  title: LocaleKeys.synced.tr(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CmoCard(
              margin: const EdgeInsets.symmetric(horizontal: 23),
              content: [
                CmoCardHeader(title: 'Charter Sawerombi'),
                CmoCardHeader(title: 'Soe Soap'),
                CmoCardItem(title: LocaleKeys.incomplete.tr(), value: '8/10'),
              ],
            ),
            const SizedBox(height: 20),
            DismissibleAuditItem(),
            CmoCard(
              margin: const EdgeInsets.symmetric(horizontal: 23),
              content: [
                CmoCardHeader(title: 'Charter Sawerombi'),
                CmoCardHeader(title: 'Soe Soap'),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: constraints.minWidth / 2),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 19),
                            child: Text(
                              'Onboarded',
                              style: context.textStyles.bodyNormal.copyWith(color: context.colors.white),
                            ),
                          ),
                        ),
                        Assets.icons.icTick.svg(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
