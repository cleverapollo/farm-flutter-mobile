import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:cmo/ui/widget/cmo_option_tile.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';

class CreateWorkerScreen extends StatelessWidget {
  const CreateWorkerScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CreateWorkerScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.createWorker.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Row(),
          CmoHeaderTile(title: LocaleKeys.details.tr()),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                CmoTextField(
                  name: 'firstName',
                  hintText: LocaleKeys.firstName.tr(),
                ),
                CmoTextField(
                  name: 'surname',
                  hintText: LocaleKeys.surname.tr(),
                ),
                CmoTextField(
                  name: 'surname',
                  hintText: LocaleKeys.idNumber.tr(),
                ),
                CmoTextField(
                  name: 'dob',
                  hintText: LocaleKeys.dateOfBirth.tr(),
                ),
                // CmoOptionTile(
                //   title: LocaleKeys.dateOfBirth.tr(),
                // ),
                CmoTextField(
                  name: 'contactNumber',
                  hintText: LocaleKeys.contactNumber.tr(),
                ),
                CmoTextField(
                  name: 'email',
                  hintText: LocaleKeys.email.tr(),
                ),
                CmoTextField(
                  name: 'race',
                  hintText: LocaleKeys.race.tr(),
                ),
                CmoTextField(
                  name: 'gender',
                  hintText: LocaleKeys.gender.tr(),
                ),
                CmoTextField(
                  name: 'disability',
                  hintText: LocaleKeys.disability.tr(),
                ),
                CmoTextField(
                  name: 'municipality',
                  hintText: LocaleKeys.municipality.tr(),
                ),
                CmoTextField(
                  name: 'province',
                  hintText: LocaleKeys.province.tr(),
                ),
                CmoTextField(
                  name: 'contractor',
                  hintText: LocaleKeys.contractor.tr(),
                ),
                CmoTextField(
                  name: 'jobDescription',
                  hintText: LocaleKeys.jobDescription.tr(),
                ),
                CmoTextField(
                  name: 'notes',
                  hintText: LocaleKeys.notes.tr(),
                ),
              ].withSpaceBetween(
                height: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
