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

import 'job_description/farmer_add_worker_select_job_description.dart';

class FarmerAddWorkerScreen extends StatefulWidget {
  const FarmerAddWorkerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FarmerAddWorkerScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FarmerAddWorkerScreen(),
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
    farmerWorker = FarmerWorker();
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
          title: LocaleKeys.addStakeholders.tr(),
          subtitle: 'RMU Name: Border Timbers',
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
                  onChanged: (value) {
                    farmerWorker = farmerWorker.copyWith(firstName: value);
                  },
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.lastName.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    farmerWorker = farmerWorker.copyWith(lastName: value);
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
                        onChanged: (value) {
                          farmerWorker = farmerWorker.copyWith(idNumber: int.tryParse(value));
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
                  onChanged: (value) {
                    farmerWorker = farmerWorker.copyWith(nationality: value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: FarmerSelectGenderWidget(
                  onTap: (id) {
                    farmerWorker = farmerWorker.copyWith(gender: id);
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
        FarmerStakeHolderSelectJobDescription.push(context, farmerWorker.jobDescription, (listJobsDesc) {
          setState(() {
            farmerWorker = farmerWorker.copyWith(jobDescription: listJobsDesc);
          });
        });
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
