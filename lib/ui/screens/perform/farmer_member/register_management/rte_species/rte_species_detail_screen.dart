import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/rte_species/rte_species_map_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resource_manager/asi/widgets/bottom_sheet_selection.dart';
import '../select_location/select_location_screen.dart';
import 'widgets/rte_species_photo.dart';

class RteSpeciesDetailScreen extends StatefulWidget {
  const RteSpeciesDetailScreen({
    super.key,
    this.rteSpecies,
  });

  final RteSpecies? rteSpecies;

  @override
  State<StatefulWidget> createState() => _RteSpeciesDetailScreenState();

  static Future<RteSpecies?> push(
    BuildContext context, {
    RteSpecies? rteSpecies,
    LocationModel? locationModel,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => RteSpeciesDetailCubit(
            rteSpecies: rteSpecies,
          )..init(),
          child: RteSpeciesDetailScreen(
            rteSpecies: rteSpecies,
          ),
        ),
      ),
    );
  }
}

class _RteSpeciesDetailScreenState extends State<RteSpeciesDetailScreen> {
  final rtePhotos = <RteSpeciesPhotoModel>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoFarmAppBar.showTrailingAndFarmName(
          title: widget.rteSpecies == null
              ? LocaleKeys.addRteSpecies.tr()
              : 'Edit RTE Species',
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
                child:
                    BlocBuilder<RteSpeciesDetailCubit, RteSpeciesDetailState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        selectSpeciesType(context, state),
                        AttributeItem(
                          child: InputAttributeItem(
                            hintText: LocaleKeys.commonName.tr(),
                            validator: requiredValidator,
                            hintTextStyle: context.textStyles.bodyBold.black,
                            initialValue: state.rteSpecies?.commonName,
                            onChanged: context
                                .read<RteSpeciesDetailCubit>()
                                .onChangeCommonName,
                          ),
                        ),
                        AttributeItem(
                          child: InputAttributeItem(
                            hintText: LocaleKeys.scientificName.tr(),
                            hintTextStyle: context.textStyles.bodyBold.black,
                            initialValue: state.rteSpecies?.scientificName,
                            onChanged: context
                                .read<RteSpeciesDetailCubit>()
                                .onChangeScientificName,
                          ),
                        ),
                        selectSpeciesRange(context, state),
                        buildSelectDateSpotted(state),
                        buildLatLngWidget(state),
                        AttributeItem(
                          child: SizedBox(
                            height: 150,
                            child: GeneralCommentWidget(
                              hintText: LocaleKeys.generalComments.tr(),
                              initialValue: state.rteSpecies?.comment,
                              onChanged: context
                                  .read<RteSpeciesDetailCubit>()
                                  .onChangeComment,
                            ),
                          ),
                        ),
                        if (state.rtePhotos.isNotBlank)
                          ...state.rtePhotos.map(
                            (rteSpeciesPhotoModel) => RteSpeciesPhoto(
                              rteSpeciesPhotoModel: rteSpeciesPhotoModel,
                              onRemoved: () => context
                                  .read<RteSpeciesDetailCubit>()
                                  .onRemovePhoto(rteSpeciesPhotoModel),
                            ),
                          ),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Positioned.fill(
              bottom: MediaQuery.of(context).padding.bottom,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _buildButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    return BlocSelector<RteSpeciesDetailCubit, RteSpeciesDetailState, bool>(
      selector: (state) => state.loading,
      builder: (context, loading) {
        return CmoFilledButton(
          title: LocaleKeys.save.tr(),
          loading: loading,
          onTap: () async {
            final isValid = context.read<RteSpeciesDetailCubit>().onValidate();
            if (isValid) {
              await context.read<RteSpeciesDetailCubit>().onSave();
              await context.read<RteSpeciesCubit>().loadRteSpecies();
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            } else {
              return showSnackError(msg: 'Required fields are missing.');
            }
          },
        );
      },
    );
  }

  Widget selectSpeciesType(BuildContext context, RteSpeciesDetailState state) {
    return BottomSheetSelection(
      hintText: LocaleKeys.speciesType.tr(),
      value: state.rteSpecies?.animalTypeName,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      onTap: () async {
        FocusScope.of(context).unfocus();
        if (state.animalTypes.isBlank) return;
        await showCustomBottomSheet<void>(
          context,
          content: ListView.builder(
            itemCount: state.animalTypes.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context
                      .read<RteSpeciesDetailCubit>()
                      .onChangeSpeciesType(state.animalTypes[index]);
                  Navigator.pop(context);
                },
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    state.animalTypes[index].animalTypeName ?? '',
                    style: context.textStyles.bodyBold.copyWith(
                      color: context.colors.blueDark2,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget selectSpeciesRange(BuildContext context, RteSpeciesDetailState state) {
    return BottomSheetSelection(
      hintText: LocaleKeys.speciesRange.tr(),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      value: state.rteSpecies?.speciesRangeName,
      onTap: () async {
        FocusScope.of(context).unfocus();
        if (state.speciesRanges.isBlank) return;
        await showCustomBottomSheet<void>(
          context,
          content: ListView.builder(
            itemCount: state.speciesRanges.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context
                      .read<RteSpeciesDetailCubit>()
                      .onChangeSpeciesRange(state.speciesRanges[index]);
                  Navigator.pop(context);
                },
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    state.speciesRanges[index].speciesRangeName ?? '',
                    style: context.textStyles.bodyBold.copyWith(
                      color: context.colors.blueDark2,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildSelectDateSpotted(RteSpeciesDetailState state) {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateSpotted',
        hintText: LocaleKeys.dateSpotted.tr(),
        validator: (DateTime? value) {
          if (value == null) return null;
          if (value.millisecondsSinceEpoch >
              DateTime.now().millisecondsSinceEpoch) {
            return 'Date spotted cannot be in the future';
          }

          return null;
        },
        initialValue: state.rteSpecies?.dateSpotted,
        onChanged: context.read<RteSpeciesDetailCubit>().onChangeDateSpotted,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateSpotted.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateSpotted.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget buildLatLngWidget(RteSpeciesDetailState state) {
    return InkWell(
      onTap: () async {
        final locationModel = await RteSpeciesMapScreen.push(
          context,
          activeFarm: state.activeFarm,
          locationModel: LocationModel()
            ..longitude = state.rteSpecies?.longitude
            ..latitude = state.rteSpecies?.latitude,
        ) as LocationModel?;

        if (locationModel != null) {
          context
              .read<RteSpeciesDetailCubit>()
              .onChangeLocationAndPhoto(locationModel);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: context.colors.grey),
          ),
        ),
        child: Row(
          children: [
            Text(
              LocaleKeys.lat_long.tr(),
              style: context.textStyles.bodyBold.black,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Text(
                state.rteSpecies?.latitude == null
                    ? ''
                    : '${state.rteSpecies?.latitude?.toStringAsFixed(5)} | ${state.rteSpecies?.longitude?.toStringAsFixed(5)}',
                style: context.textStyles.bodyNormal.black,
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: context.colors.black,
              size: 32,
            )
          ],
        ),
      ),
    );
  }
}
