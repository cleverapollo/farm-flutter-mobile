import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class ExpandableManagementPlanItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExpandableManagementPlanItemState();
}

class _ExpandableManagementPlanItemState extends State<ExpandableManagementPlanItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: Assets.icons.icDown.svgWhite,
      collapsedBackgroundColor: context.colors.blueDark2,
      onExpansionChanged: (bool expanding) => setState(
        () => isExpanded = expanding,
      ),
      title: Container(
        child: Text(
          'APO',
          style: context.textStyles.bodyBold.white,
        ),
        decoration: BoxDecoration(
          color: context.colors.blueDark2,
        ),
      ),
      children: [
        ListTile(
          title: Text('Item 1 child'),
          subtitle: Text('Details goes here'),
        ),
        ListTile(
          title: Text('Item 1 child'),
          subtitle: Text('Details goes here'),
        ),
        ListTile(
          title: Text('Item 1 child'),
          subtitle: Text('Details goes here'),
        ),
        ListTile(
          title: Text('Item 1 child'),
          subtitle: Text('Details goes here'),
        ),
        ListTile(
          title: Text('Item 1 child'),
          subtitle: Text('Details goes here'),
        ),
      ],
    );
  }
}
