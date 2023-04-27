import 'dart:async';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/biological_control_agents/add_biological_control_agents/add_biological_control_agents_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comments_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/key_value_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

List<BiologicalControlAgent> _mockData = [
  BiologicalControlAgent(
    biologicalControlAgentId: DateTime.now().millisecondsSinceEpoch,
    generalComments: 'generalComments',
    descriptionMonitoringRequirements: '',
    stakeholderName: 'Captain planet',
    scientificName: 'Hocus Pocus',
    countryOrigin: 'South Africa',
    reasonBioAgent: 'Eats the pest',
    nameControlAgent: 'West Indian Rooster 1',
    dateReleased: DateTime(2023, 4, 20).toString(),
  ),
  BiologicalControlAgent(
    biologicalControlAgentId: DateTime.now().millisecondsSinceEpoch,
    generalComments: 'generalComments',
    countryOrigin: 'South Africa',
    descriptionMonitoringRequirements: '',
    stakeholderName: 'Captain planet',
    scientificName: 'Hocus Pocus',
    reasonBioAgent: 'Eats the pest',
    nameControlAgent: 'West Indian Rooster 2',
  ),
  BiologicalControlAgent(
    biologicalControlAgentId: DateTime.now().millisecondsSinceEpoch,
    generalComments: 'generalComments',
    countryOrigin: 'South Africa',
    descriptionMonitoringRequirements: '',
    stakeholderName: 'Captain planet',
    scientificName: 'Hocus Pocus',
    reasonBioAgent: 'Eats the pest',
    nameControlAgent: 'West Indian Rooster 3',
  ),
  BiologicalControlAgent(
    biologicalControlAgentId: DateTime.now().millisecondsSinceEpoch,
    generalComments: 'generalComments',
    countryOrigin: 'South Africa',
    descriptionMonitoringRequirements: '',
    stakeholderName: 'Captain planet',
    scientificName: 'Hocus Pocus',
    reasonBioAgent: 'Eats the pest',
    nameControlAgent: 'West Indian Rooster 4',
  ),
];

class BiologicalControlAgentsScreen extends StatefulWidget {
  const BiologicalControlAgentsScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _BiologicalControlAgentsScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const BiologicalControlAgentsScreen(),
      ),
    );
  }
}

class _BiologicalControlAgentsScreenState extends State<BiologicalControlAgentsScreen> {
  Timer? _debounceInputTimer;
  late List<BiologicalControlAgent> filteredItems;
  late StatusFilterEnum statusFilter;
  String? inputSearch;

  @override
  void initState() {
    super.initState();
    filteredItems = _mockData;
    statusFilter = StatusFilterEnum.open;
    inputSearch = '';
    applyFilter();
  }

  void searching(String? input) {
    inputSearch = input;
    if (input == null || input.isEmpty) {
      applyFilter();
    } else {
      filteredItems = _mockData.where((element) {
        final containName = element.nameControlAgent?.toLowerCase().contains(input.toLowerCase()) ?? false;
        var isFilter = false;
        switch (statusFilter) {
          case StatusFilterEnum.open:
            isFilter = element.dateReleased.isNull || (element.dateReleased?.isEmpty ?? false);
            break;
          case StatusFilterEnum.closed:
            isFilter = element.dateReleased?.isNotEmpty ?? false;
            break;
        }

        return containName && isFilter;
      }).toList();
      setState(() {});
    }
  }

  void applyFilter() {
    if (inputSearch == null || inputSearch!.isEmpty) {
      switch (statusFilter) {
        case StatusFilterEnum.open:
          filteredItems = _mockData
              .where((element) => element.dateReleased.isNull || (element.dateReleased?.isEmpty ?? false))
              .toList();
          break;
        case StatusFilterEnum.closed:
          filteredItems = _mockData.where((element) => element.dateReleased?.isNotEmpty ?? false).toList();
          break;
      }
    } else {
      searching(inputSearch);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.biological_control_agents.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddBiologicalControlAgentsScreen.push(context),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
              child: CmoTextField(
                name: LocaleKeys.search.tr(),
                hintText: LocaleKeys.search.tr(),
                suffixIcon: Assets.icons.icSearch.svg(),
                onChanged: (input) {
                  _debounceInputTimer?.cancel();
                  _debounceInputTimer = Timer(const Duration(milliseconds: 200), () => searching(input));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 21, 16),
              child: StatusFilterWidget(
                onSelectFilter: (statusFilterEnum) {
                  statusFilter = statusFilterEnum;
                  applyFilter();
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 22,
                ),
                itemCount: filteredItems.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                ),
                itemBuilder: (context, index) {
                  return _BiologicalControlAgentItem(
                    agent: filteredItems[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BiologicalControlAgentItem extends StatelessWidget {
  const _BiologicalControlAgentItem({
    required this.agent,
  });

  final BiologicalControlAgent agent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colors.greyD9D9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${LocaleKeys.complaintNo.tr()}: ${agent.biologicalControlAgentId?.toString()}',
            style: context.textStyles.bodyBold.blue,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6,
            ),
            child: Divider(
              color: context.colors.blueDark2,
              height: 1,
            ),
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.nameOfControlAgent.tr(),
            valueLabel: agent.nameControlAgent,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.scientificName.tr(),
            valueLabel: agent.scientificName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.countryOfOrigin.tr(),
            valueLabel: agent.countryOrigin,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.reasonForBioAgent.tr(),
            valueLabel: agent.reasonBioAgent,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateReleased.tr(),
            valueLabel: DateTime.tryParse(agent.dateReleased ?? '')?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.stakeholderName.tr(),
            valueLabel: agent.stakeholderName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.description.tr(),
            valueLabel: agent.descriptionMonitoringRequirements,
          ),
          GeneralCommentsItem(
            comment: agent.generalComments,
          ),
        ],
      ),
    );
  }
}
