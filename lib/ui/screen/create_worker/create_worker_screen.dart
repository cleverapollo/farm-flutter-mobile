import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/ui/snack/success.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_company_service_builder.dart';
import 'package:cmo/ui/widget/cmo_date_picker.dart';
import 'package:cmo/ui/widget/cmo_dropdown.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:cmo/ui/widget/cmo_option_tile.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool loading = false;

  Future<void> onSubmit() async {
    final companyId = context.read<EntityCubit>().state.company?.id;
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
        debugPrint('onSubmit data: ${_formKey.currentState?.value}');
        await hideInputMethod();
        final workerId = DateTime.now().millisecondsSinceEpoch;
        value['WorkerId'] = workerId.toString();
        value['CompanyId'] = companyId;
        value['IsActive'] = true;
        value['IsLocal'] = true;

        if (value['DOB'] is DateTime) {
          final dob = value['DOB'] as DateTime;
          value['DOB'] = dob.toIso8601String();
        }
        final worker = Worker.fromJson(value);

        int? resultId;

        if (mounted) {
          final databaseService =
              context.read<EntityCubit>().state.companyService;
          if (databaseService != null) {
            await (await databaseService.db).writeTxn(() async {
              resultId = await databaseService.cacheWorker(worker);
            });
          }
        }

        if (resultId != null) {
          debugPrint(
            'Create Worker Success: $resultId ${Json.tryEncode(worker.toJson())}',
          );
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${LocaleKeys.createWorker.tr()} $resultId',
            );
            Navigator.of(context).pop();
          }
        }
      } catch (e, s) {
        debugPrint('onSubmit error: $e $s');
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
