import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/create_new_stake_holder/widgets/input_text_field_with_title.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddAnnualBudgetDetail extends StatelessWidget {
  const AddAnnualBudgetDetail({
    super.key,
    required this.title,
    required this.formKey,
    required this.budgetName,
    required this.annualTransactionYearName,
  });

  final GlobalKey<FormBuilderState> formKey;
  final String title;
  final String budgetName;
  final String annualTransactionYearName;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Column(
        children: [
          CmoHeaderTile(title: title),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: InputTextFieldWithTitle(
                    name: budgetName,
                    title: LocaleKeys.budgetName.tr(),
                    validator: requiredValidator,
                  ),
                ),
                RichText(
                  maxLines: 1,
                  text: TextSpan(
                    text: LocaleKeys.annual.tr(),
                    style: context.textStyles.bodyBold.black,
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ${LocaleKeys.production.tr()} ',
                        style: context.textStyles.bodyBold.yellow,
                      ),
                      TextSpan(
                        text: LocaleKeys.year.tr(),
                      ),
                    ],
                  ),
                ),
                CmoDropdown(
                  name: annualTransactionYearName,
                  validator: requiredValidator,
                  onChanged: (int? id) {
                    if (id == -1) {
                      formKey.currentState!.fields[annualTransactionYearName]?.reset();
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
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
