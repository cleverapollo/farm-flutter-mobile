import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_budget/transaction/annual_budget_transactions_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'widgets/add_update_annual_budget_detail.dart';

class AddAnnualBudgetScreen extends BaseStatefulWidget {
  AddAnnualBudgetScreen({
    super.key,
    this.selectedAnnualBudget,
    this.isEditing = false,
  }) : super(
          screenName: isEditing
              ? LocaleKeys.budget_detail.tr()
              : LocaleKeys.add_budget.tr(),
        );

  final AnnualBudget? selectedAnnualBudget;
  final bool isEditing;

  @override
  State<StatefulWidget> createState() => _AddAnnualBudgetScreenState();

  static void push(
      BuildContext context, {
        AnnualBudget? selectedAnnualBudget,
        bool isEditing = false,
      }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AddAnnualBudgetScreen(
          selectedAnnualBudget: selectedAnnualBudget,
          isEditing: isEditing,
        ),
      ),
    );
  }
}

class _AddAnnualBudgetScreenState extends BaseStatefulWidgetState<AddAnnualBudgetScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AnnualBudgetManagementCubit>().initAddUpdate(
        annualBudget: widget.selectedAnnualBudget,
        isEditing: widget.isEditing,
      );
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

        int? resultId;
        if (mounted) {
          resultId = await context
              .read<AnnualBudgetManagementCubit>()
              .addReplaceAnnualBudget(value);
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.add_budget.tr()} $resultId',
            );

            await context.read<AnnualBudgetManagementCubit>().loadListAnnualBudgets();
            await context.read<SiteManagementPlanCubit>().refresh();
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
      child: BlocSelector<AnnualBudgetManagementCubit, AnnualBudgetManagementState, AnnualBudgetManagementState>(
        selector: (state) => state,
        builder: (context, state) {
          return Scaffold(
            appBar: CmoAppBar(
              title: widget.isEditing
                  ? LocaleKeys.budget_detail.tr()
                  : LocaleKeys.add_budget.tr(),
              subtitle: state.activeFarm?.farmName ?? '',
              subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
              leading: Assets.icons.icArrowLeft.svgBlack,
              onTapLeading: Navigator.of(context).pop,
            ),
            body: buildInputArea(state.listAnnualFarmProductions),
            persistentFooterAlignment: AlignmentDirectional.center,
            persistentFooterButtons: [
              if (widget.isEditing)
                CmoFilledButton(
                  title: LocaleKeys.transactions.tr(),
                  onTap: () => AnnualBudgetTransactionsScreen.push(
                    context,
                    annualBudget: widget.selectedAnnualBudget!,
                  ),
                ),
              CmoFilledButton(
                title: LocaleKeys.save.tr(),
                onTap: onSubmit,
                loading: loading,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildInputArea(List<AnnualFarmProduction> listAnnualFarmProductions) {
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
              AddUpdateAnnualBudgetDetail(
                formKey: _formKey,
                title: LocaleKeys.details.tr(),
                budgetName: 'AnnualBudgetName',
                year: 'AnnualFarmProduction',
                annualBudget: widget.selectedAnnualBudget,
                listAnnualFarmProductions: listAnnualFarmProductions,
              ),
              const SizedBox(
                height: 16,
              ),
              // AddUpdateAnnualBudgetDetail(
              //   formKey: _formKey,
              //   title: LocaleKeys.transactions.tr(),
              //   budgetName: 'TransactionBudgetName',
              //   annualTransactionYearName: 'TransactionBudgetYear',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
