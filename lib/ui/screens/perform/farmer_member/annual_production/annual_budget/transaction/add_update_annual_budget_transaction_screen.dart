import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/widgets/item_info_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddUpdateAnnualBudgetTransactionScreen extends StatefulWidget {
  const AddUpdateAnnualBudgetTransactionScreen({
    super.key,
    this.selectedAnnualBudget,
    this.selectedAnnualBudgetTransaction,
    this.isEditing = false,
  });

  final AnnualBudget? selectedAnnualBudget;
  final AnnualBudgetTransaction? selectedAnnualBudgetTransaction;
  final bool isEditing;

  @override
  State<StatefulWidget> createState() => _AddUpdateAnnualBudgetTransactionScreenState();

  static void push(
    BuildContext context, {
    AnnualBudget? selectedAnnualBudget,
    AnnualBudgetTransaction? selectedAnnualBudgetTransaction,
    bool isEditing = false,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AddUpdateAnnualBudgetTransactionScreen(
          selectedAnnualBudget: selectedAnnualBudget,
          selectedAnnualBudgetTransaction: selectedAnnualBudgetTransaction,
          isEditing: isEditing,
        ),
      ),
    );
  }
}

class _AddUpdateAnnualBudgetTransactionScreenState
    extends State<AddUpdateAnnualBudgetTransactionScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  double? amountTransaction;

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      amountTransaction = widget.selectedAnnualBudgetTransaction?.transactionAmount;
    }

    Future.microtask(() async {
      await context.read<AnnualBudgetTransactionsCubit>().initAddUpdate(
            annualBudget: widget.selectedAnnualBudget,
            isEditing: widget.isEditing,
            annualBudgetTransaction: widget.selectedAnnualBudgetTransaction,
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
              .read<AnnualBudgetTransactionsCubit>()
              .addUpdateTransaction(value);
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.addBudget.tr()} $resultId',
            );

            await context
                .read<AnnualBudgetTransactionsCubit>()
                .refresh();

            await context.read<AnnualBudgetManagementCubit>().loadListAnnualBudgets();
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

  void onChangeCategory(AnnualBudgetTransactionCategory? selectedCategory) {
    if (selectedCategory?.annualBudgetTransactionCategoryId == -1) {
      _formKey.currentState!.fields['TransactionCategory']?.reset();
    }

    _formKey.currentState!.fields['Amount']?.reset();
    context
        .read<AnnualBudgetTransactionsCubit>()
        .updateSelectedCategory(selectedCategory);

    setState(() {
      amountTransaction = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocSelector<AnnualBudgetTransactionsCubit,
          AnnualBudgetTransactionsState, AnnualBudgetTransactionsState>(
        selector: (state) => state,
        builder: (context, state) {
          return Scaffold(
            appBar: CmoAppBar(
              title: state.indexTab == 0
                  ? LocaleKeys.addIncome.tr()
                  : LocaleKeys.addExpense.tr(),
              leading: Assets.icons.icArrowLeft.svgBlack,
              onTapLeading: Navigator.of(context).pop,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8,
              ),
              child: FormBuilder(
                key: _formKey,
                autovalidateMode: autoValidateMode,
                child: AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                          text: LocaleKeys.transactionCategory.tr(),
                          style: context.textStyles.bodyNormal.black,
                        ),
                      ),
                      CmoDropdown<AnnualBudgetTransactionCategory?>(
                        name: 'TransactionCategory',
                        validator: requiredValidator,
                        initialValue: widget.isEditing
                            ? state.listAnnualBudgetTransactionCategories
                                .firstWhereOrNull(
                                (element) =>
                                    element.annualBudgetTransactionCategoryId ==
                                    widget.selectedAnnualBudgetTransaction?.transactionCategoryId,
                              )
                            : null,
                        onChanged: onChangeCategory,
                        inputDecoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          isDense: true,
                          hintText: LocaleKeys.select.tr(),
                          hintStyle: context.textStyles.bodyNormal.grey,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: context.colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: context.colors.blue),
                          ),
                        ),
                        itemsData: state.listAnnualBudgetTransactionCategories
                            .map(
                              (e) => CmoDropdownItem<
                                  AnnualBudgetTransactionCategory>(
                                id: e,
                                name: e.annualBudgetTransactionCategoryName ?? '',
                              ),
                            )
                            .toList()
                          ..insert(
                            0,
                            CmoDropdownItem(
                              id: const AnnualBudgetTransactionCategory(
                                annualBudgetTransactionCategoryId: -1,
                              ),
                              name: LocaleKeys.transactionCategory.tr(),
                            ),
                          ),
                      ),
                      ItemInfoWidget(
                        name: 'TransactionDetail',
                        title: LocaleKeys.transactionDetail.tr(),
                        isEditing: widget.isEditing,
                        hasValidator: false,
                        keyboardType: TextInputType.text,
                        initialValue: widget.selectedAnnualBudgetTransaction?.transactionDescription,
                      ),
                      buildAmountItem(state),
                      buildDisableAmount(
                          title: LocaleKeys.amount.tr(),
                          value: amountTransaction?.toStringAsFixed(2),
                          isDisplay: state.selectedCategory?.isCalculated ?? false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

  Widget buildAmountItem(AnnualBudgetTransactionsState state) {
    final isCalculated = state.selectedCategory?.isCalculated ?? false;
    return ItemInfoWidget(
      name: 'Amount',
      title: isCalculated
          ? (state.selectedCategory?.annualBudgetTransactionCategoryName ?? '')
          : LocaleKeys.amount.tr(),
      isEditing: widget.isEditing,
      initialValue: isCalculated
          ? widget.selectedAnnualBudgetTransaction?.transactionAttribute1?.toStringAsFixed(2)
          : widget.selectedAnnualBudgetTransaction?.transactionAmount?.toStringAsFixed(2),
      onChanged: (value) async {
        amountTransaction = await context
            .read<AnnualBudgetTransactionsCubit>()
            .getAmountBasedOnTransactionAttribute1(value);
        setState(() {});
      },
    );
  }
  
  Widget buildDisableAmount({
    String? title,
    String? value,
    required bool isDisplay,
  }) {
    if (!isDisplay) return const SizedBox.shrink();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          title ?? '',
          style: context.textStyles.bodyNormal.black,
          maxLines: 1,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: context.colors.grey)),
                ),
                child: Text(
                  value ?? '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
