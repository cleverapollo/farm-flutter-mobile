import 'package:cmo/di.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_location_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddFireManagementScreen extends StatefulWidget {
  const AddFireManagementScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddFireManagementScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddFireManagementScreen(),
      ),
    );
  }
}

class _AddFireManagementScreenState extends State<AddFireManagementScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late FireManagement fireManagement;

  @override
  void initState() {
    super.initState();
    fireManagement = FireManagement();
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
        fireManagement = fireManagement.copyWith(
          dateExtinguished: value['DateExtinguished'].toString(),
          dateDetected: value['DateDetected'].toString(),
          fireCauseId: int.tryParse(value['FireCauseId'].toString()),
        );

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId =
                await databaseService.cacheFireManagement(fireManagement);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.addFire.tr()} $resultId',
            );

            Navigator.of(context).pop();
          }
        }
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.addFire.tr(),
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
        floatingActionButton: CmoFilledButton(
          title: LocaleKeys.save.tr(),
          onTap: onSubmit,
          loading: loading,
        ),
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
              _selectFireCause(),
              _buildSelectDateDetected(),
              _buildSelectDateExtinguished(),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.areaBurntHa.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    fireManagement = fireManagement.copyWith(
                      areaBurnt: double.tryParse(value) ?? 0,
                    );
                  },
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.commercialAreaLossHa.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    fireManagement = fireManagement.copyWith(
                      commercialAreaLoss: double.tryParse(value) ?? 0,
                    );
                  },
                ),
              ),
              SelectLocationWidget(
                latitudeTitle: LocaleKeys.latitudeOriginDecimal.tr(),
                longitudeTitle: LocaleKeys.longitudeOriginDecimal.tr(),
                appbarTitle: LocaleKeys.location.tr(),
                onChooseLocation: (locationModel) {
                  fireManagement = fireManagement.copyWith(
                    longitude: locationModel.longitude ?? 0,
                    latitude: locationModel.latitude ?? 0,
                    imagePath: locationModel.imageUri ?? '',
                  );
                },
              ),
              AttributeItem(
                child: SelectItemWidget(
                  title: LocaleKeys.carRaised.tr(),
                  onSelect: (isSelected) {
                    fireManagement = fireManagement.copyWith(carRaised: isSelected);
                  },
                ),
              ),
              AttributeItem(
                child: SelectItemWidget(
                  title: LocaleKeys.carClosed.tr(),
                  onSelect: (isSelected) {
                    fireManagement = fireManagement.copyWith(carClosed: isSelected);
                  },
                ),
              ),
              SizedBox(
                height: 250,
                child: GeneralCommentWidget(
                  hintText: LocaleKeys.generalComments.tr(),
                  onChanged: (value) {
                    fireManagement = fireManagement.copyWith(generalComments: value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectFireCause() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LocaleKeys.fireCause.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        CmoDropdown(
          name: 'FireCauseId',
          hintText: LocaleKeys.fireCause.tr(),
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.fireCause.tr().toLowerCase()}',
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
              _formKey.currentState!.fields['FireCauseId']?.reset();
            }
          },
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.fireCause.tr()),
            CmoDropdownItem(id: 1, name: 'Fire Cause 1'),
            CmoDropdownItem(id: 2, name: 'Fire Cause 2'),
            CmoDropdownItem(id: 3, name: 'Fire Cause 3'),
            CmoDropdownItem(id: 4, name: 'Fire Cause 4'),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectDateDetected() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateDetected',
        hintText: LocaleKeys.dateDetected.tr(),
        validator: requiredValidator,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateDetected.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateDetected.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _buildSelectDateExtinguished() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateExtinguished',
        hintText: LocaleKeys.dateExtinguished.tr(),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateExtinguished.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateExtinguished.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }
}