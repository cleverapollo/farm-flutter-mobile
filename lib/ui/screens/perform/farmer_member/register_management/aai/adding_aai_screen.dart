import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/accident_and_incident.dart';
import 'package:cmo/model/labour_management/farmer_worker.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../widgets/add_general_comment_widget.dart';
import '../widgets/select_item_widget.dart';

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
  final workers = ValueNotifier(<FarmerWorker>[]);
  FarmerWorker? selectWorker;

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
          accidentAndIncidentRegisterNo:
              DateTime.now().microsecondsSinceEpoch.toString(),
          isActive: true,
          isMasterDataSynced: false);
    } else {
      aai = AccidentAndIncident.fromJson(widget.aai!.toJson());
    }
    carRaised = aai.carRaisedDate != null;
    carClosed = aai.carClosedDate != null;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final farm = await configService.getActiveFarm();

      workers.value = await cmoDatabaseMasterService
              .getFarmerWorkersByFarmId(farm?.farmId ?? '') ??
          [];
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
        await hideInputMethod();
        final farm = await configService.getActiveFarm();
        aai = aai.copyWith(
            farmId: farm?.farmId,
            dateRecieved: value['DateReceived'] as DateTime?,
            dateOfIncident: value['DateIncident'] as DateTime?,
            dateResumeWork: value['DateResumeWork'] as DateTime?,
            natureOfInjuryId: value['natureOfInjury'] as int?,
            jobDescriptionId: value['jobDescription'] as int?,
            workerId: int.tryParse(selectWorker?.workerId ?? ''));

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
      } catch (e) {
        setState(() {
          loading = false;
        });
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
          title: widget.aai == null ? LocaleKeys.add_aai.tr() : 'Edit AAI',
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
              _selectWorker(),
              _selectJobDescription(),
              _selectNatureOfInjury(),
              _buildSelectDateIncident(),
              _buildSelectDateReceived(),
              _buildSelectDateResumeWork(),
              AttributeItem(
                child: SelectItemWidget(
                  title: LocaleKeys.worker_disabled.tr(),
                  onSelect: (value) {
                    aai = aai.copyWith(workerDisabled: value);
                  },
                ),
              ),
              SizedBox(
                height: 250,
                child: GeneralCommentWidget(
                  hintText: LocaleKeys.generalComments.tr(),
                  onChanged: (value) {
                    aai = aai.copyWith(comment: value);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectWorker() {
    return ValueListenableBuilder(
        valueListenable: workers,
        builder: (_, value, __) {
          return CmoDropdown<FarmerWorker>(
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
              onChanged: (data) {
                selectWorker = data!;
                setState(() {});
              },
              initialValue: selectWorker,
              itemsData: value
                  .map((e) => CmoDropdownItem(id: e, name: e.firstName ?? ''))
                  .toList());
        });
  }

  Widget _selectJobDescription() {
    return CmoDropdown(
      name: 'jobDescription',
      hintText: LocaleKeys.jobDescription.tr(),
      inputDecoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        isDense: true,
        hintText:
            '${LocaleKeys.select.tr()} ${LocaleKeys.jobDescription.tr().toLowerCase()}',
        hintStyle: context.textStyles.bodyNormal.grey,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.grey)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.blue)),
      ),
      onChanged: (int? id) {
        if (id == -1) {
          _formKey.currentState!.fields['jobDescription']?.reset();
        }
      },
      itemsData: [
        CmoDropdownItem(id: -1, name: LocaleKeys.jobDescription.tr()),
        CmoDropdownItem(id: 0, name: 'Criminals'),
        CmoDropdownItem(id: 1, name: 'Primary'),
      ],
    );
  }

  Widget _selectNatureOfInjury() {
    return CmoDropdown(
      name: 'natureOfInjury',
      hintText: LocaleKeys.nature_of_injury.tr(),
      inputDecoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        isDense: true,
        hintText:
            '${LocaleKeys.select.tr()} ${LocaleKeys.nature_of_injury.tr().toLowerCase()}',
        hintStyle: context.textStyles.bodyNormal.grey,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.grey)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.blue)),
      ),
      onChanged: (int? id) {
        if (id == -1) {
          _formKey.currentState!.fields['natureOfInjury']?.reset();
        }
      },
      itemsData: [
        CmoDropdownItem(id: -1, name: LocaleKeys.nature_of_injury.tr()),
        CmoDropdownItem(id: 0, name: 'Criminals'),
        CmoDropdownItem(id: 1, name: 'Primary'),
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
        validator: (DateTime? value) {
          if (value == null) return null;
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
          hintText: LocaleKeys.dateClosed.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateClosed.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }
}
