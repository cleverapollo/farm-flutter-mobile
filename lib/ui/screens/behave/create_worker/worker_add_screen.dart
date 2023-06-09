import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_date_picker.dart';
import 'package:cmo/ui/widget/cmo_dropdown.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class WorkerAddScreen extends StatefulWidget {
  const WorkerAddScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const WorkerAddScreen()),
    );
  }

  @override
  State<WorkerAddScreen> createState() => _WorkerAddScreenState();
}

class _WorkerAddScreenState extends State<WorkerAddScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
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
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheWorker(worker);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.createWorker.tr()} $resultId',
            );
            Navigator.of(context).pop();
          }
        }
      } finally {
        setState(() {
          loading = false;
        });

        if (context.mounted) {
          await context.read<DashboardCubit>().refresh();
        }
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
    );
  }

  Widget buildInputArea() {
    return FormBuilder(
      key: _formKey,
      onChanged: () => _formKey.currentState!.save(),
      autovalidateMode: autoValidateMode,
      child: AutofillGroup(
        child: Column(
          children: [
            CmoTextField(
              name: 'FirstName',
              hintText: LocaleKeys.firstName.tr(),
              validator: requiredValidator,
            ),
            CmoTextField(
              name: 'Surname',
              hintText: LocaleKeys.surname.tr(),
              validator: requiredValidator,
            ),
            CmoTextField(
              name: 'IdNumber',
              hintText: LocaleKeys.idNumber.tr(),
              validator: requiredValidator,
            ),
            CmoDatePicker(
              name: 'DOB',
              hintText: LocaleKeys.dateOfBirth.tr(),
              validator: requiredValidator,
            ),
            CmoTextField(
              name: 'ContactNumber',
              hintText: LocaleKeys.contactNumber.tr(),
            ),
            CmoTextField(
              name: 'Email',
              hintText: LocaleKeys.email.tr(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
              ]),
            ),
            CmoDropdown(
              name: 'RaceId',
              validator: requiredValidator,
              hintText: LocaleKeys.race.tr(),
              itemsData: [
                CmoDropdownItem(id: 1, name: 'black'),
                CmoDropdownItem(id: 2, name: 'white'),
              ],
            ),
            CmoDropdown(
              name: 'GenderId',
              validator: requiredValidator,
              hintText: LocaleKeys.gender.tr(),
              itemsData: [
                CmoDropdownItem(id: 1, name: LocaleKeys.male_key.tr()),
                CmoDropdownItem(id: 2, name: LocaleKeys.female_key.tr()),
                CmoDropdownItem(id: 3, name: LocaleKeys.unknown.tr()),
              ],
            ),
            CmoDropdown(
              name: 'DisabilityId',
              validator: requiredValidator,
              hintText: LocaleKeys.disability.tr(),
              itemsData: [
                CmoDropdownItem(id: 1, name: LocaleKeys.none.tr()),
              ],
            ),
            FutureBuilder(
              future: cmoDatabaseMasterService.getMunicipalitys(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CmoDropdown(
                    name: 'MunicipalityId',
                    validator: requiredValidator,
                    hintText: LocaleKeys.municipality.tr(),
                    itemsData: snapshot.data
                        ?.map(
                          (e) => CmoDropdownItem(
                            id: e.id,
                            name: e.municipalityName ?? '',
                          ),
                        )
                        .toList(),
                  );
                }
                return const SizedBox();
              },
            ),
            FutureBuilder(
              future: cmoDatabaseMasterService.getProvinces(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CmoDropdown(
                    name: 'ProvinceId',
                    validator: requiredValidator,
                    hintText: LocaleKeys.province.tr(),
                    itemsData: snapshot.data
                        ?.map(
                          (e) => CmoDropdownItem(
                            id: e.id,
                            name: e.provinceName ?? '',
                          ),
                        )
                        .toList(),
                  );
                }
                return const SizedBox();
              },
            ),
            BlocSelector<EntityCubit, EntityState, int?>(
              selector: (state) {
                return state.company?.id;
              },
              builder: (context, companyId) {
                if (companyId == null) return const SizedBox();
                return FutureBuilder(
                  future: cmoDatabaseMasterService
                      .getContractorsByCompanyId(companyId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CmoDropdown(
                        name: 'ContractorId',
                        validator: requiredValidator,
                        hintText: LocaleKeys.contractor.tr(),
                        itemsData: snapshot.data
                            ?.map(
                              (e) => CmoDropdownItem(
                                id: e.id,
                                name: e.contractorName ?? '',
                              ),
                            )
                            .toList(),
                      );
                    }
                    return const SizedBox();
                  },
                );
              },
            ),
            FutureBuilder(
              future: cmoDatabaseMasterService.getJobDescriptions(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CmoDropdown(
                    name: 'JobDescriptionId',
                    validator: requiredValidator,
                    hintText: LocaleKeys.jobDescription.tr(),
                    itemsData: snapshot.data
                        ?.map(
                          (e) => CmoDropdownItem(
                            id: e.id,
                            name: e.jobDescriptionName ?? '',
                          ),
                        )
                        .toList(),
                  );
                }
                return const SizedBox();
              },
            ),
            CmoTextField(
              name: 'Notes',
              hintText: LocaleKeys.notes.tr(),
              maxLines: 2,
            ),
          ].withSpaceBetween(
            height: 16,
          ),
        ),
      ),
    );
  }
}
