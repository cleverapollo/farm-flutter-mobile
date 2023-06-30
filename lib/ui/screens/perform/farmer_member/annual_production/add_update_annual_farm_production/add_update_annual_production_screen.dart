import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/annual_production/annual_farm_production.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddUpdateAnnualProductionScreen extends StatefulWidget {
  const AddUpdateAnnualProductionScreen({
    super.key,
    this.selectedAnnualFarmProduction,
    this.isEditing = false,
  });

  final AnnualFarmProduction? selectedAnnualFarmProduction;
  final bool isEditing;

  @override
  State<StatefulWidget> createState() => _AddUpdateAnnualProductionScreenState();

  static void push(
    BuildContext context, {
    AnnualFarmProduction? selectedAnnualFarmProduction,
    bool isEditing = false,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AddUpdateAnnualProductionScreen(
          selectedAnnualFarmProduction: selectedAnnualFarmProduction,
          isEditing: isEditing,
        ),
      ),
    );
  }
}

class _AddUpdateAnnualProductionScreenState
    extends State<AddUpdateAnnualProductionScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  double? workPeriodWeeks;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AnnualFarmProductionCubit>().initAddUpdate(
            annualFarmProduction: widget.selectedAnnualFarmProduction,
            isEditing: widget.isEditing,
          );
    });

    if(widget.isEditing) {
      workPeriodWeeks = widget.selectedAnnualFarmProduction?.workPeriodWeeks;
      setState(() {

      });
    }
  }

  Future<void> onSubmit() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;
      if (value == null) return;
      value = {...value};

      if (!widget.isEditing && value['Year'].toString().isNotBlank) {
        final isExist = await context
            .read<AnnualFarmProductionCubit>()
            .checkIfYearExists(int.tryParse(value['Year'].toString()));
        if (isExist) {
          showSnackError(
            msg: LocaleKeys.annualProductionYearAlreadyExists.tr(),
          );

          return;
        }
      }

      setState(() {
        loading = true;
      });
      try {
        await hideInputMethod();
        int? resultId;
        if (mounted) {
          resultId = await context
              .read<AnnualFarmProductionCubit>()
              .addReplaceAnnualFarmProduction(value);
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.addAnnualProduction.tr()} $resultId',
            );

            await context.read<AnnualFarmProductionCubit>().loadListAnnualFarmProductions();
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocSelector<AnnualFarmProductionCubit, AnnualFarmProductionState,
          AnnualFarmProductionState>(
        selector: (state) => state,
        builder: (context, state) {
          return Scaffold(
            appBar: CmoAppBar(
              title: LocaleKeys.addAnnualProduction.tr(),
              subtitle: state.activeFarm?.farmName ?? '',
              subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
              leading: Assets.icons.icArrowLeft.svgBlack,
              onTapLeading: Navigator.of(context).pop,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CmoHeaderTile(title: LocaleKeys.details.tr()),
                  buildInputArea(state),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: CmoFilledButton(
              title: LocaleKeys.save.tr(),
              onTap: onSubmit,
              loading: loading,
            ),
          );
        },
      ),
    );
  }

  Widget buildInputArea(AnnualFarmProductionState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: FormBuilder(
        key: _formKey,
        autovalidateMode: autoValidateMode,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildInfoItemWidget(
                name: 'Year',
                title: LocaleKeys.year.tr(),
                keyboardType: TextInputType.number,
                initialValue: widget.selectedAnnualFarmProduction?.year.toString(),
              ),
              ..._buildInfoItemWidget(
                name: 'noOfWorkers',
                title: LocaleKeys.workersHintText.tr(),
                initialValue: widget.selectedAnnualFarmProduction?.noOfWorkers.toString(),
              ),
              ..._buildInfoItemWidget(
                name: 'WorkPeriodMonths',
                title: LocaleKeys.workCycleHintText.tr(),
                title2: LocaleKeys.charcoal.tr(),
                initialValue: widget.selectedAnnualFarmProduction?.workPeriodMonths.toString(),
                onChanged: (value) {
                  setState(() {
                    if (value.isBlank) {
                      workPeriodWeeks = null;
                    } else {
                      workPeriodWeeks = double.tryParse(value!)! * 4.33;
                    }
                  });
                },
              ),
              ...buildWorkPeriodWeeks(),
              ..._buildInfoItemWidget(
                name: 'CycleLength',
                title: LocaleKeys.weeksPerCycleHintText.tr(),
                initialValue: widget.selectedAnnualFarmProduction?.cycleLength.toString(),
              ),
              ..._buildInfoItemWidget(
                name: 'ProductionPerCycle',
                title: LocaleKeys.productionPerPersonHintText.tr(),
                initialValue: widget.selectedAnnualFarmProduction?.productionPerCycle.toString(),
              ),
              ..._buildInfoItemWidget(
                name: 'ConversionWoodToCharcoal',
                title: LocaleKeys.conversionWood.tr(),
                title2: LocaleKeys.woodToCharcoal.tr(),
                initialValue: widget.selectedAnnualFarmProduction?.conversionWoodToCharcoal.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectYearDropdown() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.year.tr(),
          style: context.textStyles.bodyBold.black,
        ),
        CmoDropdown(
          name: 'Year',
          validator: requiredValidator,
          onChanged: (int? id) {
            if (id == -1) {
              _formKey.currentState!.fields['year']?.reset();
            }
          },
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.year.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: context.colors.grey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.colors.blue)),
          ),
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.year.tr()),
            CmoDropdownItem(id: 2022, name: '2022'),
            CmoDropdownItem(id: 2023, name: '2023'),
            CmoDropdownItem(id: 2024, name: '2024'),
            CmoDropdownItem(id: 2025, name: '2025'),
          ],
        ),
      ],
    );
  }

  List<Widget> buildWorkPeriodWeeks() {
    return [
      const SizedBox(
        height: 12,
      ),
      Text(
        LocaleKeys.weeksCycleHintText.tr(),
        style: context.textStyles.bodyNormal.black,
        maxLines: 2,
      ),
      Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: context.colors.grey)),
              ),
              child: Text(
                workPeriodWeeks == null ? '' : workPeriodWeeks.toString(),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildInfoItemWidget({
    required String name,
    required String title,
    String? title2,
    TextInputType? keyboardType,
    void Function(String?)? onChanged,
    String? initialValue,
  }) {
    return [
      const SizedBox(
        height: 12,
      ),
      RichText(
        maxLines: 2,
        text: TextSpan(
          text: title,
          style: context.textStyles.bodyNormal.black,
          children: <TextSpan>[
            if (title2 != null) ...[
              TextSpan(
                text: ' $title2',
                style: context.textStyles.bodyBold.red,
              ),
              const TextSpan(
                text: '?',
              ),
            ],
          ],
        ),
      ),
      CmoTextField(
        name: name,
        validator: requiredValidator,
        inputDecoration: _buildInputDecoration(context),
        keyboardType: keyboardType ?? const TextInputType.numberWithOptions(decimal: true),
        onChanged: onChanged,
        initialValue: widget.isEditing ? initialValue : null,
      )
    ];
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      isDense: true,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.blue),
      ),
    );
  }
}
