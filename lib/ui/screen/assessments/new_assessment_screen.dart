// ignore_for_file: inference_failure_on_function_invocation, inference_failure_on_instance_creation

import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/assessment.dart';
import 'package:cmo/state/assessment_cubit/assessment_cubit.dart';
import 'package:cmo/state/assessment_list_cubit/assessment_list_cubit.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/screen/assessments/choose_location_screen.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_dropdown.dart';
import 'package:cmo/ui/widget/cmo_option_tile.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewAssessmentScreen extends StatefulWidget {
  const NewAssessmentScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const NewAssessmentScreen()),
    );
  }

  @override
  State<NewAssessmentScreen> createState() => _NewAssessmentScreenState();
}

class _NewAssessmentScreenState extends State<NewAssessmentScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool loading = false;
  LatLng? _latLong;

  @override
  void initState() {
    super.initState();
  }

  Future<void> refesh() async {
    if (context.mounted) {
      await Future.wait([
        context.read<AssessmentListCubit>().loadStarted(),
        context.read<AssessmentListCubit>().loadCompleted(),
        context.read<AssessmentListCubit>().loadSynced(),
      ]);
    }
  }

  Future<void> onSubmit() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;
      final companyId = context.read<EntityCubit>().state.company?.id;
      final userId = context.read<UserInfoCubit>().state.join(
            (p0) => null,
            (p0) => p0.userInfo?.userId,
            (p0) => null,
          );

      if (companyId == null) return;
      if (userId == null) return;
      if (value == null) return;
      value = {...value};

      final assessmentId = DateTime.now().millisecondsSinceEpoch;
      value['AssessmentId'] = assessmentId;
      value['CompanyId'] = companyId;
      value['CreateDT'] = DateTime.now().toIso8601String();
      value['UserId'] = userId;
      value['Status'] = 1;
      value['IsActive'] = true;

      // value['Lat'] = lat.toString();
      // value['Lng'] = lng.toString();
      // value['Location'] = location.toString();

      final jobCategoryId =
          int.tryParse(value['JobCategoryId']?.toString() ?? '');
      final jobDescriptionId =
          int.tryParse(value['JobDescriptionId']?.toString() ?? '');
      final plantationId =
          int.tryParse(value['PlantationId']?.toString() ?? '');
      final contractorId =
          int.tryParse(value['ContractorId']?.toString() ?? '');
      final teamId = int.tryParse(value['TeamId']?.toString() ?? '');
      final workerId = value['WorkerId']?.toString();

      value['JobCategoryName'] =
          (await cmoDatabaseMasterService.getJobCategoryById(jobCategoryId))
              ?.jobCategoryName;
      value['JobDescriptionName'] = (await cmoDatabaseMasterService
              .getJobDescriptionById(jobDescriptionId))
          ?.jobDescriptionName;
      value['PlantationName'] =
          (await cmoDatabaseMasterService.getPlantationById(plantationId))
              ?.plantationName;
      value['ContractorName'] =
          (await cmoDatabaseMasterService.getContractorById(contractorId))
              ?.contractorName;
      value['TeamName'] =
          (await cmoDatabaseMasterService.getTeamById(teamId))?.teamName;

      final worker = await cmoDatabaseMasterService.getWorkerById(workerId);
      value['WorkerName'] =
          '${worker?.firstName} ${worker?.surname} (${worker?.idNumber})';

      debugPrint('onSubmit data: $value');
      if (context.mounted) {
        final success = await context
            .read<AssessmentCubit>()
            .submit(Assessment.fromJson(value));
        if (success && context.mounted) {
          context.read<AssessmentCubit>().cleanCache();
          Navigator.of(context).pop();
        }
      }
    }

    await refesh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.newAssessment.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: BlocSelector<EntityCubit, EntityState, int?>(
        selector: (state) {
          return state.company?.id;
        },
        builder: (context, companyId) {
          if (companyId == null) return const SizedBox();
          return FormBuilder(
            key: _formKey,
            initialValue:
                context.read<AssessmentCubit>().state.cacheCreateData ??
                    <String, dynamic>{},
            onChanged: () {
              _formKey.currentState!.save();
              debugPrint(_formKey.currentState!.value.toString());

              final newContractorId = int.tryParse(
                _formKey.currentState!.value['ContractorId']?.toString() ?? '',
              );
              final oldContractorId =
                  context.read<AssessmentCubit>().state.cacheContractorId;

              context
                  .read<AssessmentCubit>()
                  .updateCacheCreateData(_formKey.currentState!.value);

              if (oldContractorId != newContractorId) {
                // * remove team & worker & reload workers, teams
                final data = {..._formKey.currentState!.value};
                data['TeamId'] = null;
                data['WorkerId'] = null;
                _formKey.currentState!.patchValue(data);
              }
            },
            autovalidateMode: autoValidateMode,
            child: AutofillGroup(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildInputArea(companyId),
                      const SizedBox(height: 16),
                      BlocSelector<AssessmentCubit, AssessmentState, bool>(
                        selector: (state) {
                          return state.loading;
                        },
                        builder: (context, loading) {
                          return Row(
                            children: [
                              Flexible(
                                child: CmoFilledButton(
                                  loading: loading,
                                  title: LocaleKeys.save.tr(),
                                  onTap: onSubmit,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Flexible(
                                child: CmoFilledButton(
                                  title: LocaleKeys.startAssessment.tr(),
                                  onTap: onSubmit,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SafeArea(top: false, child: SizedBox(height: 16))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildInputArea(int companyId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(),
        CmoOptionTile(
          title: LocaleKeys.jobType.tr(),
          value: ' ',
          shouldShowArrow: false,
          shouldShowDivider: false,
          shouldAddPadding: false,
        ),
        FutureBuilder(
          future:
              cmoDatabaseMasterService.getJobCategoriesByCompanyId(companyId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CmoDropdown(
                name: 'JobCategoryId',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                hintText: LocaleKeys.jobType.tr(),
                itemsData: snapshot.data
                    ?.map(
                      (e) => CmoDropdownItem(
                        id: e.jobCategoryId,
                        name: e.jobCategoryName ?? '',
                      ),
                    )
                    .toList(),
              );
            }
            return const SizedBox();
          },
        ),
        const SizedBox(height: 12),
        CmoOptionTile(
          title: LocaleKeys.jobDescription.tr(),
          value: ' ',
          shouldShowArrow: false,
          shouldShowDivider: false,
          shouldAddPadding: false,
        ),
        FutureBuilder(
          future: cmoDatabaseMasterService.getJobDescriptions(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CmoDropdown(
                name: 'JobDescriptionId',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                hintText: LocaleKeys.jobDescription.tr(),
                itemsData: snapshot.data
                    ?.map(
                      (e) => CmoDropdownItem(
                        id: e.jobDescriptionId,
                        name: e.jobDescriptionName ?? '',
                      ),
                    )
                    .toList(),
              );
            }
            return const SizedBox();
          },
        ),
        const SizedBox(height: 12),
        CmoOptionTile(
          title: LocaleKeys.plantation.tr(),
          value: ' ',
          shouldShowArrow: false,
          shouldShowDivider: false,
          shouldAddPadding: false,
        ),
        FutureBuilder(
          future: cmoDatabaseMasterService.getPlantationsByCompanyId(companyId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CmoDropdown(
                name: 'PlantationId',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                hintText: LocaleKeys.plantation.tr(),
                itemsData: snapshot.data
                    ?.map(
                      (e) => CmoDropdownItem(
                        id: e.plantationId,
                        name: e.plantationName ?? '',
                      ),
                    )
                    .toList(),
              );
            }
            return const SizedBox();
          },
        ),
        const SizedBox(height: 12),
        CmoOptionTile(
          title: LocaleKeys.contractor.tr(),
          value: ' ',
          shouldShowArrow: false,
          shouldShowDivider: false,
          shouldAddPadding: false,
        ),
        FutureBuilder(
          future: cmoDatabaseMasterService.getContractorsByCompanyId(companyId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CmoDropdown(
                name: 'ContractorId',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                hintText: LocaleKeys.contractor.tr(),
                itemsData: snapshot.data
                    ?.map(
                      (e) => CmoDropdownItem(
                        id: e.contractorId,
                        name: e.contractorName ?? '',
                      ),
                    )
                    .toList(),
              );
            }
            return const SizedBox();
          },
        ),
        const SizedBox(height: 12),
        CmoOptionTile(
          title: LocaleKeys.team.tr(),
          value: ' ',
          shouldShowArrow: false,
          shouldShowDivider: false,
          shouldAddPadding: false,
        ),
        BlocSelector<AssessmentCubit, AssessmentState, int?>(
          selector: (state) {
            return state.cacheContractorId;
          },
          builder: (context, contractorId) {
            return FutureBuilder(
              future: cmoDatabaseMasterService
                  .getTeamsByCompanyIdAndContractorId(companyId, contractorId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CmoDropdown(
                    name: 'TeamId',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    enabled: contractorId != null,
                    hintText: LocaleKeys.team.tr(),
                    itemsData: snapshot.data
                        ?.map(
                          (e) => CmoDropdownItem(
                            id: e.teamId,
                            name: e.teamName ?? '',
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
        const SizedBox(height: 12),
        CmoOptionTile(
          title: LocaleKeys.worker.tr(),
          value: ' ',
          shouldShowArrow: false,
          shouldShowDivider: false,
          shouldAddPadding: false,
        ),
        BlocSelector<AssessmentCubit, AssessmentState, int?>(
          selector: (state) {
            return state.cacheContractorId;
          },
          builder: (context, contractorId) => FutureBuilder(
            future:
                cmoDatabaseMasterService.getWorkersByCompanyIdAndContractorId(
              companyId,
              contractorId,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CmoDropdown(
                  name: 'WorkerId',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  hintText: LocaleKeys.worker.tr(),
                  enabled: contractorId != null,
                  itemsData: snapshot.data
                      ?.map(
                        (e) => CmoDropdownItem(
                          id: e.workerId,
                          name: '${e.firstName} ${e.surname} (${e.idNumber})',
                        ),
                      )
                      .toList(),
                );
              }
              return const SizedBox();
            },
          ),
        ),
        const SizedBox(height: 12),
        CmoTappable(
          onTap: () async {
            final data =
                await ChooseLocationScreen.push<ChooseLocationScreenResult>(
              context,
            );
            if (data is ChooseLocationScreenResult) {
              debugPrint(data.toString());

              final newData = {..._formKey.currentState!.value};
              newData['Location'] = data.address;
              newData['Lat'] = data.latLong.latitude;
              newData['Lng'] = data.latLong.longitude;
              _formKey.currentState!.patchValue(newData);
              if (context.mounted) {
                setState(() {
                  _latLong = data.latLong;
                });
              }
            }
          },
          child: CmoOptionTile(
            title: LocaleKeys.siteLocation.tr(),
            value: ' ',
            shouldShowDivider: false,
            shouldAddPadding: false,
          ),
        ),
        if (_latLong != null)
          Text(
            '${_latLong?.latitude.toStringAsFixed(6)}, ${_latLong?.longitude.toStringAsFixed(6)}',
            style: context.textStyles.bodyNormal,
          ),
        const SizedBox(height: 4),
        CmoTextField(
          name: 'Location',
          enabled: false,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          hintText: LocaleKeys.siteLocation.tr(),
        ),
      ],
    );
  }
}
