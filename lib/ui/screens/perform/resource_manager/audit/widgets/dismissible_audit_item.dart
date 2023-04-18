import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DismissibleAuditItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Dismissible(
        key: Key('item'),
        onDismissed: (direction) {
          showSnackSuccess(
            msg: '${LocaleKeys.createNewStakeholder.tr()} dismissible!',
          );

          Navigator.of(context).pop();
        },
        direction: DismissDirection.endToStart,
        confirmDismiss: (test) async {
          final shouldRemoved = await showDefaultAlert(
            context,
            title: LocaleKeys.removeAudit.tr(),
            content: LocaleKeys.removeAuditAlertContent.tr(),
            actions: <Widget>[
              TextButton(
                child:
                Text(LocaleKeys.ok.tr().toUpperCase()),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: Text(
                    LocaleKeys.cancel.tr().toUpperCase()),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
          if (shouldRemoved != true) {
            return;
          }
          // onRemovingCallback?.call(data);
        },
        background: Container(
          color: context.colors.red,
          alignment: Alignment.center,
          child: Text(
            LocaleKeys.remove.tr(),
            style: context.textStyles.bodyBold.white,
          ),
        ),
        child: CmoCard(
          content: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CmoCardHeader(title: 'Imbeza'),
                CmoCardHeader(
                  title: '${LocaleKeys.created.tr()}: 8-12-2022',
                ),
              ],
            ),
            Text(
              'Internal audit checklist',
              style: context.textStyles.bodyNormal.white,
            ),

            Text(
              'Plantations Zimbabwe',
              style: context.textStyles.bodyNormal.white,
            ),
          ],
        ),
      ),
    );
  }
}
