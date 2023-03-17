import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/ui/snack/success.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_date_picker.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateWorkerScreen extends StatefulWidget {
  const CreateWorkerScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CreateWorkerScreen()),
    );
  }

  @override
  State<CreateWorkerScreen> createState() => _CreateWorkerScreenState();
}

class _CreateWorkerScreenState extends State<CreateWorkerScreen> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> onSubmit() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.createWorker.tr(),
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(),
              CmoHeaderTile(title: LocaleKeys.details.tr()),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: buildInputArea(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        floatingActionButton: CmoFilledButton(
          title: LocaleKeys.save.tr(),
          onTap: onSubmit,
          loading: loading,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(),
            CmoHeaderTile(title: LocaleKeys.details.tr()),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: buildInputArea(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputArea() {
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        _formKey.currentState!.save();
        debugPrint(_formKey.currentState!.value.toString());
      },
      autovalidateMode: autoValidateMode,
      child: AutofillGroup(
        child: Column(
          children: [
            CmoTextField(
              name: 'firstName',
              hintText: LocaleKeys.firstName.tr(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            CmoTextField(
              name: 'surname',
              hintText: LocaleKeys.surname.tr(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            CmoTextField(
              name: 'idNumber',
              hintText: LocaleKeys.idNumber.tr(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            CmoDatePicker(
              name: 'dob',
              hintText: LocaleKeys.dateOfBirth.tr(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
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
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            CmoTextField(
              name: 'gender',
              hintText: LocaleKeys.gender.tr(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            CmoTextField(
              name: 'disability',
              hintText: LocaleKeys.disability.tr(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            CmoTextField(
              name: 'municipality',
              hintText: LocaleKeys.municipality.tr(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            CmoTextField(
              name: 'province',
              hintText: LocaleKeys.province.tr(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
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
    );
  }
}
