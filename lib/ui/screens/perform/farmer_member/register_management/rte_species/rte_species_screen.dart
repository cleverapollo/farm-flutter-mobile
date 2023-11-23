import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/register_management/rte_species/rte_species_cubit.dart';

import 'package:cmo/ui/components/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/key_value_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rte_species_detail_screen.dart';

class RteSpeciesScreen extends BaseStatefulWidget {
  RteSpeciesScreen({super.key}) : super(screenName: LocaleKeys.rteSpecies.tr());

  @override
  State<StatefulWidget> createState() => _RteSpeciesScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RteSpeciesScreen(),
      ),
    );
  }
}

class _RteSpeciesScreenState extends BaseStatefulWidgetState<RteSpeciesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<RteSpeciesCubit>().init();
    });
  }

  Future<void> navigateToDetail({RteSpecies? rteSpecies}) async {
    final locationModel = LocationModel()
      ..latitude = rteSpecies?.latitude
      ..longitude = rteSpecies?.longitude;
    await RteSpeciesDetailScreen.push(
      context,
      rteSpecies: rteSpecies,
      locationModel: locationModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.rteSpecies.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
        onTapTrailing: navigateToDetail,
      ),
      body: BlocBuilder<RteSpeciesCubit, RteSpeciesState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 22,
            ),
            itemCount: state.filterRteSpecies.length,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 21,
              right: 21,
              top: 24,
            ),
            itemBuilder: (context, index) {
              final item = state.filterRteSpecies[index];
              return GestureDetector(
                onTap: () async {
                  await navigateToDetail(rteSpecies: item);
                },
                child: _RteSpeciesItem(
                  rteSpecies: item,
                ),
              );
            },
          );
        },
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
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${LocaleKeys.rteSpecies.tr()}: ${rteSpecies.rteSpeciesRegisterNo?.toString()}',
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
            keyLabel: LocaleKeys.speciesType.tr(),
            valueLabel: rteSpecies.animalTypeName,
            backgroundColor: context.colors.greyLight1,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.commonName.tr(),
            valueLabel: rteSpecies.commonName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateSpotted.tr(),
            valueLabel: rteSpecies.dateSpotted.yMd(),
            backgroundColor: context.colors.greyLight1,
          ),
        ],
      ),
    );
  }
}
