import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_location_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../resource_manager/asi/widgets/bottom_sheet_selection.dart';

class RteSpeciesDetailScreen extends StatefulWidget {
  const RteSpeciesDetailScreen({super.key, this.rteSpecies});

  final RteSpecies? rteSpecies;

  @override
  State<StatefulWidget> createState() => _RteSpeciesDetailScreenState();

  static Future<RteSpecies?> push(BuildContext context,
      {RteSpecies? rteSpecies}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (_) => RteSpeciesDetailCubit(rteSpecies: rteSpecies)..init(),
            child: RteSpeciesDetailScreen(rteSpecies: rteSpecies)),
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

  Future<void> onSubmit() async {
    // setState(() {
    //   autoValidateMode = AutovalidateMode.always;
    // });
    // if (_formKey.currentState?.saveAndValidate() ?? false) {
    //   var value = _formKey.currentState?.value;
    //   if (value == null) return;
    //   value = {...value};
    //
    //   setState(() {
    //     loading = true;
    //   });
    //   try {
    //     await hideInputMethod();
    //     final farm = await configService.getActiveFarm();
    //     rteSpecies = rteSpecies.copyWith(
    //       isActive: true,
    //       isMasterDataSynced: false,
    //       rteSpeciesRegisterId: null,
    //       rteSpeciesRegisterNo:
    //           DateTime.now().millisecondsSinceEpoch.toString(),
    //       farmId: farm?.farmId,
    //       dateSpotted: value['DateSpotted'] as DateTime?,
    //       animalTypeId: selectAnimalType?.animalTypeId,
    //       speciesRangeId: selectSpeciesRange?.speciesRangeId,
    //       animalTypeName: selectAnimalType?.animalTypeName,
    //       speciesRangeName: selectSpeciesRange?.speciesRangeName,
    //     );
    //
    //     if (carRaised && rteSpecies.carRaisedDate == null) {
    //       rteSpecies = rteSpecies.copyWith(
    //         carRaisedDate: DateTime.now().toIso8601String(),
    //       );
    //     }
    //
    //     if (carClosed && rteSpecies.carClosedDate == null) {
    //       rteSpecies = rteSpecies.copyWith(
    //         carClosedDate: DateTime.now().toIso8601String(),
    //       );
    //     }
    //
    //     int? resultId;
    //
    //     if (mounted) {
    //       final databaseService = cmoDatabaseMasterService;
    //
    //       final futures = <Future<void>>[];
    //
    //       for (final item in rtePhotos) {
    //         futures.add(cmoDatabaseMasterService.cacheRteSpeciesPhotoModel(
    //             item.copyWith(rteSpeciesNo: rteSpecies.rteSpeciesRegisterNo)));
    //       }
    //
    //       await Future.wait(futures);
    //
    //       await (await databaseService.db).writeTxn(() async {
    //         resultId = await databaseService.cacheRteSpecies(rteSpecies);
    //       });
    //     }
    //
    //     if (resultId != null) {
    //       if (context.mounted) {
    //         showSnackSuccess(
    //           msg:
    //               '${widget.rteSpecies == null ? LocaleKeys.addRteSpecies.tr() : 'Edit RTE Species'} $resultId',
    //         );
    //
    //         Navigator.of(context).pop(rteSpecies);
    //       }
    //     }
    //   } finally {
    //     setState(() {
    //       loading = false;
    //     });
    //   }
    // }
  }

