import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/create_new_stake_holder/widgets/input_text_field_with_title.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddUpdateAnnualBudgetDetail extends StatelessWidget {
  const AddUpdateAnnualBudgetDetail({
    super.key,
    required this.title,
    required this.formKey,
    required this.budgetName,
    required this.year,
    this.annualBudget,
    this.listAnnualFarmProductions = const <AnnualFarmProduction>[],
  });

  final GlobalKey<FormBuilderState> formKey;
  final String title;
  final String budgetName;
  final String year;
  final AnnualBudget? annualBudget;
  final List<AnnualFarmProduction> listAnnualFarmProductions;

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
                    initialValue: annualBudget?.annualBudgetName,
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
                CmoDropdown<AnnualFarmProduction?>(
                  name: year,
                  validator: requiredValidator,
                  initialValue: listAnnualFarmProductions.firstWhereOrNull(
                    (element) =>
                        element.annualFarmProductionId ==
                        annualBudget?.annualFarmProductionId,
                  ),
                  onChanged: (AnnualFarmProduction? id) {
                    if (id?.annualFarmProductionId == '-1') {
                      formKey.currentState!.fields[year]?.reset();
                    }
                  },
                  inputDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    isDense: true,
                    hintText:
                        '${LocaleKeys.select.tr()} ${LocaleKeys.year.tr().toLowerCase()}',
                    hintStyle: context.textStyles.bodyNormal.grey,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: context.colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: context.colors.blue),
                    ),
                  ),
                  itemsData: listAnnualFarmProductions
                      .map(
                        (e) => CmoDropdownItem<AnnualFarmProduction>(
                          id: e,
                          name: e.year.toString(),
                        ),
                      )
                      .toList()
                    ..insert(
                      0,
                      CmoDropdownItem(
                        id: const AnnualFarmProduction(
                            annualFarmProductionId: '-1'),
                        name: LocaleKeys.year.tr(),
                      ),
                    ),
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
