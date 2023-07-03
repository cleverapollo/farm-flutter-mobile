import 'dart:async';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/rte_species/add_rte_species/add_rte_species_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comments_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/key_value_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

import '../../../../../../di.dart';

class RteSpeciesScreen extends StatefulWidget {
  const RteSpeciesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RteSpeciesScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RteSpeciesScreen(),
      ),
    );
  }
}

class _RteSpeciesScreenState extends State<RteSpeciesScreen> {
  final List<RteSpecies> items = [];
  bool isLoading = true;

  Timer? _debounceInputTimer;
  late List<RteSpecies> filteredItems;
  late StatusFilterEnum statusFilter;
  String? inputSearch;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final farm = await configService.getActiveFarm();
    items.addAll(
        await cmoDatabaseMasterService.getRteSpeciesByFarmId(farm!.farmId));
    isLoading = false;

    filteredItems = items;
    statusFilter = StatusFilterEnum.open;
    inputSearch = '';
    applyFilter();
  }

  void searching(String? input) {
    inputSearch = input;
    if (input == null || input.isEmpty) {
      applyFilter();
    } else {
      filteredItems = items.where((element) {
        final containName = element.rteSpeciesRegisterId
            .toString()
            .toLowerCase()
            .contains(input.toLowerCase());
        var isFilter = false;
        switch (statusFilter) {
          case StatusFilterEnum.open:
            isFilter = element.dateSpotted == null;
            break;
          case StatusFilterEnum.closed:
            isFilter = element.dateSpotted != null;
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
          filteredItems = items
              .where(
                (element) => element.dateSpotted == null,
              )
              .toList();
          break;
        case StatusFilterEnum.closed:
          filteredItems =
              items.where((element) => element.dateSpotted != null).toList();
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
        title: LocaleKeys.rteSpecies.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddRteSpeciesScreen.push(context),
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
                  _debounceInputTimer = Timer(
                    const Duration(milliseconds: 200),
                    () => searching(input),
                  );
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
                      final result = await AddRteSpeciesScreen.push(context,
                          rteSpecies: item);
                      if (result == null) return;
                      filteredItems[index] = result;
                      setState(() {});
                    },
                    child: _RteSpeciesItem(
                      rteSpecies: item,
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

class _RteSpeciesItem extends StatelessWidget {
  const _RteSpeciesItem({
    required this.rteSpecies,
  });

  final RteSpecies rteSpecies;

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
            '${LocaleKeys.speciesNo.tr()}: ${rteSpecies.rteSpeciesRegisterNo?.toString()}',
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
            keyLabel: LocaleKeys.commonName.tr(),
            valueLabel: rteSpecies.commonName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.scientificName.tr(),
            valueLabel: rteSpecies.scientificName,
          ),
          // KeyValueItemWidget(
          //   keyLabel: LocaleKeys.speciesType.tr(),
          //   valueLabel: rteSpecies.speciesType,
          // ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.speciesRange.tr(),
            valueLabel: rteSpecies.speciesRangeName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateSpotted.tr(),
            valueLabel: rteSpecies.dateSpotted?.ddMMYyyy(),
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.camp.tr(),
            valueLabel: rteSpecies.location,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.location.tr(),
            valueLabel: rteSpecies.location,
          ),
          GeneralCommentsItem(
            comment: rteSpecies.comment,
          ),
        ],
      ),
    );
  }
}
