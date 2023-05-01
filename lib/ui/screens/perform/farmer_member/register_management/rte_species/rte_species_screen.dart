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

List<RteSpecies> _mockData = [
  RteSpecies(
    rteSpeciesId: DateTime.now().millisecondsSinceEpoch,
    speciesType: 'Ant',
    scientificName: 'Ant Scientific Name',
    commonName: 'Ant common name',
    speciesRange: 'Species Range',
    location: 'Location',
    generalComments: 'generalComments',
    dateSpotted: DateTime(2023, 4, 20).toString(),
    campName: 'campName',
  ),
  RteSpecies(
    rteSpeciesId: DateTime.now().millisecondsSinceEpoch + 1,
    speciesType: 'Ant 1',
    scientificName: 'Ant Scientific Name 1',
    commonName: 'Ant common name 1',
    speciesRange: 'Species Range 1',
    location: 'Location 1',
    generalComments: 'generalComments 1',
    campName: 'campName 1',
  ),
  RteSpecies(
    rteSpeciesId: DateTime.now().millisecondsSinceEpoch + 2,
    speciesType: 'Ant 2',
    scientificName: 'Ant Scientific Name 2',
    commonName: 'Ant common name 2',
    speciesRange: 'Species Range 2',
    location: 'Location 2',
    generalComments: 'generalComments 2',
    campName: 'campName 2',
  ),
  RteSpecies(
    rteSpeciesId: DateTime.now().millisecondsSinceEpoch + 3,
    speciesType: 'Ant 3',
    scientificName: 'Ant Scientific Name 3',
    commonName: 'Ant common name 3',
    speciesRange: 'Species Range 3',
    location: 'Location 3',
    generalComments: 'generalComments 3',
  ),
  RteSpecies(
    rteSpeciesId: DateTime.now().millisecondsSinceEpoch + 4,
    speciesType: 'Ant 4',
    scientificName: 'Ant Scientific Name 4',
    commonName: 'Ant common name 4',
    speciesRange: 'Species Range 4',
    location: 'Location 4',
    generalComments: 'generalComments 4',
  ),
];

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
  Timer? _debounceInputTimer;
  late List<RteSpecies> filteredItems;
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
        final containName = element.rteSpeciesId
                .toString()
                .toLowerCase()
                .contains(input.toLowerCase()) ??
            false;
        var isFilter = false;
        switch (statusFilter) {
          case StatusFilterEnum.open:
            isFilter = element.dateSpotted.isNull ||
                (element.dateSpotted?.isEmpty ?? false);
            break;
          case StatusFilterEnum.closed:
            isFilter = element.dateSpotted?.isNotEmpty ?? false;
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
              .where(
                (element) =>
                    element.dateSpotted.isNull ||
                    (element.dateSpotted?.isEmpty ?? false),
              )
              .toList();
          break;
        case StatusFilterEnum.closed:
          filteredItems = _mockData
              .where((element) => element.dateSpotted?.isNotEmpty ?? false)
              .toList();
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
                  return _RteSpeciesItem(
                    rteSpecies: filteredItems[index],
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
            '${LocaleKeys.speciesNo.tr()}: ${rteSpecies.rteSpeciesId?.toString()}',
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
          KeyValueItemWidget(
            keyLabel: LocaleKeys.speciesType.tr(),
            valueLabel: rteSpecies.speciesType,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.speciesRange.tr(),
            valueLabel: rteSpecies.speciesRange,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateSpotted.tr(),
            valueLabel:
                DateTime.tryParse(rteSpecies.dateSpotted ?? '')?.ddMMYyyy(),
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
            comment: rteSpecies.generalComments,
          ),
        ],
      ),
    );
  }
}
