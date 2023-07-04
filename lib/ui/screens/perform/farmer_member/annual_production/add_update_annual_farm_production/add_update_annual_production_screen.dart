import 'dart:async';

import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/annual_production/annual_farm_production.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/widgets/item_info_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
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
              ItemInfoWidget(
                name: 'Year',
                title: LocaleKeys.year.tr(),
                keyboardType: TextInputType.number,
                initialValue: widget.selectedAnnualFarmProduction?.year.toString(),
                isEditing: widget.isEditing,
              ),
              ItemInfoWidget(
                name: 'noOfWorkers',
                title: LocaleKeys.workersHintText.tr(),
                initialValue: widget.selectedAnnualFarmProduction?.noOfWorkers.toString(),
                isEditing: widget.isEditing,
              ),
              ItemInfoWidget(
                name: 'WorkPeriodMonths',
                title: LocaleKeys.workCycleHintText.tr(),
                title2: LocaleKeys.charcoal.tr(),
                isEditing: widget.isEditing,
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
              ItemInfoWidget(
                name: 'CycleLength',
                title: LocaleKeys.weeksPerCycleHintText.tr(),
                initialValue: widget.selectedAnnualFarmProduction?.cycleLength.toString(),
                isEditing: widget.isEditing,
              ),
              ItemInfoWidget(
                name: 'ProductionPerCycle',
                isEditing: widget.isEditing,
                title: LocaleKeys.productionPerPersonHintText.tr(),
                initialValue: widget.selectedAnnualFarmProduction?.productionPerCycle.toString(),
              ),
              ItemInfoWidget(
                name: 'ConversionWoodToCharcoal',
                title: LocaleKeys.conversionWood.tr(),
                title2: LocaleKeys.woodToCharcoal.tr(),
                isEditing: widget.isEditing,
                initialValue: widget.selectedAnnualFarmProduction?.conversionWoodToCharcoal.toString(),
              ),
            ],
          ),
        ),
      ),
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
}
