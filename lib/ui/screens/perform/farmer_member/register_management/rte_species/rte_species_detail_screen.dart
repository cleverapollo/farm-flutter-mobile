import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/custom_camera_component/custom_camera_screen.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_photo_section.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/components/select_location/select_location_screen.dart';

class RteSpeciesDetailScreen extends BaseStatefulWidget {
  RteSpeciesDetailScreen({
    super.key,
    this.isEditing = false,
  }) : super(
          screenName: isEditing
              ? LocaleKeys.edit_rte_species.tr()
              : LocaleKeys.addRteSpecies.tr(),
        );

  final bool isEditing;

  @override
  State<StatefulWidget> createState() => _RteSpeciesDetailScreenState();

  static Future<RteSpecies?> push(
    BuildContext context, {
    RteSpecies? rteSpecies,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => RteSpeciesDetailCubit(
            rteSpecies: rteSpecies,
          ),
          child: RteSpeciesDetailScreen(
            isEditing: rteSpecies != null,
          ),
        ),
      ),
    );
  }
}

class _RteSpeciesDetailScreenState extends BaseStatefulWidgetState<RteSpeciesDetailScreen> {

  Timer? debounceInputTimer;

  Future<void> navigateToCamera() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (context.read<RteSpeciesDetailCubit>().reactMaximumUploadedPhoto()) {
      return;
    }

