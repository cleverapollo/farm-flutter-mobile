import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class DismissibleAuditItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // Each Dismissible must contain a Key. Keys allow Flutter to
      // uniquely identify widgets.
      key: Key('item'),
      // Provide a function that tells the app
      // what to do after an item has been swiped away.
      onDismissed: (direction) {
        // Remove the item from the data source.
        // setState(() {
        //   items.removeAt(index);
        // });

        // Then show a snackbar.
        showSnackSuccess(
          msg: '${LocaleKeys.createNewStakeholder.tr()} dismissible!',
        );

        Navigator.of(context).pop();
      },
      direction: DismissDirection.endToStart,
      confirmDismiss: (test) async {
        print('confrim');
        return false;
      },
      // Show a red background as the item is swiped away.
      background: Container(
        color: context.colors.red,
        alignment: Alignment.center,
        child: Text(
          LocaleKeys.remove.tr(),
          style: context.textStyles.bodyBold.white,
        ),
      ),
      child: CmoCard(
        padding: EdgeInsets.symmetric(horizontal: 12),
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
    );
  }
}
