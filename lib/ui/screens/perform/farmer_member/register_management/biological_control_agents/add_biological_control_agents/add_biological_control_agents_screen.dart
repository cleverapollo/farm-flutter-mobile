import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/biological_control_cubit/add_biological_control_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/biological_control_agents/add_biological_control_agents/widgets/select_control_agent_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBiologicalControlAgentsScreen extends StatefulWidget {
  const AddBiologicalControlAgentsScreen(
      {super.key, this.biologicalControlAgent});

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

class _AddBiologicalControlAgentsScreenState
    extends State<AddBiologicalControlAgentsScreen> {
  late AddBiologicalControlCubit cubit;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddBiologicalControlCubit>();
  }

  Future<void> onSubmit() async {
    final notValidate = cubit.state.agent.biologicalControlAgentTypeName == null;

    if (notValidate) {
      return showSnackError(msg: 'Name of Control Agent Required!');
    }
    setState(() {
      loading = true;
    });
    await hideInputMethod();
    await cubit.onSave();
    if (context.mounted) {
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
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoFarmAppBar.showTrailingAndFarmName(
          title: widget.biologicalControlAgent == null
              ? LocaleKeys.addBCA.tr()
              : LocaleKeys.edit_bca.tr(),
        ),
        body: BlocSelector<AddBiologicalControlCubit, AddBiologicalControlState,
            bool>(
          selector: (state) => state.isDataReady,
          builder: (context, isDataReady) {
            if (!isDataReady) {
              return const Center(child: CircularProgressIndicator());
            }
            final initState = cubit.state;
            return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectControlAgentWidget(
                      agentTypes: initState.agentTypes,
                      onSelect: cubit.onSelectControlAgent,
                      initAgent: initState.agent,
                    ),
                    _buildSelectDateReleased(initState.agent.dateReleased),
                    _buildSelectStakeHolderWidget(),
                    _buildSelectDescriptionWidget(),
                    // const SizedBox(height: 12),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    //   child: GeneralCommentWidget(
                    //     hintText: '',
                    //     shouldShowTitle: true,
                    //     height: 120,
                    //     initialValue: initState.agent.comment,
                    //     textStyle: context.textStyles.bodyNormal.black,
                    //     onChanged: cubit.onCommentChanged,
                    //   ),
                    // ),
                    const SizedBox(height: 60),
                  ],
                ),
            );
          },
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          CmoFilledButton(
            title: LocaleKeys.save.tr(),
            onTap: onSubmit,
            loading: loading,
          )
        ],
      ),
    );
  }

  Widget _buildSelectDateReleased(DateTime? dateReleased) {
    return AttributeItem(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: CmoDatePicker(
        name: 'DateReleased',
        onChanged: cubit.onDateReleasedChanged,
        initialValue: dateReleased,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          labelText: LocaleKeys.dateReleased.tr(),
          labelStyle: context.textStyles.bodyBold.blueDark3,
        ),
      ),
    );
  }

  Widget _buildSelectStakeHolderWidget() {
    return BlocSelector<AddBiologicalControlCubit, AddBiologicalControlState,
        List<StakeHolder>>(
      selector: (state) => state.stakeHolders,
      builder: (context, stateHolders) {
        final stakeHolderId = cubit.state.agent.stakeholderId;
        final findIndex = stateHolders.indexWhere((element) => element.stakeHolderId == stakeHolderId);
        final initValue = findIndex != -1 ? stateHolders[findIndex] : null;
        return BottomSheetSelection(
          hintText: LocaleKeys.stakeholderName.tr(),
          hintTextStyle: context.textStyles.bodyBold.blueDark3,
          value: initValue?.stakeholderName,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          displayHorizontal: false,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (stateHolders.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: stateHolders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      cubit.onStakeHolderChanged(stateHolders[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        stateHolders[index].stakeholderName ?? '',
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
            FocusScope.of(context).unfocus();
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
