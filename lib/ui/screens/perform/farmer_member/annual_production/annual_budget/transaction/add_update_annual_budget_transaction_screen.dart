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
  State<StatefulWidget> createState() =>
      _AddUpdateAnnualBudgetTransactionScreenState();

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
          isEditing: isEditing,
          selectedAnnualBudgetTransaction: selectedAnnualBudgetTransaction,
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

  @override
  void initState() {
    super.initState();
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
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
                        initialValue: state
                            .listAnnualBudgetTransactionCategories
                            .firstWhereOrNull(
                          (element) =>
                              element.annualBudgetTransactionCategoryId ==
                              widget.selectedAnnualBudgetTransaction
                                  ?.transactionCategoryId,
                        ),
                        onChanged: (AnnualBudgetTransactionCategory? id) {
                          if (id?.annualBudgetTransactionCategoryId == -1) {
                            _formKey.currentState!.fields['TransactionCategory']
                                ?.reset();
                          }
                        },
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
                                name:
                                    e.annualBudgetTransactionCategoryName ?? '',
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
                      ItemInfoWidget(
                        name: 'Amount',
                        title: LocaleKeys.amount.tr(),
                        isEditing: widget.isEditing,
                        initialValue: widget.selectedAnnualBudgetTransaction?.transactionAmount.toString(),
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
}
