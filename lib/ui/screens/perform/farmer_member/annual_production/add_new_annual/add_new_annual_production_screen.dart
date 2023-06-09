import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/annual_production/annual_production.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddNewAnnualProductionScreen extends StatefulWidget {
  const AddNewAnnualProductionScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddNewAnnualProductionScreenState();

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AddNewAnnualProductionScreen(),
      ),
    );
  }
}

class _AddNewAnnualProductionScreenState extends State<AddNewAnnualProductionScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

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
        final annualProduction = AnnualProduction(
          year: int.tryParse(value['Year'].toString()),
          annualProductionId: DateTime.now().millisecondsSinceEpoch,
          createDT: DateTime.now().millisecondsSinceEpoch.toString(),
          workers: int.tryParse(value['Workers'].toString()),
          workPeriodMonths: double.tryParse(value['WorkPeriodMonths'].toString()),
          workPeriodWeeks: int.tryParse(value['WorkPeriodWeeks'].toString()),
          productionPerTeam: int.tryParse(value['ProductionPerTeam'].toString()),
          productionPerWorker: int.tryParse(value['ProductionPerWorker'].toString()),
          conversionWoodToCharcoal: double.tryParse(value['ConversionWoodToCharcoal'].toString()),
        );

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheAnnualProduction(annualProduction);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.createNewStakeholder.tr()} $resultId',
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.addAnnualProduction.tr(),
          subtitle: LocaleKeys.imbeza.tr(),
          subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CmoHeaderTile(title: LocaleKeys.details.tr()),
              buildInputArea(),
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

  Widget buildInputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: FormBuilder(
        key: _formKey,
        onChanged: () {},
        autovalidateMode: autoValidateMode,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _selectYearDropdown(),
              ..._buildInfoItemWidget(
                name: 'Workers',
                title: LocaleKeys.workersHintText.tr(),
              ),
              ..._buildInfoItemWidget(
                name: 'WorkPeriodMonths',
                title: LocaleKeys.workCycleHintText.tr(),
                title2: LocaleKeys.charcoal.tr(),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              ..._buildInfoItemWidget(
                name: 'WorkPeriodWeeks',
                title: LocaleKeys.weeksCycleHintText.tr(),
              ),
              ..._buildInfoItemWidget(
                name: 'ProductionPerTeam',
                title: LocaleKeys.weeksPerCycleHintText.tr(),
              ),
              ..._buildInfoItemWidget(
                name: 'ProductionPerWorker',
                title: LocaleKeys.productionPerPersonHintText.tr(),
              ),
              ..._buildInfoItemWidget(
                name: 'ConversionWoodToCharcoal',
                title: LocaleKeys.conversionWood.tr(),
                title2: LocaleKeys.woodToCharcoal.tr(),
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
            hintText: '${LocaleKeys.select.tr()} ${LocaleKeys.year.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.grey)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.blue)),
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

  List<Widget> _buildInfoItemWidget({
    required String name,
    required String title,
    String? title2,
    TextInputType? keyboardType,
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
              TextSpan(text: ' $title2', style: context.textStyles.bodyBold.red),
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
        keyboardType: keyboardType ?? TextInputType.number,
      )
    ];
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      isDense: true,
      border: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.grey)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.blue)),
    );
  }
}
