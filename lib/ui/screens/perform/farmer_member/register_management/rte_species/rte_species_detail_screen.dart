import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/custom_camera_component/custom_camera_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/components/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/information_text_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/rte_species/widgets/rte_species_photo_section.dart';

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
      onTap: FocusManager.instance.primaryFocus?.unfocus,
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
                  AttributeItem(
                    margin: const EdgeInsets.symmetric(horizontal: 21),
                    isUnderErrorBorder: true,
                    errorText: LocaleKeys.required.tr(),
                    isShowError: state.isCommonNameError,
                    child: InputAttributeItem(
                      labelText: LocaleKeys.commonName.tr(),
                      textStyle: context.textStyles.bodyNormal.blueDark3,
                      labelTextStyle: context.textStyles.bodyBold.blueDark3,
                      validator: requiredValidator,
                      hintTextStyle: context.textStyles.bodyBold.black,
                      initialValue: state.rteSpecies?.commonName,
                      onChanged: context
                          .read<RteSpeciesDetailCubit>()
                          .onChangeCommonName,
                    ),
                  ),
                  buildLatLngWidget(),
                  RteSpeciesPhotoSection(
                    navigateToCamera: navigateToCamera,
                    onRemove: context.read<RteSpeciesDetailCubit>().onRemovePhoto,
                  ),
                  buildSelectDateSpotted(state),
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
                  InformationText(),
                  CmoHeaderTile(
                    title: LocaleKeys.additional_details_optional.tr(),
                    backgroundColor: context.colors.blueDark2,
                  ),
                  selectSpeciesType(context, state),
                  AttributeItem(
                    margin: const EdgeInsets.symmetric(horizontal: 21),
                    child: InputAttributeItem(
                      textStyle: context.textStyles.bodyNormal.blueDark2,
                      labelTextStyle: context.textStyles.bodyNormal.blueDark2,
                      labelText: LocaleKeys.scientificName.tr(),
                      initialValue: state.rteSpecies?.scientificName,
                      onChanged: context
                          .read<RteSpeciesDetailCubit>()
                          .onChangeScientificName,
                    ),
                  ),
                  selectSpeciesRange(context, state),
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
    return BlocSelector<RteSpeciesDetailCubit, RteSpeciesDetailState, bool>(
      selector: (state) => state.loading,
      builder: (context, loading) {
        return CmoFilledButton(
          title: LocaleKeys.save.tr(),
          loading: loading,
          disable: context.read<RteSpeciesDetailCubit>().state.rteSpecies?.latitude == null,
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

  Widget selectSpeciesType(BuildContext context, RteSpeciesDetailState state) {
    return BottomSheetSelection(
      hintText: LocaleKeys.speciesType.tr(),
      hintTextStyle: context.textStyles.bodyNormal.blueDark2,
      value: state.rteSpecies?.animalTypeName,
      margin: const EdgeInsets.symmetric(horizontal: 21),
      displayHorizontal: false,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      onTap: () async {
        FocusManager.instance.primaryFocus?.unfocus();
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
      hintTextStyle: context.textStyles.bodyNormal.blueDark2,
      displayHorizontal: false,
      margin: const EdgeInsets.symmetric(horizontal: 21),
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
      margin: const EdgeInsets.symmetric(horizontal: 21),
      child: CmoDatePicker(
        name: 'DateSpotted',
        hintText: LocaleKeys.date.tr(),
        lastDate: DateTime.now(),
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
          hintText: LocaleKeys.date.tr(),
          hintStyle: context.textStyles.bodyNormal.blueDark2,
          labelText: LocaleKeys.date.tr(),
          labelStyle: context.textStyles.bodyNormal.blueDark2,
        ),
      ),
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
              title: LocaleKeys.rteSpecies.tr(),
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
}
