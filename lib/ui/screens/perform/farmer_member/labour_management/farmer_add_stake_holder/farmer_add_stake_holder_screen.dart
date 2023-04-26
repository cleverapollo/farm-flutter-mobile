import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FarmerAddStakeHolderScreen extends StatefulWidget {

  const FarmerAddStakeHolderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FarmerAddStakeHolderScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FarmerAddStakeHolderScreen(),
      ),
    );
  }
}

class _FarmerAddStakeHolderScreenState extends State<FarmerAddStakeHolderScreen> {

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
        // final annualProduction = AnnualProduction(
        //   year: int.tryParse(value['Year'].toString()),
        //   annualProductionId: DateTime.now().millisecondsSinceEpoch,
        //   createDT: DateTime.now().millisecondsSinceEpoch.toString(),
        //   workers: int.tryParse(value['Workers'].toString()),
        //   workPeriodMonths: double.tryParse(value['WorkPeriodMonths'].toString()),
        //   workPeriodWeeks: int.tryParse(value['WorkPeriodWeeks'].toString()),
        //   productionPerTeam: int.tryParse(value['ProductionPerTeam'].toString()),
        //   productionPerWorker: int.tryParse(value['ProductionPerWorker'].toString()),
        //   conversionWoodToCharcoal: double.tryParse(value['ConversionWoodToCharcoal'].toString()),
        // );

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          // await (await databaseService.db).writeTxn(() async {
          //   resultId = await databaseService.cacheAnnualProduction(annualProduction);
          // });
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
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.addStakeholders.tr(),
        subtitle: 'RMU Name: Border Timbers',
        subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            CmoHeaderTile(title: LocaleKeys.details.tr()),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return FormBuilder(
      key: _formKey,
      onChanged: () {},
      autovalidateMode: autoValidateMode,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AttributeItem(
              child: InputAttributeItem(
                maxLines: 2,
                keyboardType: TextInputType.number,
                hintText: LocaleKeys.hectares_camp_protected.tr(),
                onChanged: (value) {},
              ),
            ),
            // _selectYearDropdown(),
            // ..._buildInfoItemWidget(
            //   name: 'Workers',
            //   title: LocaleKeys.workersHintText.tr(),
            // ),
            // ..._buildInfoItemWidget(
            //   name: 'WorkPeriodMonths',
            //   title: LocaleKeys.workCycleHintText.tr(),
            //   title2: LocaleKeys.charcoal.tr(),
            //   keyboardType: const TextInputType.numberWithOptions(
            //     decimal: true,
            //   ),
            // ),
            // ..._buildInfoItemWidget(
            //   name: 'WorkPeriodWeeks',
            //   title: LocaleKeys.weeksCycleHintText.tr(),
            // ),
            // ..._buildInfoItemWidget(
            //   name: 'ProductionPerTeam',
            //   title: LocaleKeys.weeksPerCycleHintText.tr(),
            // ),
            // ..._buildInfoItemWidget(
            //   name: 'ProductionPerWorker',
            //   title: LocaleKeys.productionPerPersonHintText.tr(),
            // ),
            // ..._buildInfoItemWidget(
            //   name: 'ConversionWoodToCharcoal',
            //   title: LocaleKeys.conversionWood.tr(),
            //   title2: LocaleKeys.woodToCharcoal.tr(),
            // ),
          ],
        ),
      ),
    );
  }
}