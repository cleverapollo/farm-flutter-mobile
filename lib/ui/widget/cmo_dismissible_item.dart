import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:flutter/material.dart';

class CmoDismissibleItem extends StatelessWidget {
  const CmoDismissibleItem({
    required Key key,
    required this.child,
    required this.onRemove,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget child;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.endToStart,
      confirmDismiss: (test) async {
        final shouldRemoved = await showDefaultAlert(
          context,
          title: title,
          content: subtitle,
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

        onRemove.call();
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
      child: child,
    );
  }
}