  Future<void> _viewListPhoto() async {
    // final result = await SelectPhotosScreen.push(
    //   context,
    //   listPhotos: listPhotos,
    // );
    //
    // if (result != null && result.isNotEmpty && context.mounted) {
    //   setState(() {
    //     listPhotos = result;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.addRteSpecies.tr(),
          subtitle: context.watch<RteSpeciesDetailCubit>().state.activeFarm?.farmName ?? '',
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
                child: BlocBuilder<RteSpeciesDetailCubit, RteSpeciesDetailState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        _selectSpeciesType(context, state),
                        AttributeItem(
                          child: InputAttributeItem(
                            hintText: LocaleKeys.commonName.tr(),
                            validator: requiredValidator,
                            hintTextStyle: context.textStyles.bodyBold.black,
                            initialValue: state.rteSpecies?.commonName,
                            onChanged: context.read<RteSpeciesDetailCubit>().onChangeCommonName,
                          ),
                        ),
                        AttributeItem(
                          child: InputAttributeItem(
                            hintText: LocaleKeys.scientificName.tr(),
                            hintTextStyle: context.textStyles.bodyBold.black,
                            initialValue: state.rteSpecies?.scientificName,
                            onChanged: context.read<RteSpeciesDetailCubit>().onChangeScientificName,
                          ),
                        ),
                        _selectSpeciesRange(context, state),
                        _buildSelectDateSpotted(state),
                        AttributeItem(
                          child: SizedBox(
                            height: 150,
                            child: GeneralCommentWidget(
                              hintText: LocaleKeys.generalComments.tr(),
                              onChanged: context.read<RteSpeciesDetailCubit>().onChangeComment,
                            ),
                          ),
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
            // if (locationModel?.latitude == null) {
            //   showSnackError(msg: LocaleKeys.location_is_required.tr());
            //   return;
            // }
            // if (currentDate == null) {
            //   showSnackError(msg: LocaleKeys.date_is_required.tr());
            //   return;
            // }
            await context.read<RteSpeciesDetailCubit>().onSave();
            if (context.mounted) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(0),
      // child: FormBuilder(
      //   key: _formKey,
      //   onChanged: () {},
      //   autovalidateMode: autoValidateMode,
      //   child: AutofillGroup(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
              // AttributeItem(
              //   child: InputAttributeItem(
              //     hintText: LocaleKeys.location.tr(),
              //     hintTextStyle: context.textStyles.bodyBold.black,
              //     onChanged: (value) {
              //       rteSpecies = rteSpecies.copyWith(
              //         location: value,
              //       );
              //     },
              //   ),
              // ),
              // SelectLocationWidget(
              //   latitudeTitle: LocaleKeys.latitudeDecimal.tr(),
              //   longitudeTitle: LocaleKeys.longitudeDecimal.tr(),
              //   appbarTitle: LocaleKeys.location.tr(),
              //   onChooseLocation: (locationModel) {
              //     rteSpecies = rteSpecies.copyWith(
              //         longitude: locationModel.longitude ?? 0,
              //         latitude: locationModel.latitude ?? 0);
              //
              //     rtePhotos
              //       ..clear()
              //       ..addAll(locationModel.photoBase64
              //           .map((e) => RteSpeciesPhotoModel(
              //                 rteSpeciesId: rteSpecies.rteSpeciesRegisterId,
              //                 rteSpeciesNo: rteSpecies.rteSpeciesRegisterNo,
              //                 rteSpeciesRegisterPhotoId: null,
              //                 rteSpeciesRegisterPhotoNo: DateTime.now()
              //                     .millisecondsSinceEpoch
              //                     .toString(),
              //                 photo: e,
              //                 isActive: true,
              //                 isMasterdataSynced: false,
              //               )));
              //     setState(() {});
              //   },
              // ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget _selectSpeciesType(BuildContext context, RteSpeciesDetailState state) {
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

  Widget _selectSpeciesRange(BuildContext context, RteSpeciesDetailState state) {
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
                      context.read<RteSpeciesDetailCubit>().onChangeSpeciesRange(state.speciesRanges[index]);
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

  Widget _buildSelectDateSpotted(RteSpeciesDetailState state) {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateSpotted',
        hintText: LocaleKeys.dateSpotted.tr(),
        validator: (DateTime? value) {
          if (value == null) return null;
          if (value.millisecondsSinceEpoch > DateTime.now().millisecondsSinceEpoch) {
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
}
