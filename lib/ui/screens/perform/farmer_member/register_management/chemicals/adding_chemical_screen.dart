import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/chemical.dart';
import 'package:cmo/model/chemical_application_method/chemical_application_method.dart';
import 'package:cmo/model/chemical_type/chemical_type.dart';
import 'package:cmo/state/register_management_chemical_cubit/register_management_chemical_cubit.dart';
import 'package:cmo/state/register_management_chemical_cubit/register_management_chemical_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingChemicalScreen extends StatefulWidget {
  AddingChemicalScreen({Key? key}) : super(key: key);

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider<RMChemicalCubit>(
                create: (_) => RMChemicalCubit()..initAddData(),
                child: AddingChemicalScreen())));
  }

  @override
  State<AddingChemicalScreen> createState() => _AddingChemicalScreenState();
}

class _AddingChemicalScreenState extends State<AddingChemicalScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RMChemicalCubit, RMChemicalState>(
      builder: (context, state) {
        final cubit = context.read<RMChemicalCubit>();
        return Scaffold(
          appBar: CmoAppBarV2(
            title: LocaleKeys.add_chemical.tr(),
            showLeading: true,
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    children: [
                      CmoDropdown<ChemicalType>(
                        name: 'chemicalType',
                        style: context.textStyles.bodyBold
                            .copyWith(color: context.colors.black),
                        inputDecoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                          isDense: true,
                          hintText: LocaleKeys.chemicalType.tr(),
                          hintStyle: context.textStyles.bodyNormal.grey,
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.grey)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.blue)),
                        ),
                        itemsData: state.chemicalTypes
                            .map((e) => CmoDropdownItem<ChemicalType>(
                                id: e, name: e.chemicalTypeName ?? ''))
                            .toList(),
                        onChanged: (value) {
                          cubit.onChangeData(chemicalType: value);
                        },
                      ),
                      CmoDropdown<ChemicalApplicationMethod>(
                        name: 'applicationMethod',
                        style: context.textStyles.bodyBold
                            .copyWith(color: context.colors.black),
                        inputDecoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                          isDense: true,
                          hintText: LocaleKeys.chemicalApplicationMethod.tr(),
                          hintStyle: context.textStyles.bodyNormal.grey,
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.grey)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.blue)),
                        ),
                        itemsData: state.chemicalApplicationMethods
                            .map((e) =>
                                CmoDropdownItem<ChemicalApplicationMethod>(
                                    id: e,
                                    name: e.hemicalApplicationMethodName ?? ''))
                            .toList(),
                        onChanged: (value) {
                          cubit.onChangeData(chemicalApplicationMethod: value);
                        },
                      ),
                      CmoDropdown<Camp>(
                        name: 'campId',
                        style: context.textStyles.bodyBold
                            .copyWith(color: context.colors.black),
                        inputDecoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                          isDense: true,
                          hintText: LocaleKeys.locationUsed.tr(),
                          hintStyle: context.textStyles.bodyNormal.grey,
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.grey)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.blue)),
                        ),
                        itemsData: state.camps
                            .map((e) => CmoDropdownItem<Camp>(
                                id: e, name: e.campName ?? ''))
                            .toList(),
                        onChanged: (value) {
                          cubit.onChangeData(camp: value);
                        },
                      ),
                      GestureDetector(
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate:
                                DateTime.now().add(Duration(days: -1000000)),
                            lastDate:
                                DateTime.now().add(Duration(days: 1000000)),
                          );
                          cubit.onChangeData(dateTime: date);
                        },
                        child: AttributeItem(
                          child: SelectorAttributeItem(
                              hintText: LocaleKeys.dateIssued.tr(),
                              text: state.chemical.date != null
                                  ? state.chemical.date.yMd()
                                  : 'Date Time Captured',
                              contentPadding: const EdgeInsets.all(4),
                              trailing: Assets.icons.icCalendar.svgBlack),
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            keyboardType: TextInputType.number,
                            hintText: LocaleKeys.openingStockAndPurchases.tr(),
                            onChanged: (value) => cubit.onChangeData(
                                openStock: double.tryParse(value))),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            keyboardType: TextInputType.number,
                            hintText: LocaleKeys.issued.tr(),
                            onChanged: (value) => cubit.onChangeData(
                                issue: double.tryParse(value))),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            keyboardType: TextInputType.number,
                            hintText: LocaleKeys.balance.tr(),
                            onChanged: (value) => cubit.onChangeData(
                                balance: double.tryParse(value))),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            hintText: LocaleKeys.mixture.tr(),
                            onChanged: (value) =>
                                cubit.onChangeData(mixture: value)),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            keyboardType: TextInputType.number,
                            hintText: LocaleKeys.usagePerHa.tr(),
                            onChanged: (value) => cubit.onChangeData(
                                usagePerHa: double.tryParse(value))),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: TextField(
                          minLines: 10,
                          maxLines: 100,
                          onChanged: (value) =>
                              cubit.onChangeData(comment: value),
                          decoration: InputDecoration(
                            hintText: LocaleKeys.comments.tr(),
                          ),
                        ),
                      ),
                      Center(
                        child: CmoFilledButton(
                          title: LocaleKeys.save.tr(),
                          onTap: () => cubit.onSave(context),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
