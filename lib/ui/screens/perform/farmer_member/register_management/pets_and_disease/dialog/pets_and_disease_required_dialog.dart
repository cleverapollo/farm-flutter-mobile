import 'package:cmo/l10n/l10n.dart';
import 'package:flutter/material.dart';

Future<void> showPetsAndDiseaseRequiredDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(LocaleKeys.pets_and_diseases_required.tr()),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                  LocaleKeys.please_select_a_pet_and_disease_name_before_adding_treatment_methods.tr()),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(LocaleKeys.ok.tr().toUpperCase()),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
