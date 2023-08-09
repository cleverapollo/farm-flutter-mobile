import 'dart:async';

import 'package:cmo/di.dart';
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

class _BiologicalControlAgentsScreenState
    extends State<BiologicalControlAgentsScreen> {
  final List<BiologicalControlAgent> items = [];
  bool isLoading = true;

  Timer? _debounceInputTimer;
  late List<BiologicalControlAgent> filteredItems;
  late StatusFilterEnum statusFilter = StatusFilterEnum.open;
  String? inputSearch;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    items.clear();
    final farm = await configService.getActiveFarm();
    items.addAll(await cmoDatabaseMasterService
        .getBiologicalControlAgentByFarmId(farm!.farmId));
    isLoading = false;
    filteredItems = items;
    inputSearch = '';
    applyFilter();
  }

  void searching(String? input) {
    inputSearch = input;
    if (input == null || input.isEmpty) {
      applyFilter();
    } else {
      filteredItems = items.where((element) {
        final containName = element.biologicalControlAgentName
                ?.toLowerCase()
                .contains(input.toLowerCase()) ??
            false;
        var isFilter = false;
        switch (statusFilter) {
          case StatusFilterEnum.open:
            isFilter = element.dateReleased == null;
            break;
          case StatusFilterEnum.closed:
            isFilter = element.dateReleased != null;
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
          filteredItems =
              items.where((element) => element.dateReleased == null).toList();
          break;
        case StatusFilterEnum.closed:
          filteredItems =
              items.where((element) => element.dateReleased != null).toList();
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
        onTapTrailing: () async {
          final result = await AddBiologicalControlAgentsScreen.push(context);
          if (result != null) {
            await _init();
          }
        },
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
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
                        _debounceInputTimer = Timer(
                            const Duration(milliseconds: 200),
                            () => searching(input));
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
                        final item = filteredItems[index];
                        return GestureDetector(
                          onTap: () async {
                            final result =
                                await AddBiologicalControlAgentsScreen.push(
                                  context,
                                  agent: item,
                                );
                            if (result == null) return;
                            filteredItems[index] = result;
                            setState(() {});
                          },
                          child: _BiologicalControlAgentItem(
                            agent: item,
                          ),
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
            '${LocaleKeys.complaintNo.tr()}: ${agent.biologicalControlAgentTypeId?.toString()}',
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
            valueLabel: agent.biologicalControlAgentName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.scientificName.tr(),
            valueLabel: agent.biologicalControlAgentTypeScientificName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.countryOfOrigin.tr(),
            valueLabel: agent.biologicalControlAgentTypeCountryName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.reasonForBioAgent.tr(),
            valueLabel: agent.reasonForBioAgent,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateReleased.tr(),
            valueLabel: agent.dateReleased?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.stakeholderName.tr(),
            valueLabel: agent.stakeholderName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.description.tr(),
            valueLabel: agent.issueDescription,
          ),
          GeneralCommentsItem(
            comment: agent.comment,
          ),
        ],
      ),
    );
  }
}
