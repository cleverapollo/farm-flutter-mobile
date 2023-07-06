import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

Future<PestsAndDiseasesRegisterTreatmentMethod?> showPetsAndDiseaseAddingDialog(
    BuildContext context,
    List<PestsAndDiseasesRegisterTreatmentMethod>
        pestsAndDiseasesRegisterTreatmentMethod) async {
  final result = await showDialog<PestsAndDiseasesRegisterTreatmentMethod?>(
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
                LocaleKeys.treatment_methods.tr(),
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.black),
              ),
              CmoDropdown<PestsAndDiseasesRegisterTreatmentMethod?>(
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
                itemsData: pestsAndDiseasesRegisterTreatmentMethod
                    .map((e) => CmoDropdownItem<
                            PestsAndDiseasesRegisterTreatmentMethod>(
                        id: e,
                        name:
                            e.pestsAndDiseasesRegisterTreatmentMethodNo ?? ''))
                    .toList(),
                onChanged: (PestsAndDiseasesRegisterTreatmentMethod? value) {
                  Navigator.pop(context, value);
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(LocaleKeys.close.tr()),
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
