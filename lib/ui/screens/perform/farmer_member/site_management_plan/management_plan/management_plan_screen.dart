import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/site_management_plan/management_plan/widgets/expandable_management_plan_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class ManagementPlanGroupItem {
  final String value;
  final int id;
  final VoidCallback? onTap;

  const ManagementPlanGroupItem({
    required this.value,
    required this.id,
    this.onTap,
  });
}

class ManagementPlanGroup extends Object {
  final String groupTitle;
  final List<ManagementPlanGroupItem> groupItems;

  ManagementPlanGroup({
    required this.groupTitle,
    required this.groupItems,
  });
}

List<ManagementPlanGroup> _mockData = [
  ManagementPlanGroup(
    groupTitle: 'APO',
    groupItems: [
      const ManagementPlanGroupItem(
        id: 1,
        value: 'Working Circle',
      ),
      const ManagementPlanGroupItem(
        id: 2,
        value: 'Geology Class',
      ),
      const ManagementPlanGroupItem(
        id: 3,
        value: 'Ownership',
      ),
      const ManagementPlanGroupItem(
        id: 4,
        value: 'Work Plan',
      ),
      const ManagementPlanGroupItem(
        id: 5,
        value: 'Work Plan',
      ),
      const ManagementPlanGroupItem(
        id: 6,
        value: 'Work Plan',
      ),
    ],
  ),
  ManagementPlanGroup(
    groupTitle: 'Work Orders',
    groupItems: [],
  ),
  ManagementPlanGroup(
    groupTitle: 'Harvesting',
    groupItems: [],
  ),
];

class ManagementPlanScreen extends StatefulWidget {
  const ManagementPlanScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ManagementPlanScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ManagementPlanScreen(),
      ),
    );
  }
}

class _ManagementPlanScreenState extends State<ManagementPlanScreen> {
  late List<ManagementPlanGroup> listData;

  @override
  void initState() {
    super.initState();
    listData = _mockData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.managementPlan.tr(),
        subtitle: LocaleKeys.imbeza.tr(),
        subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: ListView.separated(
        itemCount: listData.length,
        padding: const EdgeInsets.symmetric(vertical: 24),
        itemBuilder: (context, index) {
          return ExpandableManagementPlanItem(
            managementPlanGroup: listData[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 24,
        ),
      ),
    );
  }
}
