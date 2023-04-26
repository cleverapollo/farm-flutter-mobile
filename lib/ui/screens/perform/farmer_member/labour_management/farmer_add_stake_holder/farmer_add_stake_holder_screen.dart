import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_stake_holder/job_description/farmer_stake_holder_select_job_description.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_stake_holder/widgets/farmer_select_gender_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_stake_holder/widgets/farmer_stake_holder_upload_avatar.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FarmerAddStakeHolderScreen extends StatefulWidget {
  const FarmerAddStakeHolderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FarmerAddStakeHolderScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FarmerAddStakeHolderScreen(),
      ),
    );
  }
}

class _FarmerAddStakeHolderScreenState extends State<FarmerAddStakeHolderScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late FarmerStakeHolder stakeHolder;

  @override
  void initState() {
    super.initState();
    stakeHolder = FarmerStakeHolder();
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
        // final annualProduction = AnnualProduction(
        //   year: int.tryParse(value['Year'].toString()),
        //   annualProductionId: DateTime.now().millisecondsSinceEpoch,
        //   createDT: DateTime.now().millisecondsSinceEpoch.toString(),
        //   workers: int.tryParse(value['Workers'].toString()),
        //   workPeriodMonths: double.tryParse(value['WorkPeriodMonths'].toString()),
        //   workPeriodWeeks: int.tryParse(value['WorkPeriodWeeks'].toString()),
        //   productionPerTeam: int.tryParse(value['ProductionPerTeam'].toString()),
        //   productionPerWorker: int.tryParse(value['ProductionPerWorker'].toString()),
        //   conversionWoodToCharcoal: double.tryParse(value['ConversionWoodToCharcoal'].toString()),
        // );

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          // await (await databaseService.db).writeTxn(() async {
          //   resultId = await databaseService.cacheAnnualProduction(annualProduction);
          // });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg: '${LocaleKeys.createNewStakeholder.tr()} $resultId',
            );

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
                  stakeHolder = stakeHolder.copyWith(
                    avatarFilePath: photoPath,
                    avatarFileName: DateTime.now().toString(),
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
                    stakeHolder = stakeHolder.copyWith(firstName: value);
                  },
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.lastName.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    stakeHolder = stakeHolder.copyWith(lastName: value);
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
                          stakeHolder = stakeHolder.copyWith(phoneNumber: value);
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
                    stakeHolder = stakeHolder.copyWith(phoneNumber: value);
                  },
                ),
              ),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.nationality.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    stakeHolder = stakeHolder.copyWith(nationality: value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: FarmerSelectGenderWidget(
                  onTap: (id) {},
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
        FarmerStakeHolderSelectJobDescription.push(context, stakeHolder.jobDescription, (listJobsDesc) {
          stakeHolder = stakeHolder.copyWith(jobDescription: listJobsDesc);
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
                stakeHolder.jobDescription?.length.toString() ?? '',
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
