import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/components/custom_icon_slidable_action.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ActionLogItem extends StatelessWidget {
  final ActionLog actionLog;
  final Map<String, String?> mapData;
  final void Function()? onClose;

  ActionLogItem({
    required this.actionLog,
    required this.mapData,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final child = Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.greyD9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget(context),
          ...informationWidget(),
        ],
      ),
    );

    if(onClose == null) {
      return child;
    }

    return Slidable(
      key: Key(actionLog.actionLogId.toString()),
        endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          CustomIconSlidableAction(
            onPressed: (_) async {
            },
            padding: EdgeInsets.zero,
            backgroundColor: context.colors.blue,
            foregroundColor: context.colors.white,
            icon: Assets.icons.icActionLogClose.svg(),
            label: LocaleKeys.close.tr(),
          ),
        ],
      ),
      child: child,
    );
  }

  List<Widget> informationWidget() {
    final children = <Widget>[];
    for (var index = 0; index < mapData.keys.length; index++) {
      final keyString = mapData.keys.elementAt(index);
        children.add(
          InformationRowItem(
            keyString: keyString,
            value: mapData[keyString],
            isGreyBackground: index.isOdd,
          ),
        );
    }

    return children;
  }

  Widget titleWidget(BuildContext context) {
    Color background;
    String title;
    Widget icon;

    if (actionLog.isClosed ?? false) {
      background = context.colors.greenC600;
      title = LocaleKeys.closed.tr();
      icon = Assets.icons.icActionLogClosed.svg();
    } else if (actionLog.isMajor ?? false) {
      background = context.colors.red;
      title = LocaleKeys.major_title.tr();
      icon = Assets.icons.icWarningWhite.svg();
    } else {
      background = context.colors.orange9736;
      title = LocaleKeys.minor_title.tr();
      icon = Assets.icons.icCloseWhite.svg();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: background,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title.toUpperCase(),
                style: context.textStyles.bodyBold.white,
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