    await CustomCameraScreen.push(
      context,
      onDone: context.read<RteSpeciesDetailCubit>().onUpdatePhoto,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CmoAppBar(
          title: widget.isEditing
              ? LocaleKeys.edit_rte_species.tr()
              : LocaleKeys.addRteSpecies.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: BlocBuilder<RteSpeciesDetailCubit, RteSpeciesDetailState>(
            builder: (context, state) {
              return Column(
                children: [
                  CmoHeaderTile(
                    title: LocaleKeys.species.tr(),
                    backgroundColor: context.colors.blueDark2,
                  ),
                  selectCommonName(),
                  buildLatLngWidget(),
                  buildPhotoSection(),
                  buildSelectDateSpotted(),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: GeneralCommentWidget(
                      height: 100,
                      textStyle: context.textStyles.bodyNormal.blueDark2,
                      shouldShowTitle: true,
                      hintText: '',
                      initialValue: state.rteSpecies?.comment,
                      onChanged: context.read<RteSpeciesDetailCubit>().onChangeComment,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CmoHeaderTile(
                    title: LocaleKeys.additional_details_optional.tr(),
                    backgroundColor: context.colors.blueDark2,
                  ),
                  buildAutofillWidget(),
                ],
              );
            },
          ),
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return BlocBuilder<RteSpeciesDetailCubit, RteSpeciesDetailState>(
      builder: (context, state) {
        return CmoFilledButton(
          title: LocaleKeys.save.tr(),
          loading: state.loading,
          disable: !context.read<RteSpeciesDetailCubit>().onValidateRequiredField(),
          onTap: () async {
            await context.read<RteSpeciesDetailCubit>().onSave(
              onSuccess: (rteSpeciesId) async {
                showSnackSuccess(
                  msg:
                      '${widget.isEditing ? LocaleKeys.edit_rte_species.tr() : LocaleKeys.addRteSpecies.tr()} $rteSpeciesId',
                );
                await context.read<RteSpeciesCubit>().loadRteSpecies();
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            );
          },
        );
      },
    );
  }

  Widget selectCommonName() {
    return BlocBuilder<RteSpeciesDetailCubit, RteSpeciesDetailState>(
      builder: (context, state) {
        return BottomSheetSelection(
          hintText: LocaleKeys.commonName.tr(),
          margin: const EdgeInsets.symmetric(horizontal: 21),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: state.selectedGroupSchemeMasterSpecies?.commonName,
          displayHorizontal: false,
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.filterGroupSchemeMasterSpecies.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CmoTextField(
                      name: LocaleKeys.search.tr(),
                      hintText: LocaleKeys.search.tr(),
                      prefixIcon: Assets.icons.icSearch.svg(),
                      onChanged: (input) {
                        debounceInputTimer?.cancel();
                        debounceInputTimer = Timer(
                          const Duration(milliseconds: 200),
                          () => context
                              .read<RteSpeciesDetailCubit>()
                              .searchGroupSchemeMasterSpecies(input),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocSelector<RteSpeciesDetailCubit,
                        RteSpeciesDetailState, List<GroupSchemeMasterSpecies>>(
                      selector: (state) => state.filterGroupSchemeMasterSpecies,
                      builder: (context, filterGroupSchemeMasterSpecies) {
                        return ListView.builder(
                          itemCount: filterGroupSchemeMasterSpecies.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () async {
                                await context
                                    .read<RteSpeciesDetailCubit>()
                                    .updateSelectedGroupSchemeMasterSpecies(
                                        filterGroupSchemeMasterSpecies[index]);
                                Navigator.pop(context);
                              },
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              title: Text(
                                filterGroupSchemeMasterSpecies[index]
                                        .commonName ??
                                    '',
                                style: context.textStyles.bodyBold.blueDark2,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildAutofillWidget() {
    return BlocSelector<RteSpeciesDetailCubit, RteSpeciesDetailState, GroupSchemeMasterSpecies?>(
      selector: (state) => state.selectedGroupSchemeMasterSpecies,
      builder: (context, selectedGroupSchemeMasterSpecies) {
        return Column(
          children: [
            AutofillWidget(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              title: LocaleKeys.secondary_name.tr(),
              value: selectedGroupSchemeMasterSpecies?.commonName2,
              textStyle: context.textStyles.bodyNormal.grey,
              underlineColor: context.colors.grey,
            ),
            AutofillWidget(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              title: LocaleKeys.speciesType.tr(),
              value: selectedGroupSchemeMasterSpecies?.animalTypeName,
              textStyle: context.textStyles.bodyNormal.grey,
              underlineColor: context.colors.grey,
            ),
            AutofillWidget(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              title: LocaleKeys.scientificName.tr(),
              value: selectedGroupSchemeMasterSpecies?.scientificName,
              textStyle: context.textStyles.bodyNormal.grey,
              underlineColor: context.colors.grey,
            ),

            AutofillWidget(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              title: LocaleKeys.species_range.tr(),
              value: selectedGroupSchemeMasterSpecies?.speciesRangeName,
              textStyle: context.textStyles.bodyNormal.grey,
              underlineColor: context.colors.grey,
            ),
            AutofillWidget(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              title: LocaleKeys.endangered_status.tr(),
              value: selectedGroupSchemeMasterSpecies?.endangeredStatusName,
              textStyle: context.textStyles.bodyNormal.grey,
              underlineColor: context.colors.grey,
            ),

            AutofillWidget(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              title: LocaleKeys.buffer_zone_distance.tr(),
              value: selectedGroupSchemeMasterSpecies?.bufferZoneDistance,
              textStyle: context.textStyles.bodyNormal.grey,
              underlineColor: context.colors.grey,
            ),
          ],
        );
      },
    );
  }

  Widget buildSelectDateSpotted() {
    return BlocBuilder<RteSpeciesDetailCubit, RteSpeciesDetailState>(
      builder: (context, state) {
        return AttributeItem(
          margin: const EdgeInsets.symmetric(horizontal: 21),
          child: DatePickerWidget(
            lastDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
            title: LocaleKeys.date.tr(),
            titleStyle: context.textStyles.bodyNormal.blueDark2,
            initialDate: state.rteSpecies?.dateSpotted,
            onConfirm: context.read<RteSpeciesDetailCubit>().onChangeDateSpotted,
          ),
        );
      },
    );
  }

  Widget buildLatLngWidget() {
    return BlocBuilder<RteSpeciesDetailCubit, RteSpeciesDetailState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            final locationModel = LocationModel()
              ..longitude = state.rteSpecies?.longitude
              ..latitude = state.rteSpecies?.latitude;

            final result = await SelectLocationScreen.push(
              context,
              title: LocaleKeys.rte_species.tr(),
              farmName: state.activeFarm?.farmName,
              locationModel: locationModel,
              shouldShowPhotoButton: false,
              shouldShowBackIcon: true,
              saveTitle: LocaleKeys.save.tr(),
            );

            if (result == null) return;
            context.read<RteSpeciesDetailCubit>().onChangeLocation(result as LocationModel);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            margin: const EdgeInsets.symmetric(horizontal: 21),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.colors.blueDark2,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  LocaleKeys.lat_long.tr(),
                  style: context.textStyles.bodyBold.blueDark2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Text(
                    state.rteSpecies?.latitude == null
                        ? ''
                        : '${state.rteSpecies?.latitude?.toStringAsFixed(5)} , ${state.rteSpecies?.longitude?.toStringAsFixed(5)}',
                    style: context.textStyles.bodyNormal.blueDark2,
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
      },
    );
  }

  Widget buildPhotoSection() {
    return BlocBuilder<RteSpeciesDetailCubit, RteSpeciesDetailState>(
      builder: (context, state) {
        return RegisterPhotoSection(
          navigateToCamera: navigateToCamera,
          photos: state.rtePhotos
              .map(
                (e) => RegisterPhotoModel(
              photo: e.photo,
              photoId: e.rteSpeciesRegisterPhotoId,
            ),
          )
              .toList(),
          onRemove: context.read<RteSpeciesDetailCubit>().onRemovePhoto,
        );
      },
    );
  }
}
