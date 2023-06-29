import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/annual_production/annual_farm_production.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_budget/add_budget/widgets/add_annual_budget_detail.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddAnnualBudgetScreen extends StatefulWidget {
  const AddAnnualBudgetScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddAnnualBudgetScreenState();

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AddAnnualBudgetScreen(),
      ),
    );
  }
}

class _AddAnnualBudgetScreenState extends State<AddAnnualBudgetScreen> {
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
        final budget = AnnualProductionBudget(
          annualBudgetId: DateTime.now().millisecondsSinceEpoch,
          annualBudgetName: value['AnnualBudgetName'].toString(),
          year: int.tryParse(value['Year'].toString()),
          transactionBudgetName: value['TransactionBudgetName'].toString(),
          transactionBudgetYear: int.tryParse(value['TransactionBudgetYear'].toString()),
          createDT: DateTime.now().millisecondsSinceEpoch.toString(),
          annualProductionId: DateTime.now().millisecondsSinceEpoch,
        );

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheAnnualProductionBudget(budget);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.addBudget.tr()} $resultId',
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
          title: LocaleKeys.addBudget.tr(),
          subtitle: LocaleKeys.imbeza.tr(),
          subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
        ),
        body: buildInputArea(),
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
    return FormBuilder(
      key: _formKey,
      onChanged: () {},
      autovalidateMode: autoValidateMode,
      child: AutofillGroup(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              AddAnnualBudgetDetail(
                formKey: _formKey,
                title: LocaleKeys.details.tr(),
                budgetName: 'AnnualBudgetName',
                annualTransactionYearName: 'Year',
              ),
              const SizedBox(
                height: 16,
              ),
              AddAnnualBudgetDetail(
                formKey: _formKey,
                title: LocaleKeys.transactions.tr(),
                budgetName: 'TransactionBudgetName',
                annualTransactionYearName: 'TransactionBudgetYear',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
