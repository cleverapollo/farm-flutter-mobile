import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/input_formatter_extension.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/state/labour_management/labour_management_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_worker/job_description/farmer_add_worker_select_job_description.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_worker/widgets/farmer_add_worker_upload_avatar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_worker/widgets/farmer_select_gender_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FarmerAddWorkerScreen extends BaseStatefulWidget {
  FarmerAddWorkerScreen({super.key, this.farmerWorker, this.isEditing = false})
      : super(
          screenName: isEditing
              ? LocaleKeys.labour_detail.tr()
              : LocaleKeys.addLabour.tr(),
        );

  final FarmerWorker? farmerWorker;
  final bool isEditing;

  @override
  State<StatefulWidget> createState() => _FarmerAddWorkerScreenState();

  static Future<dynamic> push(
    BuildContext context, {
    FarmerWorker? farmerWorker,
    bool isEditing = false,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FarmerAddWorkerScreen(
          isEditing: isEditing,
          farmerWorker: farmerWorker,
        ),
      ),
    );
  }
}

class _FarmerAddWorkerScreenState extends BaseStatefulWidgetState<FarmerAddWorkerScreen> {
  final isAllValid = ValueNotifier<bool>(false);

  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late FarmerWorker farmerWorker;

  final selectedWorkerJobDescriptions =
      ValueNotifier<List<WorkerJobDescription>>([]);

