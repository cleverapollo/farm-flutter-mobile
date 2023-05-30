import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_questions_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:flutter/material.dart';

class DismissibleAuditItem extends StatelessWidget {
  const DismissibleAuditItem({
    super.key,
    required this.audit,
    required this.onRemove,
    required this.onTapAudit,
  });

  final Audit audit;
  final VoidCallback onRemove;
  final VoidCallback onTapAudit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAudit,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Dismissible(
          key: Key(audit.id.toString()),
          direction: DismissDirection.endToStart,
          confirmDismiss: (test) async {
            final shouldRemoved = await showDefaultAlert(
              context,
              title: LocaleKeys.removeAudit.tr(),
              content: LocaleKeys.removeAuditAlertContent.tr(),
              actions: <Widget>[
                TextButton(
                  child: Text(LocaleKeys.ok.tr().toUpperCase()),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                TextButton(
                  child: Text(LocaleKeys.cancel.tr().toUpperCase()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
            if (shouldRemoved != true) {
              return;
            }

            onRemove();
            return null;
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
              CmoCardHeader(
                title: audit.compartmentName ?? '',
                value: '${LocaleKeys.created.tr()}: ${DateTime.tryParse(audit.createDT ?? '').ddMMYyyy()}',
              ),
              Text(
                audit.auditTemplateName ?? '',
                style: context.textStyles.bodyNormal.white,
              ),
              Text(
                audit.siteName ?? '',
                style: context.textStyles.bodyNormal.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
