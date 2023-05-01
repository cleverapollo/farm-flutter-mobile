import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/chemical.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class AddingChemicalScreen extends StatefulWidget {
  AddingChemicalScreen({Key? key}) : super(key: key);

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => AddingChemicalScreen()));
  }

  @override
  State<AddingChemicalScreen> createState() => _AddingChemicalScreenState();
}

class _AddingChemicalScreenState extends State<AddingChemicalScreen> {
  Chemical chemical = Chemical();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  CmoDropdown(
                    name: 'chemicalType',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: LocaleKeys.chemicalType.tr(),
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue)),
                    ),
                    itemsData: [
                      CmoDropdownItem(id: 1, name: 'Test 1'),
                      CmoDropdownItem(id: 2, name: 'Test 2'),
                      CmoDropdownItem(id: 3, name: 'Test 3'),
                    ],
                    onChanged: (value) {
                      chemical.chemicalTypeId = value;
                    },
                  ),
                  CmoDropdown(
                    name: 'applicationMethod',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: LocaleKeys.chemicalApplicationMethod.tr(),
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue)),
                    ),
                    itemsData: [
                      CmoDropdownItem(id: 1, name: 'Test 1'),
                      CmoDropdownItem(id: 2, name: 'Test 2'),
                      CmoDropdownItem(id: 3, name: 'Test 3'),
                    ],
                    onChanged: (value) {
                      chemical.chemicalApplicationMethodId = value;
                    },
                  ),
                  CmoDropdown(
                    name: 'campId',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: LocaleKeys.locationUsed.tr(),
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue)),
                    ),
                    itemsData: [
                      CmoDropdownItem(id: 1, name: 'Test 1'),
                      CmoDropdownItem(id: 2, name: 'Test 2'),
                      CmoDropdownItem(id: 3, name: 'Test 3'),
                    ],
                    onChanged: (value) {
                      chemical.campId = value;
                    },
                  ),
                  GestureDetector(
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().add(Duration(days: -1000000)),
                        lastDate: DateTime.now().add(Duration(days: 1000000)),
                      );
                      chemical.date = date;
                      setState(() {});
                    },
                    child: AttributeItem(
                      child: SelectorAttributeItem(
                          hintText: LocaleKeys.dateIssued.tr(),
                          text: chemical.date?.ddMMYyyy(),
                          contentPadding: const EdgeInsets.all(4),
                          trailing: Assets.icons.icCalendar.svgBlack),
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      keyboardType: TextInputType.number,
                      hintText: LocaleKeys.openingStockAndPurchases.tr(),
                      onChanged: (value) => chemical.openingStock = double.tryParse(value),
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      keyboardType: TextInputType.number,
                      hintText: LocaleKeys.issued.tr(),
                      onChanged: (value) => chemical.issued = double.tryParse(value),
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      keyboardType: TextInputType.number,
                      hintText: LocaleKeys.balance.tr(),
                      onChanged: (value) => chemical.balance = double.tryParse(value),
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      hintText: LocaleKeys.mixture.tr(),
                      onChanged: (value) => chemical.mixture = value,
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      keyboardType: TextInputType.number,
                      hintText: LocaleKeys.usagePerHa.tr(),
                      onChanged: (value) => chemical.usagePerHa = double.tryParse(value),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: TextField(
                      minLines: 10,
                      maxLines: 100,
                      onChanged: (value) {
                        chemical.comment = value;
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.comments.tr(),
                      ),
                    ),
                  ),
                  Center(
                    child: CmoFilledButton(
                      title: LocaleKeys.save.tr(),
                      onTap: () => submit(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void submit() {
    Navigator.of(context).pop();
  }
}
