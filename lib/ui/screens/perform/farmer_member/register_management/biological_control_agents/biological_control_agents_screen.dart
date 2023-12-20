import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/biological_control_agents/add_biological_control_agents/add_biological_control_agents_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class BiologicalControlAgentsScreen extends BaseStatefulWidget {
  BiologicalControlAgentsScreen({
    super.key,
  }) : super(screenName: LocaleKeys.biological_control_agents.tr());

  @override
  State<StatefulWidget> createState() => _BiologicalControlAgentsScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BiologicalControlAgentsScreen(),
      ),
    );
  }
}

class _BiologicalControlAgentsScreenState extends BaseStatefulWidgetState<BiologicalControlAgentsScreen> {
  final List<BiologicalControlAgent> items = [];
  bool isLoading = true;

  Timer? _debounceInputTimer;
  late List<BiologicalControlAgent> filteredItems;
  late StatusFilterEnum statusFilter = StatusFilterEnum.open;
  String? inputSearch;

  var stakeHolders = <StakeHolder>[];
  var monitorings = <MonitoringRequirement>[];
  var agentTypes = <BiologicalControlAgentType>[];
  List<Country> countries = <Country>[];
  @override
  void initState() {
    super.initState();
    _init();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final farm = await configService.getActiveFarm();

      monitorings = await cmoDatabaseMasterService
          .getMonitoringRequirementByGroupSchemeId(farm?.groupSchemeId ?? 0);

      agentTypes = await cmoDatabaseMasterService
          .getBiologicalControlAgentTypeByGroupSchemeId(
        farm?.groupSchemeId ?? 0,
      );

      countries = await cmoDatabaseMasterService.getCountry();

      stakeHolders = await cmoDatabaseMasterService.getStakeHolders();
      // final farmStakeHolders = await cmoDatabaseMasterService
      //     .getFarmStakeHolderByFarmId(farm?.farmId ?? '');
      //
      // for (final item in farmStakeHolders) {
      //   final stakeholders = await cmoDatabaseMasterService
      //       .getStakeHoldersByStakeHolderId(item.stakeHolderId ?? '');
      //   stakeHolders.addAll(stakeholders);
      // }

      if (context.mounted) setState(() {});
    });
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

  String getCountryNameByCountryId(int? countryId) {
    final country = countries.firstWhereOrNull((element) => element.countryId == countryId);
    return country?.countryName == null ? '' : country!.countryName!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.biological_control_agents.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
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

                        final agentType = agentTypes.firstWhereOrNull((e) =>
                            e.biologicalControlAgentTypeId ==
                            filteredItems[index].biologicalControlAgentTypeId);
                        final monitoringName = monitorings
                            .firstWhereOrNull((e) =>
                                e.monitoringRequirementId ==
                                item.monitoringRequirementId)
                            ?.monitoringRequirementName;
                        final stakeholderName = stakeHolders
                            .firstWhereOrNull(
                                (e) => e.stakeHolderId == item.stakeholderId)
                            ?.stakeholderName;

                        final itemMapping = item.copyWith(
                          biologicalControlAgentTypeId:
                              agentType?.biologicalControlAgentTypeId,
                          biologicalControlAgentTypeName:
                              agentType?.biologicalControlAgentTypeName,
                          biologicalControlAgentTypeCountryName: getCountryNameByCountryId(agentType?.countryId),
                          reasonForBioAgent: agentType?.reasonForBioAgent,
                          biologicalControlAgentTypeScientificName: agentType
                              ?.biologicalControlAgentTypeScientificName,
                          monitoringRequirementName: monitoringName,
                          stakeholderName: stakeholderName,
                        );

                        return GestureDetector(
                          onTap: () async {
                            final result =
                                await AddBiologicalControlAgentsScreen.push(
                              context,
                              agent: itemMapping,
                            );
                            if (result == null) return;
                            filteredItems[index] = result;
                            setState(() {});
                          },
                          child: RegisterItem(
                            title: '${LocaleKeys.bca_no.tr()}: ${itemMapping.biologicalControlAgentRegisterNo?.toString()}',
                            mapData: generateInformationMapData(itemMapping),
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

  Map<String, String?> generateInformationMapData(BiologicalControlAgent registerItem) {
    return {
      LocaleKeys.nameOfControlAgent.tr(): registerItem.biologicalControlAgentTypeName,
      LocaleKeys.scientificName.tr(): registerItem.biologicalControlAgentTypeScientificName,
      LocaleKeys.countryOfOrigin.tr(): registerItem.biologicalControlAgentTypeCountryName,
      LocaleKeys.reasonForBioAgent.tr(): registerItem.reasonForBioAgent,
      LocaleKeys.dateReleased.tr(): registerItem.dateReleased.ddMMYyyy(),
      LocaleKeys.stakeholderName.tr(): registerItem.stakeholderName,
      LocaleKeys.description.tr(): registerItem.monitoringRequirementName,
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }
}
