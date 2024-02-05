import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/biological_control_cubit/add_biological_control_cubit.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/biological_control_agents/add_biological_control_agents/widgets/select_control_agent_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBiologicalControlAgentsScreen extends BaseStatefulWidget {
  AddBiologicalControlAgentsScreen({
    super.key,
    this.biologicalControlAgent,
  }) : super(
          screenName: biologicalControlAgent == null
              ? LocaleKeys.addBCA.tr()
              : LocaleKeys.edit_bca.tr(),
        );

  final BiologicalControlAgent? biologicalControlAgent;

  @override
  State<StatefulWidget> createState() =>
      _AddBiologicalControlAgentsScreenState();

  static Future<BiologicalControlAgent?> push(BuildContext context,
      {BiologicalControlAgent? agent}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AddBiologicalControlCubit(
              agent: agent ??
                  BiologicalControlAgent(
                    biologicalControlAgentRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
                    carClosedDate: DateTime.now().toIso8601String(),
                    carRaisedDate: DateTime.now().toIso8601String(),
                    updateDT: DateTime.now(),
                    createDT: DateTime.now(),
                    isActive: true,
                  ),
              isAddNew: agent == null,
            ),
            child:
                AddBiologicalControlAgentsScreen(biologicalControlAgent: agent),
          );
        },
      ),
    );
  }
}

class _AddBiologicalControlAgentsScreenState extends BaseStatefulWidgetState<AddBiologicalControlAgentsScreen> {
  late AddBiologicalControlCubit cubit;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddBiologicalControlCubit>();
  }

  Future<void> onSubmit() async {
    setState(() {
      loading = true;
    });
    await hideInputMethod();
    final isSuccess = await cubit.onSave();
    if (context.mounted && isSuccess) {
      showSnackSuccess(
          msg:
              '${widget.biologicalControlAgent == null ? LocaleKeys.addBCA.tr() : LocaleKeys.edit_bca.tr()} ${cubit.state.agent.biologicalControlAgentRegisterId}');
      Navigator.of(context).pop(cubit.state.agent);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: widget.biologicalControlAgent == null
              ? LocaleKeys.addBCA.tr()
              : LocaleKeys.edit_bca.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: BlocSelector<AddBiologicalControlCubit, AddBiologicalControlState,
            bool>(
          selector: (state) => state.isDataReady,
          builder: (context, isDataReady) {
            if (!isDataReady) {
              return const Center(child: CircularProgressIndicator());
            }
            final initState = cubit.state;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        BlocBuilder<AddBiologicalControlCubit,
                            AddBiologicalControlState>(
                          builder: (context, state) {
                            return SelectControlAgentWidget(
                              agentTypes: initState.agentTypes,
                              onSelect: cubit.onSelectControlAgent,
                              initAgent: initState.agent,
                              isShowError: state.isSelectControlAgentError,
                            );
                          },
                        ),
                        _buildSelectDateReleased(initState.agent.dateReleased),
                        _buildSelectStakeHolderWidget(),
                        _buildSelectDescriptionWidget(),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: GeneralCommentWidget(
                            hintText: '',
                            shouldShowTitle: true,
                            titleTextStyle: context.textStyles.bodyBold.blueDark2,
                            height: 120,
                            initialValue: initState.agent.comment,
                            textStyle: context.textStyles.bodyNormal.blueDark2,
                            onChanged: cubit.onCommentChanged,
                          ),
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: CmoFilledButton(
                    title: LocaleKeys.save.tr(),
                    onTap: onSubmit,
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

  Widget _buildSelectDateReleased(DateTime? dateReleased) {
    return BlocBuilder<AddBiologicalControlCubit, AddBiologicalControlState>(
      builder: (context, state) {
        return AttributeItem(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: DatePickerWidget(
            lastDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 1000)),
            initialDate: dateReleased ?? DateTime.now(),
            onConfirm: cubit.onDateReleasedChanged,
            child: SelectorAttributeItem(
              labelText: LocaleKeys.dateReleased.tr(),
              labelStyle: context.textStyles.bodyBold.blueDark3,
              text: state.agent.dateReleased == null
                  ? ''
                  : convertDateTimeToLunar(state.agent.dateReleased).yMd(),
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

  Widget _buildSelectStakeHolderWidget() {
    return BlocBuilder<AddBiologicalControlCubit, AddBiologicalControlState>(
      builder: (context, state) {
        final stakeHolderId = state.agent.stakeholderId;
        final findIndex = state.stakeHolders.indexWhere((element) => element.stakeHolderId == stakeHolderId);
        final initValue = findIndex != -1 ? state.stakeHolders[findIndex] : null;
        return BottomSheetSelection(
          hintText: LocaleKeys.stakeholderName.tr(),
          hintTextStyle: context.textStyles.bodyBold.blueDark3,
          value: initValue?.stakeholderName,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          displayHorizontal: false,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.stakeHolders.isBlank) {
              showSnackError(msg: 'You do not have any data to select at this field');
              return;
            }

            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.stakeHolders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      cubit.onStakeHolderChanged(state.stakeHolders[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.stakeHolders[index].stakeholderName ?? '',
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

  Widget _buildSelectDescriptionWidget() {
    return BlocBuilder<AddBiologicalControlCubit, AddBiologicalControlState>(
      builder: (context, state) {
        final monitoringRequirementId =
            cubit.state.agent.monitoringRequirementId;
        final findIndex = state.monitorings.indexWhere((element) =>
            element.monitoringRequirementId == monitoringRequirementId);
        final initValue = findIndex != -1 ? state.monitorings[findIndex] : null;
        return BottomSheetSelection(
          hintText: LocaleKeys.description_of_monitoring.tr(),
          hintTextStyle: context.textStyles.bodyBold.blueDark3,
          value: initValue?.monitoringRequirementName,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          displayHorizontal: false,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.monitorings.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.monitorings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      cubit.onMonitoringChanged.call(state.monitorings[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.monitorings[index].monitoringRequirementName ??
                            '',
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
}
