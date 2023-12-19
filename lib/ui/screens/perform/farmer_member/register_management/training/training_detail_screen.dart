import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/training_cubit/training_detail_cubit.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/components/signature_widget.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/information_text_widget.dart';

class TrainingDetailScreen extends BaseStatefulWidget {
  TrainingDetailScreen({
    super.key,
    required this.isAddNew,
  }) : super(
          screenName: isAddNew
              ? LocaleKeys.add_training.tr()
              : LocaleKeys.training_detail.tr(),
        );

  final bool isAddNew;

  static Future<TrainingRegister?> push(
    BuildContext context, {
    required Farm farm,
    TrainingRegister? training,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => TrainingDetailCubit(
              farm: farm,
              training: training ??
                  TrainingRegister(
                      trainingRegisterNo:
                          DateTime.now().millisecondsSinceEpoch.toString(),
                      date: DateTime.now(),
                      isActive: true,
                      isMasterdataSynced: false,
                      createDT: DateTime.now(),
                      updateDT: DateTime.now(),
                      farmId: farm.farmId),
              isAddNew: training == null,
            ),
            child: TrainingDetailScreen(isAddNew: training == null,),
          );
        },
      ),
    );
  }

  @override
  State<TrainingDetailScreen> createState() => _TrainingDetailScreenState();
}

class _TrainingDetailScreenState extends BaseStatefulWidgetState<TrainingDetailScreen> {
  late final TrainingDetailCubit cubit;

  bool loading = false;

  Future<void> onSubmit() async {
    setState(() {
      loading = true;
    });
    try {
      await hideInputMethod();
      await cubit.onSave(onSuccess: (resultId) {
        showSnackSuccess(
          msg:
          '${cubit.state.isAddNew ? LocaleKeys.add_training.tr() : LocaleKeys.training_detail.tr()} $resultId',
        );
        Navigator.of(context).pop(cubit.state.training);
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<TrainingDetailCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final initState = cubit.state;
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: initState.isAddNew
              ? LocaleKeys.add_training.tr()
              : LocaleKeys.training_detail.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: BlocSelector<TrainingDetailCubit, TrainingDetailState, bool>(
            selector: (state) => state.isDataReady,
            builder: (context, isDataReady) {
              if (!isDataReady) {
                return const SizedBox.shrink();
              }

              final state = cubit.state;
              final training = state.training;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18.0),
                          CmoHeaderTile(
                            title: LocaleKeys.details.tr(),
                            backgroundColor: context.colors.blueDark2,
                          ),
                          _selectTrainingType(),
                          _selectDate(),
                          BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
                            builder: (context, state) {
                              return AttributeItem(
                                isShowError: state.isTrainerNameError,
                                isUnderErrorBorder: true,
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                child: InputAttributeItem(
                                  validator: (_) => null,
                                  initialValue: training.trainerName,
                                  textStyle: context.textStyles.bodyNormal.blueDark3,
                                  labelText: LocaleKeys.trainer_name.tr(),
                                  labelTextStyle: context.textStyles.bodyBold.blueDark3,
                                  onChanged: cubit.onTrainerChanged,
                                ),
                              );
                            },
                          ),
                          _selectTraineeName(),
                          InformationText(),
                          CmoHeaderTile(
                            title: LocaleKeys.additional_details_optional.tr(),
                            backgroundColor: context.colors.blueDark2,
                          ),
                          _buildSelectExpiryDate(training.expiryDate),
                          AttributeItem(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              height: 120,
                              child: GeneralCommentWidget(
                                initialValue: training.comment,
                                maxLines: 5,
                                hintText: LocaleKeys.generalComments.tr(),
                                hintTextStyle: context.textStyles.bodyBold.blueDark3,
                                textStyle: context.textStyles.bodyNormal.blueDark3,
                                onChanged: cubit.onCommentChanged,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SignatureWidget(
                            signatureImage: training.signatureImage,
                            onClearSignature: cubit.onClearSignature,
                            onDrawEnd: cubit.onSign,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CmoFilledButton(
                    title: LocaleKeys.save.tr(),
                    onTap: onSubmit,
                    loading: loading,
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom),
                ],
              );
            },
          ),
      ),
    );
  }

  Widget _selectTrainingType() {
    return BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
      builder: (context, state) {
        final initType = state.trainingTypes.firstWhereOrNull((e) => e.trainingTypeId == state.training.trainingTypeId);
        return BottomSheetSelection(
          isShowError: state.isTrainingTypeError,
          hintText: LocaleKeys.training_type.tr(),
          hintTextStyle: context.textStyles.bodyBold.blueDark3,
          displayHorizontal: false,
          value: initType?.trainingTypeName,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.trainingTypes.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.trainingTypes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      cubit.onTrainingTypeChanged(state.trainingTypes[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.trainingTypes[index].trainingTypeName ?? '',
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark3,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _selectDate() {
    return BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
      builder: (context, state) {
        return AttributeItem(
          isShowError: state.isDateError,
          errorText: LocaleKeys.required.tr(),
          isUnderErrorBorder: true,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: DatePickerWidget(
            lastDate: DateTime.now().add(const Duration(days: 100000)),
            initialDate: state.training.date,
            title: LocaleKeys.date.tr(),
            firstDate: DateTime.now().subtract(const Duration(days: 100000)),
            onChangeDate: cubit.onDateIssuedChanged,
          ),
        );
      },
    );
  }

  Widget _selectTraineeName() {
    return BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
      builder: (context, state) {
        final initWorker = state.workers.firstWhereOrNull((element) => element.workerId == state.training.workerId);
        return BottomSheetSelection(
          isShowError: state.isTraineeNameError,
          hintText: LocaleKeys.trainee_name.tr(),
          hintTextStyle: context.textStyles.bodyBold.blueDark3,
          displayHorizontal: false,
          value: initWorker?.fullName,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.workers.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.workers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      cubit.onWorkerChanged(state.workers[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.workers[index].fullName ?? '',
                        style: context.textStyles.bodyBold
                            .copyWith(
                          color: context.colors.blueDark3,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSelectExpiryDate(DateTime? dateTime) {
    return BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
      builder: (context, state) {
        return AttributeItem(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: CmoDatePicker(
            name: LocaleKeys.expiry_date.tr(),
            initialValue: dateTime,
            onChanged: cubit.onExpiryDateChanged,
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
              suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
              isDense: true,
              hintStyle: context.textStyles.bodyBold.blueDark3,
              labelText: LocaleKeys.expiry_date.tr(),
              labelStyle: context.textStyles.bodyBold.blueDark3,
            ),
          ),
        );
      },
    );
  }
}
