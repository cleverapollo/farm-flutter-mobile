import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/input_formatter_extension.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/labour_management/labour_detail_cubit.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/labour_detail/job_description/farmer_add_worker_select_job_description.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/labour_detail/widgets/farmer_add_worker_upload_avatar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/labour_detail/widgets/farmer_select_gender_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabourDetailScreen extends BaseStatefulWidget {
  LabourDetailScreen({
    super.key,
    this.isEditing = false,
  }) : super(
          screenName: isEditing
              ? LocaleKeys.labour_detail.tr()
              : LocaleKeys.addLabour.tr(),
        );

  final bool isEditing;

  @override
  State<StatefulWidget> createState() => _LabourDetailScreenState();

  static Future<dynamic> push(
    BuildContext context, {
    FarmerWorker? farmerWorker,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => LabourDetailCubit(farmerWorker),
          child: LabourDetailScreen(
            isEditing: farmerWorker != null,
          ),
        ),
      ),
    );
  }
}

class _LabourDetailScreenState extends BaseStatefulWidgetState<LabourDetailScreen> {

  late LabourDetailCubit cubit;

  bool loading = false;

  Future<void> onSave() async {
    await cubit.onSave(
      onSuccess: (resultId) async {
        if (context.mounted) {
          showSnackSuccess(
            msg:
                '${widget.isEditing ? LocaleKeys.labour_detail.tr() : LocaleKeys.addLabour.tr()} $resultId',
          );

          Navigator.of(context).pop();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<LabourDetailCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CmoAppBar(
          title: widget.isEditing
              ? LocaleKeys.labour_detail.tr()
              : LocaleKeys.addLabour.tr(),
          subtitle: context.read<LabourDetailCubit>().state.activeFarm?.farmName,
          subtitleTextStyle: context.textStyles.bodyBold.blue,
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<LabourDetailCubit, LabourDetailState>(
                      builder: (context, state) {
                        return FarmerStakeHolderUploadAvatar(
                          photoUrl: state.farmerWorker.photo,
                          onSelectAvatar: cubit.onSelectAvatar,
                        );
                      },
                    ),
                    CmoHeaderTile(title: LocaleKeys.details.tr()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          firstNameWidget(),
                          lastNameWidget(),
                          secondFirstNameWidget(),
                          secondLastNameWidget(),
                          selectBirth(),
                          selectJobDescription(),
                          idNumberWidget(),
                          driverLicenseNumberWidget(),
                          phoneNumberWidget(),
                          foreignerWidget(),
                          selectGenderWidget(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<LabourDetailCubit, LabourDetailState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                    top: 12,
                  ),
                  child: CmoFilledButton(
                    title: LocaleKeys.save.tr(),
                    onTap: onSave,
                    loading: loading,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget firstNameWidget() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return AttributeItem(
          isShowError: state.isFirstNameError,
          isUnderErrorBorder: true,
          child: InputAttributeItem(
            labelText: LocaleKeys.firstName.tr(),
            labelTextStyle: context.textStyles.bodyBold.blueDark2,
            textStyle: context.textStyles.bodyNormal.blueDark2,
            initialValue: state.farmerWorker.firstName,
            onChanged: cubit.onChangeFirstName,
          ),
        );
      },
    );
  }

  Widget secondFirstNameWidget() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return AttributeItem(
          isShowError: state.isFirstNameError,
          isUnderErrorBorder: true,
          child: InputAttributeItem(
            labelText: LocaleKeys.second_first_name.tr(),
            labelTextStyle: context.textStyles.bodyBold.blueDark2,
            textStyle: context.textStyles.bodyNormal.blueDark2,
            initialValue: state.farmerWorker.secondFirstName,
            onChanged: cubit.onChangeSecondFirstName,
          ),
        );
      },
    );
  }

  Widget lastNameWidget() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return AttributeItem(
          isShowError: state.isLastNameNameError,
          isUnderErrorBorder: true,
          child: InputAttributeItem(
            labelText: LocaleKeys.lastName.tr(),
            labelTextStyle: context.textStyles.bodyBold.blueDark2,
            textStyle: context.textStyles.bodyNormal.blueDark2,
            initialValue: state.farmerWorker.surname,
            onChanged: cubit.onChangeSurname,
          ),
        );
      },
    );
  }

  Widget secondLastNameWidget() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return AttributeItem(
          isShowError: state.isLastNameNameError,
          isUnderErrorBorder: true,
          child: InputAttributeItem(
            labelText: LocaleKeys.second_last_name.tr(),
            labelTextStyle: context.textStyles.bodyBold.blueDark2,
            textStyle: context.textStyles.bodyNormal.blueDark2,
            initialValue: state.farmerWorker.secondSurname,
            onChanged: cubit.onChangeSecondSurname,
          ),
        );
      },
    );
  }


  Widget driverLicenseNumberWidget() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return AttributeItem(
          child: InputAttributeItem(
            keyboardType: TextInputType.number,
            initialValue: state.farmerWorker.driverLicenseNumber,
            labelText: LocaleKeys.drive_license_number.tr(),
            labelTextStyle: context.textStyles.bodyBold.blueDark2,
            textStyle: context.textStyles.bodyNormal.blueDark2,
            onChanged: cubit.onChangeDriveLicenseNumber,
          ),
        );
      },
    );
  }

  Widget idNumberWidget() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return AttributeItem(
          isShowError: state.isIdNumberError,
          isUnderErrorBorder: true,
          child: InputAttributeItem(
            keyboardType: TextInputType.name,
            inputFormatters: [UpperCaseTextFormatter()],
            labelText: LocaleKeys.idNumber.tr(),
            labelTextStyle: context.textStyles.bodyBold.blueDark2,
            textStyle: context.textStyles.bodyNormal.blueDark2,
            initialValue: state.farmerWorker.idNumber,
            onChanged: cubit.onChangeIdNumber,
          ),
        );
      },
    );
  }

  Widget phoneNumberWidget() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return AttributeItem(
          isShowError: state.isPhoneNumberError,
          isUnderErrorBorder: true,
          child: InputAttributeItem(
            keyboardType: TextInputType.number,
            initialValue: state.farmerWorker.phoneNumber,
            labelText: LocaleKeys.phoneNumber.tr(),
            labelTextStyle: context.textStyles.bodyBold.blueDark2,
            textStyle: context.textStyles.bodyNormal.blueDark2,
            onChanged: cubit.onChangePhoneNumber,
          ),
        );
      },
    );
  }

  Widget selectGenderWidget() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return FarmerSelectGenderWidget(
          initialValue: state.farmerWorker.genderId,
          onTap: cubit.onSelectGender,
        );
      },
    );
  }

  Widget selectBirth() {
    return AttributeItem(
      child: BlocBuilder<LabourDetailCubit, LabourDetailState>(
        builder: (context, state) {
          return DatePickerWidget(
            lastDate: DateTime.now(),
            firstDate: DateTime.now().add(const Duration(days: -50000)),
            initialDate: state.farmerWorker.dateOfBirth,
            onConfirm: cubit.onChangeDateOfBirth,
            child: SelectorAttributeItem(
              hintText: '',
              text: state.farmerWorker.dateOfBirth == null
                  ? LocaleKeys.yyyy_mm_dd.tr()
                  : convertDateTimeToLunar(state.farmerWorker.dateOfBirth).yMd(),
              labelText: LocaleKeys.date_of_birth.tr(),
              labelStyle: context.textStyles.bodyBold.blueDark2,
              textStyle: state.farmerWorker.dateOfBirth == null
                  ? context.textStyles.bodyNormal.grey
                  : context.textStyles.bodyNormal.blueDark2,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              trailing: Assets.icons.icCalendar.svgBlack,
            ),
          );
        },
      ),
    );
  }

  Widget foreignerWidget() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            AttributeItem(
              child: YesNoQuestion(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                title: LocaleKeys.foreigner.tr(),
                value: state.farmerWorker.isForeigner,
                onChangeValue: cubit.onSelectForeigner,
              ),
            ),
            if (state.farmerWorker.isForeigner != null &&
                state.farmerWorker.isForeigner!)
              AttributeItem(
                isShowError: state.isWorkPermitNumberError,
                isUnderErrorBorder: true,
                child: InputAttributeItem(
                  keyboardType: TextInputType.number,
                  initialValue: state.farmerWorker.workPermitNumber,
                  labelText: LocaleKeys.work_permit_number.tr(),
                  labelTextStyle: context.textStyles.bodyBold.blueDark2,
                  textStyle: context.textStyles.bodyNormal.blueDark2,
                  onChanged: cubit.onChangeWorkPermitNumber,
                ),
              ),
          ],
        );
      },
    );
  }

  Widget selectJobDescription() {
    return BlocBuilder<LabourDetailCubit, LabourDetailState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            FarmerStakeHolderSelectJobDescription.push(
              context: context,
              selectedJobDesc: cubit.getListSelectedJobDescriptions(),
              listJobDescriptions: state.listJobDescriptions,
              onSave: cubit.onSelectJobDescription,
              workerName: state.farmerWorker.fullName,
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
                      LocaleKeys.job_description.tr(),
                      style: context.textStyles.bodyBold.black,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    state.selectedWorkerJobDescriptions.length.toString(),
                    style: context.textStyles.bodyBold.black,
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
