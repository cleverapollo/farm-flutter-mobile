import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/site_management_plan/management_plan/management_plan_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class ExpandableManagementPlanItem extends StatefulWidget {
  const ExpandableManagementPlanItem({
    super.key,
    required this.managementPlanGroup,
  });

  final ManagementPlanGroup managementPlanGroup;

  @override
  State<StatefulWidget> createState() => _ExpandableManagementPlanItemState();
}

class _ExpandableManagementPlanItemState extends State<ExpandableManagementPlanItem> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.blueDark2,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.managementPlanGroup.groupTitle,
                    style: context.textStyles.bodyBold.white,
                  ),
                ),
                Assets.icons.icDown.svgWhite,
              ],
            ),
          ),
        ),
        if (isExpanded) ...widget.managementPlanGroup.groupItems.map(_buildInfoItem) else const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildInfoItem(ManagementPlanGroupItem item) {
    return InkWell(
      onTap: () => item.onTap?.call(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: context.colors.grey),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.value,
                style: context.textStyles.bodyBold.black,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Assets.icons.icArrowRight.svgBlack,
          ],
        ),
      ),
    );
  }
}
