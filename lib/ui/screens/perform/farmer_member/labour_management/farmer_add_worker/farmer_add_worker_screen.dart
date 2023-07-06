import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/labour_management/labour_management_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_worker/widgets/farmer_add_worker_upload_avatar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_worker/widgets/farmer_select_gender_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_worker/job_description/farmer_add_worker_select_job_description.dart';

class FarmerAddWorkerScreen extends StatefulWidget {

  final FarmerWorker? farmerWorker;
  final bool isEditing;

  FarmerAddWorkerScreen({
    super.key,
    this.farmerWorker,
    this.isEditing = false,
  });

  @override
  State<StatefulWidget> createState() => _FarmerAddWorkerScreenState();

  static Future<void> push(
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

class _FarmerAddWorkerScreenState extends State<FarmerAddWorkerScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late FarmerWorker farmerWorker;

  @override
  void initState() {
    super.initState();
    if (widget.isEditing && widget.farmerWorker != null) {
      farmerWorker = widget.farmerWorker!;
    } else {
      farmerWorker = FarmerWorker(
        farmId: context.read<LabourManagementCubit>().state.activeFarm?.farmId,
        createDT: DateTime.now().millisecondsSinceEpoch.toString(),
        workerId: DateTime.now().millisecondsSinceEpoch.toString(),
      );
    }
  }

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
        farmerWorker = farmerWorker.copyWith(
          dateOfBirth: value['DateOfBirth'].toString(),
        );

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheFarmerWorker(farmerWorker);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.createWorker.tr()} $resultId',
            );

            await context.read<LabourManagementCubit>().loadListWorkers();
            Navigator.of(context).pop();
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.addLabour.tr(),
          subtitle: '${LocaleKeys.rmu_name.tr()}: Border Timbers',
          subtitleTextStyle: context.textStyles.bodyBold.blue,
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FarmerStakeHolderUploadAvatar(
                onSelectAvatar: (photoPath) {
                  farmerWorker = farmerWorker.copyWith(
                    photo: photoPath,
                    // avatarFileName: DateTime.now().toString(),
                  );
                },
              ),
              CmoHeaderTile(title: LocaleKeys.details.tr()),
              _buildInputArea(),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CmoFilledButton(
          title: LocaleKeys.save.tr(),
          onTap: onSubmit,
          loading: loading,
        ),
      ),
    );
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
                  hintText: LocaleKeys.firstName.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  initialValue: farmerWorker.firstName,
                  onChanged: (value) {
                    farmerWorker = farmerWorker.copyWith(firstName: value);
                  },
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.lastName.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  initialValue: farmerWorker.surname,
                  onChanged: (value) {
                    farmerWorker = farmerWorker.copyWith(surname: value);
                  },
                ),
              ),
              _buildSelectBirth(),
              _buildJobDescription(),
              AttributeItem(
                child: Row(
                  children: [
                    Expanded(
                      child: InputAttributeItem(
                        hintText: LocaleKeys.idNumber.tr(),
                        keyboardType: TextInputType.number,
                        hintTextStyle: context.textStyles.bodyBold.black,
                        initialValue: farmerWorker.idNumber,
                        onChanged: (value) {
                          farmerWorker = farmerWorker.copyWith(idNumber: value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Assets.icons.icBarcode.svgBlack,
                    ),
                  ],
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.phoneNumber.tr(),
                  keyboardType: TextInputType.number,
                  initialValue: farmerWorker.phoneNumber,
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    farmerWorker = farmerWorker.copyWith(phoneNumber: value);
                  },
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.nationality.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  initialValue: farmerWorker.nationality,
                  onChanged: (value) {
                    farmerWorker = farmerWorker.copyWith(nationality: value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateOfBirth',
        hintText: LocaleKeys.dateOfBirth.tr(),
        validator: requiredValidator,
        initialValue: DateTime.tryParse(farmerWorker.dateOfBirth ?? ''),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateOfBirth.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateOfBirth.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _buildJobDescription() {
    return InkWell(
      onTap: () {
        FarmerStakeHolderSelectJobDescription.push(
          context,
          farmerWorker.jobDescription,
          (listJobsDesc) {
            setState(() {
              farmerWorker =
                  farmerWorker.copyWith(jobDescription: listJobsDesc);
            });
          },
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
              Text(
                farmerWorker.jobDescription?.length.toString() ?? '',
                style: context.textStyles.bodyBold.black,
              ),
              Assets.icons.icArrowRight.svgBlack,
            ],
          ),
        ),
      ),
    );
  }
}
