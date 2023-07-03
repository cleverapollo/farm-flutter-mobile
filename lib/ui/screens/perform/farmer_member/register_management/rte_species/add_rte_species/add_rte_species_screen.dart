import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_photo/select_photos_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_location_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddRteSpeciesScreen extends StatefulWidget {
  const AddRteSpeciesScreen({super.key, this.rteSpecies});

  final RteSpecies? rteSpecies;

  @override
  State<StatefulWidget> createState() => _AddRteSpeciesScreenState();

  static Future<RteSpecies?> push(BuildContext context,
      {RteSpecies? rteSpecies}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddRteSpeciesScreen(rteSpecies: rteSpecies),
      ),
    );
  }
}

class _AddRteSpeciesScreenState extends State<AddRteSpeciesScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late RteSpecies rteSpecies;

  late List<RteSpeciesPhotoModel> listPhotos;

  bool carRaised = false;
  bool carClosed = false;

  @override
  void initState() {
    super.initState();
    if (widget.rteSpecies == null) {
      rteSpecies = RteSpecies(
          rteSpeciesRegisterNo: DateTime.now().toIso8601String(),
          isActive: true,
          isMasterDataSynced: false);
    } else {
      rteSpecies = RteSpecies.fromJson(widget.rteSpecies!.toJson());
    }
    carRaised = rteSpecies.carRaisedDate != null;
    carClosed = rteSpecies.carClosedDate != null;

    listPhotos = <RteSpeciesPhotoModel>[];
  }

  Future<void> onSubmit() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;
      if (value == null) return;
      value = {...value};

      setState(() {
        loading = true;
      });
      try {
        await hideInputMethod();
        final farm = await configService.getActiveFarm();
        rteSpecies = rteSpecies.copyWith(
          farmId: farm?.farmId,
          dateSpotted: value['DateSpotted'] as DateTime?,
          speciesRangeId: int.tryParse(value['SpeciesRangeId'].toString()),
        );

        if (carRaised && rteSpecies.carRaisedDate == null) {
          rteSpecies = rteSpecies.copyWith(
            carRaisedDate: DateTime.now().toIso8601String(),
          );
        }

        if (carClosed && rteSpecies.carClosedDate == null) {
          rteSpecies = rteSpecies.copyWith(
            carClosedDate: DateTime.now().toIso8601String(),
          );
        }

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheRteSpecies(rteSpecies);
            if (listPhotos.isNotEmpty) {
              for (final item in listPhotos) {
                await databaseService.cacheRteSpeciesPhotoModel(item);
              }
            }
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${widget.rteSpecies == null ? LocaleKeys.addRteSpecies.tr() : 'Edit RTE Species'} $resultId',
            );

            Navigator.of(context).pop(rteSpecies);
          }
        }
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  Future<void> _viewListPhoto() async {
    final result = await SelectPhotosScreen.push(
      context,
      listPhotos: listPhotos,
    );

    if (result != null && result.isNotEmpty && context.mounted) {
      setState(() {
        listPhotos = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.addRteSpecies.tr(),
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildInputArea(),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          CmoFilledButton(
            title: LocaleKeys.photos.tr(),
            onTap: _viewListPhoto,
            loading: loading,
          ),
          CmoFilledButton(
            title: LocaleKeys.save.tr(),
            onTap: onSubmit,
            loading: loading,
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: FormBuilder(
        key: _formKey,
        onChanged: () {},
        autovalidateMode: autoValidateMode,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _selectSpeciesType(),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.commonName.tr(),
                  validator: requiredValidator,
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    rteSpecies = rteSpecies.copyWith(
                      commonName: value,
                    );
                  },
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.scientificName.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    rteSpecies = rteSpecies.copyWith(
                      scientificName: value,
                    );
                  },
                ),
              ),
              _selectSpeciesRange(),
              _buildSelectDateSpotted(),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.location.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    rteSpecies = rteSpecies.copyWith(
                      location: value,
                    );
                  },
                ),
              ),
              SelectLocationWidget(
                latitudeTitle: LocaleKeys.latitudeDecimal.tr(),
                longitudeTitle: LocaleKeys.longitudeDecimal.tr(),
                appbarTitle: LocaleKeys.location.tr(),
                onChooseLocation: (locationModel) {
                  rteSpecies = rteSpecies.copyWith(
                      longitude: locationModel.longitude ?? 0,
                      latitude: locationModel.latitude ?? 0);
                },
              ),
              AttributeItem(
                child: SelectItemWidget(
                  title: LocaleKeys.carRaised.tr(),
                  onSelect: (isSelected) {
                    carRaised = isSelected;
                  },
                ),
              ),
              AttributeItem(
                child: SelectItemWidget(
                  title: LocaleKeys.carClosed.tr(),
                  onSelect: (isSelected) {
                    carClosed = isSelected;
                  },
                ),
              ),
              SizedBox(
                height: 250,
                child: GeneralCommentWidget(
                  hintText: LocaleKeys.generalComments.tr(),
                  onChanged: (value) {
                    rteSpecies = rteSpecies.copyWith(comment: value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectSpeciesType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Text(
            LocaleKeys.speciesType.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        CmoDropdown(
          name: 'SpeciesTypeId',
          hintText: LocaleKeys.speciesType.tr(),
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.speciesType.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.blue),
            ),
          ),
          onChanged: (int? id) {
            if (id == -1) {
              _formKey.currentState!.fields['SpeciesTypeId']?.reset();
            }
          },
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.speciesType.tr()),
            CmoDropdownItem(id: 1, name: 'Species Type 1'),
            CmoDropdownItem(id: 2, name: 'Species Type 2'),
            CmoDropdownItem(id: 3, name: 'Species Type 3'),
            CmoDropdownItem(id: 4, name: 'Species Type 4'),
          ],
        ),
      ],
    );
  }

  Widget _selectSpeciesRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Text(
            LocaleKeys.speciesRange.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        CmoDropdown(
          name: 'SpeciesRangeId',
          hintText: LocaleKeys.speciesRange.tr(),
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.speciesRange.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.blue),
            ),
          ),
          onChanged: (int? id) {
            if (id == -1) {
              _formKey.currentState!.fields['SpeciesRangeId']?.reset();
            }
          },
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.speciesRange.tr()),
            CmoDropdownItem(id: 1, name: 'Species Range 1'),
            CmoDropdownItem(id: 2, name: 'Species Range 2'),
            CmoDropdownItem(id: 3, name: 'Species Range 3'),
            CmoDropdownItem(id: 4, name: 'Species Range 4'),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectDateSpotted() {
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
