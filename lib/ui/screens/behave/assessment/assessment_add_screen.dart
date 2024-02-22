// ignore_for_file: inference_failure_on_function_invocation, inference_failure_on_instance_creation

import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/assessment.dart';
import 'package:cmo/model/data/contractor.dart';
import 'package:cmo/model/data/job_category.dart';
import 'package:cmo/model/data/job_description.dart';
import 'package:cmo/model/data/plantation.dart';
import 'package:cmo/model/data/team.dart';
import 'package:cmo/model/data/worker.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/select_site_location_screen.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_item_selected_screen.dart';
import 'package:cmo/ui/screens/behave/assessment/widgets/assessment_selected_item.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AssessmentAddScreen extends StatefulWidget {
  const AssessmentAddScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AssessmentAddScreen()),
    );
  }

  @override
  State<AssessmentAddScreen> createState() => _AssessmentAddScreenState();
}

class _AssessmentAddScreenState extends State<AssessmentAddScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool loading = false;
  LatLng? _latLong;
  JobCategory? _jobCategory;
  JobDescription? _jobDescription;
  Plantation? _plantation;
  Contractor? _contractor;
  Team? _team;
  Worker? _worker;
  SiteLocationScreenResult? _locationResult;
  final _jobCategoryController = TextEditingController();
  final _jobDescriptionController = TextEditingController();
  final _plantationController = TextEditingController();
  final _contractorController = TextEditingController();
  final _teamController = TextEditingController();
  final _workerController = TextEditingController();
  final _locationResultController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> refresh() async {
    if (context.mounted) {
      await context.read<AssessmentListCubit>().refresh();
      await context.read<DashboardCubit>().refresh();
    }
  }

  Future<void> onSubmit() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final companyId = context.read<EntityCubit>().state.company?.id;
      final userInfo = await configService.getActiveUser();
      final userId = userInfo?.userId;

      if (companyId == null) return;
      if (userId == null) return;

      final assessment = Assessment(
        assessmentId: DateTime.now().millisecondsSinceEpoch,
        companyId: companyId,
        createDT: DateTime.now().toIso8601String(),
        userId: userId,
        status: 1,
        isActive: true,
        jobCategoryId: _jobCategory?.id,
        jobCategoryName: _jobCategory?.jobCategoryName,
        jobDescriptionId: _jobDescription?.id,
        jobDescriptionName: _jobDescription?.jobDescriptionName,
        plantationId: _plantation?.id,
        plantationName: _plantation?.plantationName,
        contractorId: _contractor?.id,
        contractorName: _contractor?.contractorName,
        teamId: _team?.id,
        teamName: _team?.teamName,
        workerId: _worker?.workerId,
        workerName:
            '${_worker?.firstName} ${_worker?.surname} (${_worker?.idNumber})',
        location: _locationResult?.address,
        lat: _locationResult?.latLong?.latitude,
        long: _locationResult?.latLong?.longitude,
      );
      if (context.mounted) {
        final success =
            await context.read<AssessmentCubit>().submit(assessment);
        if (success && context.mounted) {
          context.read<AssessmentCubit>().cleanCache();
          Navigator.of(context).pop();
        }
      }
    }

    await refresh();
  }

  void onChanged() {
    _formKey.currentState!.save();

    final newContractorId = int.tryParse(
      _formKey.currentState!.value['ContractorId']?.toString() ?? '',
    );
    final oldContractorId =
        context.read<AssessmentCubit>().state.cacheContractorId;

    context
        .read<AssessmentCubit>()
        .updateCacheCreateData(_formKey.currentState!.value);

    if (oldContractorId != newContractorId) {
      final data = {..._formKey.currentState!.value};
      data['TeamId'] = null;
      data['WorkerId'] = null;
      _formKey.currentState!.patchValue(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.newAssessment.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
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
            onChanged: onChanged,
            autovalidateMode: autoValidateMode,
            child: AutofillGroup(
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
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
        AssessmentSelectedItem(
          title: LocaleKeys.jobType.tr(),
          onTap: () async {
            final items = await cmoDatabaseMasterService
                .getJobCategoriesByCompanyId(companyId);
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            final item = await AssessmentItemSelectedScreen.push(
              context,
              title: LocaleKeys.jobType.tr(),
              items: items
                  .map((e) => AssessmentItem(e.jobCategoryName ?? '', e))
                  .toList(),
            );
            if (item == null || item is! AssessmentItem) {
              return;
            }
            _jobCategory = item.rawValue as JobCategory;
            _jobCategoryController.text = _jobCategory?.jobCategoryName ?? '';
            setState(() {});
          },
          textEditingController: _jobCategoryController,
        ),
        const SizedBox(height: 8),
        AssessmentSelectedItem(
          title: LocaleKeys.job_description.tr(),
          textEditingController: _jobDescriptionController,
          onTap: () async {
            final jobTypes =
                await cmoDatabaseMasterService.getJobDescriptions();
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            final item = await AssessmentItemSelectedScreen.push(
              context,
              title: LocaleKeys.job_description.tr(),
              items: jobTypes
                  .map((e) => AssessmentItem(e.jobDescriptionName ?? '', e))
                  .toList(),
            );
            if (item == null || item is! AssessmentItem) {
              return;
            }
            _jobDescription = item.rawValue as JobDescription;
            _jobDescriptionController.text =
                _jobDescription?.jobDescriptionName ?? '';
            setState(() {});
          },
        ),
        const SizedBox(height: 8),
        AssessmentSelectedItem(
          title: LocaleKeys.plantation.tr(),
          textEditingController: _plantationController,
          onTap: () async {
            final items = await cmoDatabaseMasterService
                .getPlantationsByCompanyId(companyId);
            if (!context.mounted) return;
            final item = await AssessmentItemSelectedScreen.push(
              context,
              title: LocaleKeys.plantation.tr(),
              items: items
                  .map((e) => AssessmentItem(e.plantationName ?? '', e))
                  .toList(),
            );
            if (item == null || item is! AssessmentItem) {
              return;
            }
            _plantation = item.rawValue as Plantation;
            _plantationController.text = _plantation?.plantationName ?? '';
            setState(() {});
          },
        ),
        const SizedBox(height: 8),
        AssessmentSelectedItem(
          title: LocaleKeys.contractor.tr(),
          textEditingController: _contractorController,
          onTap: () async {
            final items = await cmoDatabaseMasterService
                .getContractorsByCompanyId(companyId);
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            final item = await AssessmentItemSelectedScreen.push(
              context,
              title: LocaleKeys.contractor.tr(),
              items: items
                  .map((e) => AssessmentItem(e.contractorName ?? '', e))
                  .toList(),
            );
            if (item == null || item is! AssessmentItem) {
              return;
            }
            final contractor = item.rawValue as Contractor;
            if (_contractor == contractor) {
              return;
            }
            _contractor = contractor;
            _contractorController.text = contractor?.contractorName ?? '';
            _team = null;
            _teamController.text = '';
            _worker = null;
            _workerController.text = '';
            setState(() {});
          },
        ),
        const SizedBox(height: 8),
        AssessmentSelectedItem(
          title: LocaleKeys.team.tr(),
          textEditingController: _teamController,
          onTap: () async {
            if (_contractor == null) {
              return;
            }
            final items = await cmoDatabaseMasterService
                .getTeamsByCompanyIdAndContractorId(
                    companyId, _contractor!.contractorId);
            if (items.isEmpty) {
              return;
            }
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            final item = await AssessmentItemSelectedScreen.push(
              context,
              title: LocaleKeys.team.tr(),
              items: items
                  .map((e) => AssessmentItem(e.teamName ?? '', e))
                  .toList(),
            );
            if (item == null || item is! AssessmentItem) {
              return;
            }
            _team = item.rawValue as Team;
            _teamController.text = _team?.teamName ?? '';
            setState(() {});
          },
        ),
        const SizedBox(height: 8),
        AssessmentSelectedItem(
          title: LocaleKeys.worker.tr(),
          textEditingController: _workerController,
          onTap: () async {
            if (_contractor == null) {
              return;
            }
            final items = await cmoDatabaseMasterService
                .getWorkersByCompanyIdAndContractorId(
                    companyId, _contractor!.contractorId);
            if (items.isEmpty) {
              return;
            }
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            final item = await AssessmentItemSelectedScreen.push(
              context,
              title: LocaleKeys.worker.tr(),
              items: items
                  .map((e) => AssessmentItem(
                      '${e.firstName} ${e.surname} (${e.idNumber})' ?? '', e))
                  .toList(),
            );
            if (item == null || item is! AssessmentItem) {
              return;
            }
            _worker = item.rawValue as Worker;
            _workerController.text =
                '${_worker!.firstName} ${_worker!.surname} (${_worker!.idNumber})';
            setState(() {});
          },
        ),
        const SizedBox(height: 8),
        AssessmentSelectedItem(
          title: LocaleKeys.siteLocation.tr(),
          textEditingController: _locationResultController,
          onTap: () async {
            final data =
                await SelectSiteLocationScreen.push<SiteLocationScreenResult>(
              context,
            );
            if (data is SiteLocationScreenResult) {
              _locationResult = data;
              _latLong = data.latLong;
              _locationResultController.text =
                  '${_locationResult?.address}\n${_latLong?.latitude.toStringAsFixed(6)}, ${_latLong?.longitude.toStringAsFixed(6)}';
              if (context.mounted) {
                setState(() {});
              }
            }
          },
        ),
      ],
    );
  }
}
