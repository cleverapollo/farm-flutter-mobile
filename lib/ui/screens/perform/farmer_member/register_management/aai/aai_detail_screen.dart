import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_aai_cubit/aai_detail_cubit.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/information_text_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'select_property_damaged_screen.dart';

class AAIDetailScreen extends BaseStatefulWidget {
  AAIDetailScreen({
    required this.isAddNew,
    super.key,
  }) : super(
          screenName:
              isAddNew ? LocaleKeys.add_aai.tr() : LocaleKeys.aai_detail.tr(),
        );

  final bool isAddNew;

  static Future<AccidentAndIncident?> push(BuildContext context,
      {AccidentAndIncident? aai}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AAIDetailCubit(
              accidentAndIncident: aai ??
                  AccidentAndIncident(
                    accidentAndIncidentRegisterNo:
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    isActive: true,
                    isMasterDataSynced: false,
                    createDT: DateTime.now(),
                    updateDT: DateTime.now(),
                  ),
              isAddNew: aai == null,
            ),
            child: AAIDetailScreen(
              isAddNew: aai == null,
            ),
          );
        },
      ),
    );
  }

  @override
  State<AAIDetailScreen> createState() => _AddingAAIScreenState();
}

class _AddingAAIScreenState extends BaseStatefulWidgetState<AAIDetailScreen> {
  late final AAIDetailCubit cubit;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AAIDetailCubit>();
  }

  Future<void> onSubmit(BuildContext context) async {
    setState(() {
      loading = true;
    });
    try {
      await hideInputMethod();
      await cubit.onSave(
        onSuccess: (resultId) {
          if (context.mounted) {
            final isAddNew = cubit.state.isAddNew;
            showSnackSuccess(
              msg:
                  '${isAddNew ? LocaleKeys.add_aai.tr() : 'Edit AAI'} $resultId',
            );

            Navigator.of(context).pop(cubit.state.accidentAndIncident);
          }
        },
      );
    } catch (e) {
      setState(() {
        loading = false;
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final initState = cubit.state;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: initState.isAddNew
              ? LocaleKeys.add_aai.tr()
              : LocaleKeys.aai_detail.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: BlocSelector<AAIDetailCubit, AAIDetailState, bool>(
          selector: (state) => state.isDataReady,
          builder: (context, isDataReady) {
            if (!isDataReady) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        CmoHeaderTile(
                          title: LocaleKeys.accident_and_incident_details.tr(),
                          backgroundColor: context.colors.blueDark2,
                        ),
                        _buildSelectWorkerWidget(),
                        _buildSelectDateIncident(),
                        _buildSelectDateReceived(),
                        InformationText(),
                        CmoHeaderTile(
                          title: LocaleKeys.additional_details_optional.tr(),
                          backgroundColor: context.colors.blueDark2,
                        ),
                        const SizedBox(height: 4),
                        _selectJobDescription(),
                        const SizedBox(height: 4),
                        _selectNatureOfInjury(),
                        const SizedBox(height: 4),
                        _buildSelectDateResumeWork(),
                        const SizedBox(height: 8),
                        _buildLostTimeInDay(),
                        const SizedBox(height: 8),
                        BlocBuilder<AAIDetailCubit, AAIDetailState>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () async {
                                final result = await SelectPropertyDamagedScreen.push(
                                  context,
                                  state.propertyDamaged,
                                  state.selectedPropertyDamages,
                                );

                                if (result != null) {
                                  cubit.onSelectPropertyDamaged(result as List<PropertyDamaged>);
                                }
                              },
                              child: AttributeItem(
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        LocaleKeys.select_property_damaged.tr(),
                                        style: context.textStyles.bodyNormal.blueDark2,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),

                                    Text(
                                      state.selectedPropertyDamages.length.toString(),
                                      style: context.textStyles.bodyNormal.blueDark2,
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(width: 12),
                                    Assets.icons.icUpdatedAddButton.svgBlack,
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        BlocBuilder<AAIDetailCubit, AAIDetailState>(
                          builder: (context, state) {
                            return AttributeItem(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              child: SelectItemWidget(
                                initValue: state.accidentAndIncident.workerDisabled ?? false,
                                title: LocaleKeys.worker_disabled.tr(),
                                onSelect: (value) {
                                  cubit.onWorkDisableChanged(workerDisabled: value);
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        BlocBuilder<AAIDetailCubit, AAIDetailState>(
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: GeneralCommentWidget(
                                hintText: '',
                                shouldShowTitle: true,
                                titleTextStyle: context.textStyles.bodyNormal.blueDark2,
                                height: 120,
                                initialValue: state.accidentAndIncident.comment,
                                textStyle: context.textStyles.bodyNormal.blueDark2,
                                onChanged: cubit.onCommentChanged,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                  child: CmoFilledButton(
                    title: LocaleKeys.save.tr(),
                    onTap: () => onSubmit(context),
                    loading: loading,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSelectWorkerWidget() {
    return BlocBuilder<AAIDetailCubit, AAIDetailState>(
      builder: (context, state) {
        final initWorker = state.workers.firstWhereOrNull((e) => e.workerId == state.accidentAndIncident.workerId);
        return BottomSheetSelection(
          hintText: LocaleKeys.worker.tr(),
          isShowError: state.isWorkerError,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: initWorker?.fullName ?? state.workerSelect?.fullName,
          displayHorizontal: false,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.workers.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.workers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      await cubit.onWorkerSelected(state.workers[index]);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.workers[index].fullName,
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark2,
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

  Widget _buildSelectDateIncident() {
    return BlocBuilder<AAIDetailCubit, AAIDetailState>(
      builder: (context, state) {
        return AttributeItem(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          isUnderErrorBorder: true,
          isShowError: state.isDateIncidentError,
          child: DatePickerWidget(
            lastDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 1000)),
            initialDate: state.accidentAndIncident.dateOfIncident ?? DateTime.now(),
            onConfirm: cubit.onDateOfIncidentChanged,
            child: SelectorAttributeItem(
              labelText: LocaleKeys.date_of_incident.tr(),
              labelStyle: context.textStyles.bodyBold.blueDark2,
              text: state.accidentAndIncident.dateOfIncident == null
                  ? ''
                  : convertDateTimeToLunar(state.accidentAndIncident.dateOfIncident).yMd(),
              textStyle: context.textStyles.bodyNormal.blueDark2,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              trailing: Assets.icons.icCalendar.svgBlack,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectDateReceived() {
    return BlocBuilder<AAIDetailCubit, AAIDetailState>(
      builder: (context, state) {
        return AttributeItem(
          isShowError: state.isDateReportedError,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          isUnderErrorBorder: true,
          child: DatePickerWidget(
            lastDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 1000)),
            initialDate:
                state.accidentAndIncident.dateRecieved ?? DateTime.now(),
            onConfirm: cubit.onDateReceiveChanged,
            child: SelectorAttributeItem(
              labelText: LocaleKeys.date_reported.tr(),
              labelStyle: context.textStyles.bodyBold.blueDark2,
              text: state.accidentAndIncident.dateRecieved == null
                  ? ''
                  : convertDateTimeToLunar(state.accidentAndIncident.dateRecieved).yMd(),
              textStyle: context.textStyles.bodyNormal.blueDark2,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              trailing: Assets.icons.icCalendar.svgBlack,
            ),
          ),
        );
      },
    );
  }

  Widget _selectJobDescription() {
    return BlocBuilder<AAIDetailCubit, AAIDetailState>(
      buildWhen: (previous, current) =>
          previous.jobDescriptionSelect != current.jobDescriptionSelect ||
          previous.jobDescriptions != current.jobDescriptions,
      builder: (context, state) {
        final jobId = cubit.state.accidentAndIncident.jobDescriptionId;
        final initJob = state.jobDescriptions
            .firstWhereOrNull((element) => element.jobDescriptionId == jobId);
        return BottomSheetSelection(
          hintText: LocaleKeys.jobDescription.tr(),
          hintTextStyle: context.textStyles.bodyNormal.blueDark2,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          displayHorizontal: false,
          value: initJob?.jobDescriptionName ??
              state.jobDescriptionSelect?.jobDescriptionName,
          onTap: () async {
            if (state.accidentAndIncident.workerId == null) {
              return showSnackError(
                  msg: 'Add a worker first to make a selection');
            }

            FocusScope.of(context).unfocus();
            if (state.jobDescriptions.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.jobDescriptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      cubit.onJobDescriptionSelected(
                          state.jobDescriptions[index]);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.jobDescriptions[index].jobDescriptionName ?? '',
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark2,
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

  Widget _selectNatureOfInjury() {
    return BlocBuilder<AAIDetailCubit, AAIDetailState>(
      buildWhen: (previous, current) =>
          previous.natureOfInjurySelect != current.natureOfInjurySelect ||
          previous.natureOfInjuries != current.natureOfInjuries,
      builder: (context, state) {
        final initNatureOfInjury = state.natureOfInjuries.firstWhereOrNull(
            (element) => element.natureOfInjuryId == state.accidentAndIncident.natureOfInjuryId);

        return BottomSheetSelection(
          hintText: LocaleKeys.nature_of_injury.tr(),
          hintTextStyle: context.textStyles.bodyNormal.blueDark2,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          displayHorizontal: false,
          value: initNatureOfInjury?.natureOfInjuryName ??
              state.natureOfInjurySelect?.natureOfInjuryName,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.natureOfInjuries.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.natureOfInjuries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      cubit.onNatureOfInjurySelected(
                          state.natureOfInjuries[index]);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.natureOfInjuries[index].natureOfInjuryName ?? '',
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark2,
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

  Widget _buildSelectDateResumeWork() {
    return BlocBuilder<AAIDetailCubit, AAIDetailState>(
      builder: (context, state) {
        return AttributeItem(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: DatePickerWidget(
            lastDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 1000)),
            initialDate: state.accidentAndIncident.dateResumeWork ?? DateTime.now(),
            onConfirm: cubit.onDateResumeChanged,
            child: SelectorAttributeItem(
              labelText: LocaleKeys.resumed_work_on.tr(),
              labelStyle: context.textStyles.bodyNormal.blueDark2,
              text: state.accidentAndIncident.dateResumeWork == null
                  ? ''
                  : convertDateTimeToLunar(state.accidentAndIncident.dateResumeWork).yMd(),
              textStyle: context.textStyles.bodyNormal.blueDark2,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              trailing: Assets.icons.icCalendar.svgBlack,
            ),
          ),
        );
      },
    );
  }

  Widget _buildLostTimeInDay() {
    return BlocSelector<AAIDetailCubit, AAIDetailState, String>(
      selector: (state) => state.lostTimeInDay,
      builder: (context, lostTimeInDay) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          color: context.colors.greyD9D9,
          child: Row(
            children: [
              Expanded(
                child: SelectorAttributeItem(
                  text: LocaleKeys.lost_time_in_days.tr(),
                  textStyle: context.textStyles.bodyNormal.blueDark2,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  trailing: const SizedBox.shrink(),
                ),
              ),

              Text(
                lostTimeInDay,
                style: context.textStyles.bodyNormal.blueDark2,
              ),
            ],
          ),
        );
      },
    );
  }
}
