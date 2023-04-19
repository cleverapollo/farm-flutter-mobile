import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/cmo_dashboard_base.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../widget/cmo_app_bar_v2.dart';
import '../../../../widget/cmo_buttons.dart';

class AddMemberDone extends StatelessWidget {
  const AddMemberDone({Key? key}) : super(key: key);

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const AddMemberDone()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CmoAppBarV2(
          title: LocaleKeys.addMember.tr(),
          subtitle: LocaleKeys.siteName.tr(),
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              children: [
                Text('XXXxxx member is now a Group Scheme member.',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black)),
                Text('Documentation has been emailed to the relevant parties',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black)),
                const Spacer(),
                Center(
                    child: CmoFilledButton(
                        title: 'Close',
                        onTap: () {
                          CmoDashboardBase.push(context);
                        })),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
