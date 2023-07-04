import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/accident_and_incident.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddingAAIScreen extends StatefulWidget {
  final AccidentAndIncident? aai;

  AddingAAIScreen({Key? key, this.aai}) : super(key: key);

  static Future<AccidentAndIncident?> push(BuildContext context,
      {AccidentAndIncident? aai}) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => AddingAAIScreen(aai: aai)));
  }

  @override
  State<AddingAAIScreen> createState() => _AddingAAIScreenState();
}

class _AddingAAIScreenState extends State<AddingAAIScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late AccidentAndIncident aai;

  bool carRaised = false;
  bool carClosed = false;

  @override
  void initState() {
    super.initState();
    if (widget.aai == null) {
      aai = AccidentAndIncident(
          accidentAndIncidentRegisterNo: DateTime.now().toIso8601String(),
          isActive: true,
          isMasterDataSynced: false);
    } else {
      aai = AccidentAndIncident.fromJson(widget.aai!.toJson());
    }
    carRaised = aai.carRaisedDate != null;
    carClosed = aai.carClosedDate != null;
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
        aai = aai.copyWith(
            farmId: farm?.farmId,
            dateRecieved: value['DateReceived'] as DateTime?,
            dateOfIncident: value['DateIncident'] as DateTime?,
            dateResumeWork: value['DateResumeWork'] as DateTime?,
            workerId: int.tryParse(value['WorkerId'] as String? ?? ''));

        if (carRaised && aai.carRaisedDate == null) {
          aai = aai.copyWith(
            carRaisedDate: DateTime.now().toIso8601String(),
          );
        }

        if (carClosed && aai.carClosedDate == null) {
          aai = aai.copyWith(
            carClosedDate: DateTime.now().toIso8601String(),
          );
        }

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheAccidentAndIncident(aai);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${widget.aai == null ? LocaleKeys.add_aai.tr() : 'Edit AAI'} $resultId',
            );

            Navigator.of(context).pop(aai);
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
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.add_aai.tr(),
        showLeading: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  CmoDropdown(
                    name: 'worker',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    validator: requiredValidator,
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: LocaleKeys.worker.tr(),
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue)),
                    ),
                    itemsData: [
                      CmoDropdownItem(id: 1, name: 'Test 1'),
                      CmoDropdownItem(id: 2, name: 'Test 2'),
                      CmoDropdownItem(id: 3, name: 'Test 3'),
                    ],
                    onChanged: (value) {
                      aai = aai.copyWith(workerId: value);
                    },
                  ),
                  CmoDropdown(
                    name: 'jobDescription',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: LocaleKeys.jobDescription.tr(),
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue)),
                    ),
                    itemsData: [
                      CmoDropdownItem(id: 1, name: 'Test 1'),
                      CmoDropdownItem(id: 2, name: 'Test 2'),
                      CmoDropdownItem(id: 3, name: 'Test 3'),
                    ],
                    onChanged: (value) {
                      aai = aai.copyWith(workerId: value);
                    },
                  ),
                  CmoDropdown(
                    name: 'natureOfInjury',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: LocaleKeys.nature_of_injury.tr(),
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue)),
                    ),
                    itemsData: [
                      CmoDropdownItem(id: 1, name: 'Test 1'),
                      CmoDropdownItem(id: 2, name: 'Test 2'),
                      CmoDropdownItem(id: 3, name: 'Test 3'),
                    ],
                    onChanged: (value) {
                      aai = aai.copyWith(natureOfInjuryId: value);
                    },
                  ),
                  _buildSelectDateIncident(),
                  _buildSelectDateIncident(),
                  _buildSelectDateResumeWork(),
                  AttributeItem(
                    child: SelectorAttributeItem(
                      hintText: LocaleKeys.worker_disabled.tr(),
                      text: LocaleKeys.worker_disabled.tr(),
                      contentPadding: const EdgeInsets.all(4),
                      trailing: SizedBox(
                        width: 24,
                        child: Switch(
                          value: aai.workerDisabled == true,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (bool value) {
                            aai = aai.copyWith(workerDisabled: value);
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: TextField(
                      minLines: 10,
                      maxLines: 100,
                      onChanged: (value) {
                        aai = aai.copyWith(comment: value);
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.comments.tr(),
                      ),
                    ),
                  ),
                  Center(
                    child: CmoFilledButton(
                      title: LocaleKeys.save.tr(),
                      onTap: () => onSubmit(),
                      loading: loading,
                    ),
                  ),
                ],
              ),
            ),
          )
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
            children: [],
          ),
        ),
      ),
    );
  }

  Widget _selectWorker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LocaleKeys.worker.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        CmoDropdown(
          name: 'WorkerId',
          hintText: LocaleKeys.worker.tr(),
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.worker.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: context.colors.grey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.colors.blue)),
          ),
          onChanged: (int? id) {
            if (id == -1) {
              _formKey.currentState!.fields['WorkerId']?.reset();
            }
          },
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.worker.tr()),
            CmoDropdownItem(id: 0, name: 'Criminals'),
            CmoDropdownItem(id: 1, name: 'Primary'),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectDateReceived() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateReceived',
        hintText: LocaleKeys.dateReceived.tr(),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          (DateTime? value) {
            if (value!.millisecondsSinceEpoch >
                DateTime.now().millisecondsSinceEpoch) {
              return 'Received date cannot be in the future';
            }
            final incidentValue =
                _formKey.currentState?.value['DateIncident'] as DateTime?;
            if (incidentValue != null &&
                value.millisecondsSinceEpoch <
                    incidentValue.millisecondsSinceEpoch) {
              return 'Reported date must be on or after incident date';
            }
            return null;
          }
        ]),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateReceived.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateReceived.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _buildSelectDateIncident() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateIncident',
        hintText: LocaleKeys.date_of_incident.tr(),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          (DateTime? value) {
            if (value!.millisecondsSinceEpoch >
                DateTime.now().millisecondsSinceEpoch) {
              return 'Date of incident cannot be in the future';
            }
            final receivedValue =
                _formKey.currentState?.value['DateReceived'] as DateTime?;
            if (receivedValue != null &&
                value.millisecondsSinceEpoch >
                    receivedValue.millisecondsSinceEpoch) {
              return 'Reported date must be on or after incident date';
            }
            return null;
          }
        ]),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateClosed.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateClosed.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _buildSelectDateResumeWork() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateResumeWork',
        hintText: 'Date of Resume Work',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          (DateTime? value) {
            if (value!.millisecondsSinceEpoch >
                DateTime.now().millisecondsSinceEpoch) {
              return 'Resumed work date cannot be in the future';
            }
            final incidentValue =
                _formKey.currentState?.value['DateIncident'] as DateTime?;
            if (incidentValue != null &&
                value.millisecondsSinceEpoch <
                    incidentValue.millisecondsSinceEpoch) {
              return 'Resume work date must be on or after incident date';
            }
            return null;
          }
        ]),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateClosed.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateClosed.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }
}
