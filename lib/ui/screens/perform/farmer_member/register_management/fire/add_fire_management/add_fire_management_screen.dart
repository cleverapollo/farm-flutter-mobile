import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/fire/fire_register.dart';
import 'package:cmo/model/fire_cause/fire_cause.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_location_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddFireManagementScreen extends StatefulWidget {
  const AddFireManagementScreen({super.key, this.fireRegister});

  final FireRegister? fireRegister;

  @override
  State<StatefulWidget> createState() => _AddFireManagementScreenState();

  static Future<void> push(BuildContext context, {FireRegister? fireRegister}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddFireManagementScreen(fireRegister: fireRegister),
      ),
    );
  }
}

class _AddFireManagementScreenState extends State<AddFireManagementScreen> {
  final fireCauses = ValueNotifier(<FireCause>[]);

  FireCause? selectFireCause;

  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late FireRegister fireRegister;

  bool carRaised = false;
  bool carClosed = false;

  @override
  void initState() {
    super.initState();
    if (widget.fireRegister != null) {
      fireRegister = FireRegister.fromJson(widget.fireRegister!.toJson());
    } else {
      fireRegister =
          FireRegister(fireRegisterNo: DateTime.now().toIso8601String());
    }
    carRaised = fireRegister.carRaisedDate != null;
    carClosed = fireRegister.carClosedDate != null;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final farm = await configService.getActiveFarm();

      fireCauses.value = await cmoDatabaseMasterService
          .getFireCauseByGroupSchemeId(farm?.groupSchemeId ?? 0);
    });
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
        if (selectFireCause == null) {
          return showSnackError(msg: 'Required fields are missing.');
        }

        await hideInputMethod();

        final farm = await configService.getActiveFarm();
        fireRegister = fireRegister.copyWith(
          fireRegisterId: null,
          fireRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
          isActive: true,
          isMasterdataSynced: false,
          extinguished: value['DateExtinguished'] as DateTime?,
          detected: value['DateDetected'] as DateTime?,
          farmId: farm?.farmId,
          fireCauseId: selectFireCause?.fireCauseId ?? 0,
          fireCauseName: selectFireCause?.fireCauseName,
        );

        if (carRaised && fireRegister.carRaisedDate == null) {
          fireRegister = fireRegister.copyWith(
            carRaisedDate: DateTime.now().toIso8601String(),
          );
        }

        if (carClosed && fireRegister.carClosedDate == null) {
          fireRegister = fireRegister.copyWith(
            carClosedDate: DateTime.now().toIso8601String(),
          );
        }

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheFireRegister(fireRegister);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${widget.fireRegister == null ? LocaleKeys.addFire.tr() : 'Edit Fire'} $resultId',
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
          title: widget.fireRegister == null
              ? LocaleKeys.addFire.tr()
              : 'Edit Fire',
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
                    fireRegister = fireRegister.copyWith(
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
                    fireRegister = fireRegister.copyWith(
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
                  fireRegister = fireRegister.copyWith(
                    longitude: locationModel.longitude ?? 0,
                    latitude: locationModel.latitude ?? 0,
                  );
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
                    fireRegister = fireRegister.copyWith(comment: value);
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
        ValueListenableBuilder(
          valueListenable: fireCauses,
          builder: (_, value, __) {
            return CmoDropdown<FireCause>(
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
              onChanged: (data) {
                selectFireCause = data;
                setState(() {});
              },
              initialValue: selectFireCause,
              itemsData: value
                  .map((e) =>
                      CmoDropdownItem(id: e, name: e.fireCauseName ?? ''))
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSelectDateDetected() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateDetected',
        hintText: LocaleKeys.dateDetected.tr(),
        validator: (DateTime? value) {
          if (value == null) return null;
          if (value.millisecondsSinceEpoch >
              DateTime.now().millisecondsSinceEpoch) {
            return 'Detected date cannot be in the future';
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
        validator: (DateTime? value) {
          if (value == null) return null;
          if (value.millisecondsSinceEpoch >
              DateTime.now().millisecondsSinceEpoch) {
            return 'Extinguished date cannot be in the future';
          }
          final detectedValue =
              _formKey.currentState?.value['DateDetected'] as DateTime?;
          if (detectedValue != null &&
              value.millisecondsSinceEpoch <
                  detectedValue.millisecondsSinceEpoch) {
            return 'Extinguished date must be after detected date';
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
          hintText: LocaleKeys.dateExtinguished.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateExtinguished.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }
}
