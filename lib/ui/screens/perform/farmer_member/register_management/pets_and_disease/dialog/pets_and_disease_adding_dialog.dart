import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

Future<CmoDropdownItem<int>?> showPetsAndDiseaseAddingDialog(
    BuildContext context) async {
  final dropDownNameData = <CmoDropdownItem<int>>[
    CmoDropdownItem(id: 1, name: 'Test 1'),
    CmoDropdownItem(id: 2, name: 'Test 2'),
    CmoDropdownItem(id: 3, name: 'Test 3'),
  ];

  final result = await showDialog<CmoDropdownItem<int>?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(LocaleKeys.select_treatment_method.tr()),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              CmoTextField(
                name: LocaleKeys.search.tr(),
                hintText: LocaleKeys.search.tr(),
                suffixIcon: Assets.icons.icSearch.svg(),
                onChanged: (input) {},
              ),
              const SizedBox(height: 16.0),
              Text(
                'Treatment Methods',
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.black),
              ),
              CmoDropdown(
                name: '',
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.black),
                inputDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                  isDense: true,
                  hintText: '',
                  hintStyle: context.textStyles.bodyNormal.grey,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: context.colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: context.colors.blue),
                  ),
                ),
                itemsData: dropDownNameData,
                onChanged: (int? value) {
                  Navigator.pop(
                      context,
                      dropDownNameData
                          .where((element) => element.id == value)
                          .first);
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  return result;
}
