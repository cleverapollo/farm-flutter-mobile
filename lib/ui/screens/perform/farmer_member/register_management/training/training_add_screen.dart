import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class TrainingAddScreen extends StatefulWidget {
  const TrainingAddScreen({super.key, this.training});

  final TrainingRegister? training;

  static Future<void> push(BuildContext context, {TrainingRegister? training}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => TrainingAddScreen(training: training)));
  }

  @override
  State<TrainingAddScreen> createState() => _TrainingAddScreenState();
}

class _TrainingAddScreenState extends State<TrainingAddScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  final signatureKey = GlobalKey<SfSignaturePadState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late TrainingRegister training;

  bool carRaised = false;
  bool carClosed = false;

  bool hasDrawn = false;

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
        training = training.copyWith(
            farmId: farm?.farmId,
            trainingTypeId:
                int.tryParse(value['TrainingType'] as String? ?? ''),
            date: value['Date'] as DateTime?,
            expiryDate: value['ExpiryDate'] as DateTime?,
            workerId: value['TraineeName'] as String?);

        if (carRaised && training.carRaisedDate == null) {
          training = training.copyWith(
            carRaisedDate: DateTime.now().toIso8601String(),
          );
        }

        if (carClosed && training.carClosedDate == null) {
          training = training.copyWith(
            carClosedDate: DateTime.now().toIso8601String(),
          );
        }

        if (hasDrawn) {
          training = training.copyWith(
            signatureDate: DateTime.now(),
          );
          // TODO(TuNT): construct list of points, to image and upload image to get url
        }

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheTraining(training);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${widget.training == null ? LocaleKeys.add_training.tr() : 'Edit Training'} $resultId',
            );
            Navigator.of(context).pop(training);
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
  void initState() {
    super.initState();
    if (widget.training == null) {
      training = TrainingRegister(
          trainingRegisterNo: DateTime.now().toIso8601String(),
          isActive: true,
          isMasterdataSynced: false);
    } else {
      training = TrainingRegister.fromJson(widget.training!.toJson());
    }
    carRaised = training.carRaisedDate != null;
    carClosed = training.carClosedDate != null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBarV2(
          title: widget.training == null
              ? LocaleKeys.add_training.tr()
              : 'Edit Training',
          showLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12.0),
                  _selectTrainingType(),
                  _buildSelectDate(),
                  _buildSelectExpiryDate(),
                  const SizedBox(height: 12.0),
                  Text(
                    '* ${LocaleKeys.trainer_name.tr()}',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    onChanged: (value) {
                      training = training.copyWith(trainerName: value);
                    },
                    validator: requiredValidator,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 12.0),
                  _selectTraineeName(),
                  const SizedBox(height: 12.0),
                  Text(
                    LocaleKeys.generalComments.tr(),
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    onChanged: (value) {
                      training = training.copyWith(comment: value);
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: size.height * 0.35,
                      width: size.width,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12)),
                      child: SfSignaturePad(
                        key: signatureKey,
                        maximumStrokeWidth: 1,
                        minimumStrokeWidth: 1,
                        onDrawEnd: () {
                          hasDrawn = true;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    child: CmoFilledButton(
                        title: LocaleKeys.clear_signature.tr(),
                        onTap: () {
                          hasDrawn = false;
                          signatureKey.currentState?.clear();
                        },
                        loading: loading),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    child: CmoFilledButton(
                        title: LocaleKeys.save.tr(),
                        onTap: onSubmit,
                        loading: loading),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectTrainingType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '* ${LocaleKeys.training_type.tr()}',
          style:
              context.textStyles.bodyBold.copyWith(color: context.colors.black),
        ),
        CmoDropdown(
          name: 'TrainingType',
          hintText: LocaleKeys.training_type.tr(),
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.training_type.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: context.colors.grey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.colors.blue)),
          ),
          onChanged: (int? id) {
            if (id == -1) {
              _formKey.currentState!.fields['TrainingType']?.reset();
            }
          },
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.training_type.tr()),
            CmoDropdownItem(id: 0, name: 'Criminals'),
            CmoDropdownItem(id: 1, name: 'Primary'),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectDate() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'Date',
        hintText: LocaleKeys.date.tr(),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          (DateTime? value) {
            if (value!.millisecondsSinceEpoch >
                DateTime.now().millisecondsSinceEpoch) {
              return 'Date cannot be in the future';
            }
            return null;
          }
        ]),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: '* ${LocaleKeys.date.tr()}',
          hintStyle: context.textStyles.bodyBold.black,
          labelText: '* ${LocaleKeys.date.tr()}',
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _buildSelectExpiryDate() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'ExpiryDate',
        hintText: LocaleKeys.expiry_date.tr(),
        validator: (DateTime? value) {
          if (value == null) return null;
          final dateValue = _formKey.currentState?.value['Date'] as DateTime?;
          if (dateValue != null &&
              value.millisecondsSinceEpoch < dateValue.millisecondsSinceEpoch) {
            return 'Expiry date must be after training date';
          }
          return null;
        },
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.expiry_date.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.expiry_date.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _selectTraineeName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '* ${LocaleKeys.trainee_name.tr()}',
          style:
              context.textStyles.bodyBold.copyWith(color: context.colors.black),
        ),
        CmoDropdown(
          name: 'TraineeName',
          hintText: LocaleKeys.trainee_name.tr(),
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.trainee_name.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: context.colors.grey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.colors.blue)),
          ),
          onChanged: (int? id) {
            if (id == -1) {
              _formKey.currentState!.fields['TraineeName']?.reset();
            }
          },
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.trainee_name.tr()),
            CmoDropdownItem(id: 0, name: 'Criminals'),
            CmoDropdownItem(id: 1, name: 'Primary'),
          ],
        ),
      ],
    );
  }
}