  Future<void> onSubmit() async {
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

        int? resultId;

        final futures = <Future<int?>>[];

        final needDeleted = await cmoDatabaseMasterService
            .deletedWorkerJobDescriptionByJobDescriptionId(
                farmerWorker.workerId);

        var count = DateTime.now().microsecondsSinceEpoch;

        for (final item in selectedWorkerJobDescriptions.value) {
          futures.add(cmoDatabaseMasterService.cacheWorkerJobDescription(
              item.copyWith(workerJobDescriptionId: count++)));
        }

        final canNext = await Future.wait(futures);

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          resultId =
              await databaseService.cacheWorkerFromFarm(farmerWorker.copyWith(
            genderId: farmerWorker.genderId ?? 1,
            isLocal: 1,
            isActive: true,
            createDT: DateTime.now().toIso8601String(),
            updateDT: DateTime.now().toIso8601String(),
          ));

          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.createWorker.tr()} $resultId',
            );

            await context.read<LabourManagementCubit>().loadListWorkers();
            await context.read<DashboardCubit>().refresh();
          }

          if(context.mounted){
            return Navigator.of(context).pop(farmerWorker);
          }
        }
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.isEditing && widget.farmerWorker != null) {
      farmerWorker = widget.farmerWorker!;
      _validate(isInit: true);
    } else {
      farmerWorker = FarmerWorker(
        farmId: context.read<LabourManagementCubit>().state.activeFarm?.farmId,
        createDT: widget.farmerWorker?.createDT ?? DateTime.now().millisecondsSinceEpoch.toString(),
        workerId: DateTime.now().millisecondsSinceEpoch.toString(),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      selectedWorkerJobDescriptions.value = await cmoDatabaseMasterService
          .getWorkerJobDescriptionByWorkerId(farmerWorker.workerId ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: widget.isEditing
              ? LocaleKeys.labour_detail.tr()
              : LocaleKeys.addLabour.tr(),
          subtitle:
              context.read<LabourManagementCubit>().state.activeFarm?.farmName,
          subtitleTextStyle: context.textStyles.bodyBold.blue,
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FarmerStakeHolderUploadAvatar(
                photoUrl: farmerWorker.photo,
                onSelectAvatar: (photoPath) {
                  farmerWorker = farmerWorker.copyWith(
                    photo: photoPath,
                  );
                },
              ),
              CmoHeaderTile(title: LocaleKeys.details.tr()),
              _buildInputArea(),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ValueListenableBuilder(
          valueListenable: isAllValid,
          builder: (context, canSave, __) {
            return CmoFilledButton(
              disable: !canSave,
              title: LocaleKeys.save.tr(),
              onTap: onSubmit,
              loading: loading,
            );
          },
        ),
      ),
    );
  }

  String? _validateFirstName = '';
  String? _validateLastName = '';
  String? _validateIdNumber = '';
  String? _validatePhoneNumber = '';

  void _validate({bool isInit = false}) {
    if (isInit) {
      final isValid = !farmerWorker.firstName.isNullOrEmpty &&
          !farmerWorker.surname.isNullOrEmpty &&
          !farmerWorker.idNumber.isNullOrEmpty &&
          !farmerWorker.phoneNumber.isNullOrEmpty;
      isAllValid.value = isValid;
      return;
    }

    final validate = _validateFirstName.isNullOrEmpty ||
        _validateLastName.isNullOrEmpty ||
        _validateIdNumber.isNullOrEmpty ||
        _validatePhoneNumber.isNullOrEmpty;

    isAllValid.value = !validate;
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: FormBuilder(
        key: _formKey,
        onChanged: () {},
        autovalidateMode: autoValidateMode,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AttributeItem(
                child: InputAttributeItem(
                  labelText: LocaleKeys.firstName.tr(),
                  labelTextStyle: context.textStyles.bodyBold.blueDark2,
                  textStyle: context.textStyles.bodyNormal.blueDark2,
                  initialValue: farmerWorker.firstName,
                  onChanged: (value) {
                    _validateFirstName = value;
                    farmerWorker = farmerWorker.copyWith(firstName: value);
                    _validate();
                  },
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  labelText: LocaleKeys.lastName.tr(),
                  labelTextStyle: context.textStyles.bodyBold.blueDark2,
                  textStyle: context.textStyles.bodyNormal.blueDark2,
                  initialValue: farmerWorker.surname,
                  onChanged: (value) {
                    _validateLastName = value;
                    farmerWorker = farmerWorker.copyWith(surname: value);
                    _validate();
                  },
                ),
              ),
              _buildSelectBirth(),
              _buildJobDescription(),
              AttributeItem(
                child: InputAttributeItem(
                  keyboardType: TextInputType.name,
                  inputFormatters: [UpperCaseTextFormatter()],
                  labelText: LocaleKeys.idNumber.tr(),
                  labelTextStyle: context.textStyles.bodyBold.blueDark2,
                  textStyle: context.textStyles.bodyNormal.blueDark2,
                  initialValue: farmerWorker.idNumber,
                  onChanged: (value) {
                    _validateIdNumber = value;
                    farmerWorker = farmerWorker.copyWith(idNumber: value);
                    _validate();
                  },
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  keyboardType: TextInputType.number,
                  initialValue: farmerWorker.phoneNumber,
                  labelText: LocaleKeys.phoneNumber.tr(),
                  labelTextStyle: context.textStyles.bodyBold.blueDark2,
                  textStyle: context.textStyles.bodyNormal.blueDark2,
                  onChanged: (value) {
                    _validatePhoneNumber = value;
                    farmerWorker = farmerWorker.copyWith(phoneNumber: value);
                    _validate();
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: FarmerSelectGenderWidget(
                  initialValue: farmerWorker.genderId,
                  onTap: (id) {
                    farmerWorker = farmerWorker.copyWith(genderId: id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectBirth() {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.tryParse(farmerWorker.dateOfBirth ?? '') ??
              DateTime.now(),
          firstDate: DateTime.now().add(const Duration(days: -1000000)),
          lastDate: DateTime.now(),
        );

        if (date != null) {
          setState(() {
            farmerWorker =
                farmerWorker.copyWith(dateOfBirth: date.toIso8601String());
          });
        }
      },
      child: AttributeItem(
        child: SelectorAttributeItem(
          hintText: '',
          text: farmerWorker.dateOfBirth.isBlank
              ? LocaleKeys.yyyy_mm_dd.tr()
              : DateTime.tryParse(farmerWorker.dateOfBirth!).yMd(),
          labelText: LocaleKeys.dateOfBirth.tr(),
          labelStyle: context.textStyles.bodyBold.blueDark2,
          textStyle: farmerWorker.dateOfBirth.isBlank
              ? context.textStyles.bodyNormal.grey
              : context.textStyles.bodyNormal.blueDark2,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          trailing: Assets.icons.icCalendar.svgBlack,
        ),
      ),
    );
  }

  Widget _buildJobDescription() {
    return BlocBuilder<LabourManagementCubit, LabourManagementState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            FarmerStakeHolderSelectJobDescription.push(
              context: context,
              selectedJobDesc: selectedWorkerJobDescriptions.value,
              onSave: (result) {
                selectedWorkerJobDescriptions.value =
                    selectedWorkerJobDescriptions.value
                      ..clear()
                      ..addAll(result);
              },
              workerId: int.tryParse(farmerWorker.workerId ?? ''),
              workerName: farmerWorker.fullName,
            );
          },
          child: AttributeItem(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      LocaleKeys.jobDescription.tr(),
                      style: context.textStyles.bodyBold.black,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: selectedWorkerJobDescriptions,
                    builder: (context, data, _) {
                      return Text(
                        data.length.toString() ?? '',
                        style: context.textStyles.bodyBold.black,
                      );
                    },
                  ),
                  Assets.icons.icArrowRight.svgBlack,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
