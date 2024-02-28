import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/training_cubit/training_detail_cubit.dart';
import 'package:cmo/ui/components/bottom_sheet_multiple_selection.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/components/signature_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/training/widgets/trainee_widget.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:cmo/utils/utils.dart';
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
                          _buildSelectExpiryDate(),
                          AttributeItem(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              height: 120,
                              child: GeneralCommentWidget(
                                initialValue: training.comment,
                                maxLines: 5,
                                hintText: LocaleKeys.general_comments.tr(),
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
            lastDate: DateTime.now().add(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
            initialDate: state.training.date,
            title: LocaleKeys.date.tr(),
            firstDate: DateTime.now().subtract(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
            onConfirm: cubit.onDateIssuedChanged,
          ),
        );
      },
    );
  }

  Widget _selectTraineeName() {
    return BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            BottomSheetSelection(
              isShowError: state.isTraineeNameError,
              hintText: LocaleKeys.add_trainee.tr(),
              hintTextStyle: context.textStyles.bodyBold.blueDark3,
              value: state.selectedTrainees.length.toString(),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
              rightIconData: Assets.icons.icUpdatedAddButton.svgBlack,
              onTap: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                if (state.workers.isBlank) return;
                await showCustomBottomSheet<void>(
                  context,
                  content: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.icTrainees.svg(
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              LocaleKeys.trainees.tr(),
                              style: context.textStyles.bodyBold.blueDark2.copyWith(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: BottomSheetMultipleSelection<FarmerWorker>(
                            listItems: state.workers
                                .map(
                                  (e) => BottomSheetMultipleSelectionItem(
                                    item: e,
                                    id: e.workerId,
                                    titleValue: e.fullName,
                                  ),
                                )
                                .toList(),
                            selectedItems: state.selectedTrainees
                                .map(
                                  (e) => BottomSheetMultipleSelectionItem(
                                    item: e,
                                    id: e.workerId,
                                    titleValue: e.fullName,
                                  ),
                                )
                                .toList(),
                            onSave: cubit.onSelectTrainee,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            TraineeWidget(
              selectedTrainees: state.selectedTrainees,
              onRemove: cubit.onRemoveTrainee,
            ),
          ],
        );
      },
    );
  }

  Widget _buildSelectExpiryDate() {
    return BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
      builder: (context, state) {
        return AttributeItem(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: DatePickerWidget(
            lastDate: DateTime.now().add(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
            initialDate: state.training.expiryDate,
            title: LocaleKeys.expiry_date.tr(),
            firstDate: DateTime.now().subtract(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
            onConfirm: cubit.onExpiryDateChanged,
          ),
        );
      },
    );
  }
}
