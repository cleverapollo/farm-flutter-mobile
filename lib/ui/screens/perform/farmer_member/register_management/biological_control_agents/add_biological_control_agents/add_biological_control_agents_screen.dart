import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/biological_control_cubit/add_biological_control_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/biological_control_agents/add_biological_control_agents/widgets/select_control_agent_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/cmo_text_field_widget.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
                    biologicalControlAgentRegisterNo:
                        DateTime.now().millisecondsSinceEpoch.toString(),
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

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool carRaised = false;
  bool carClosed = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddBiologicalControlCubit>();
    final agent = cubit.state.agent;
    carRaised = agent.carRaisedDate != null;
    carClosed = agent.carClosedDate != null;
  }

  Future<void> onSubmit() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });
    final notValidate =
        cubit.state.agent.biologicalControlAgentTypeName == null ||
            cubit.state.agent.monitoringRequirementId == null ||
            cubit.state.agent.dateReleased == null;

    if (notValidate) {
      return showSnackError(msg: 'Required fields are missing');
    }

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;
      if (value == null) return;
      value = {...value};

      setState(() {
        loading = true;
      });
      try {
        await hideInputMethod();
        final farm = await configService.getActiveFarm();
        var agent = cubit.state.agent;

        agent = agent.copyWith(
          farmId: farm?.farmId,
          isActive: true,
          isMasterDataSynced: false,
        );

        if (carRaised && agent.carRaisedDate == null) {
          agent = agent.copyWith(
            carRaisedDate: DateTime.now().toIso8601String(),
          );
        }

        if (carClosed && agent.carClosedDate == null) {
          agent = agent.copyWith(
            carClosedDate: DateTime.now().toIso8601String(),
          );
        }

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId =
                await databaseService.cacheBiologicalControlAgents(agent);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${widget.biologicalControlAgent == null ? LocaleKeys.addBCA.tr() : 'Edit BCA'} $resultId',
            );

            Navigator.of(context).pop(agent);
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
        appBar: CmoFarmAppBar.showTrailingAndFarmName(
          title: widget.biologicalControlAgent == null
              ? LocaleKeys.addBCA.tr()
              : 'Edit BCA',
        ),
        body: Stack(
          children: [
            SafeArea(
              child: BlocSelector<AddBiologicalControlCubit,
                  AddBiologicalControlState, bool>(
                selector: (state) => state.isDataReady,
                builder: (context, isDataReady) {
                  if (!isDataReady) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final initState = cubit.state;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: FormBuilder(
                      key: _formKey,
                      onChanged: () {},
                      autovalidateMode: autoValidateMode,
                      child: AutofillGroup(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectControlAgentWidget(
                                agentTypes: initState.agentTypes,
                                onSelect: cubit.onSelectControlAgent,
                                initAgent: initState.agent,
                              ),
                              _buildSelectDateReleased(
                                  initState.agent.dateReleased),
                              _buildSelectStakeHolderWidget(),
                              _buildSelectDescriptionWidget(),
                              AttributeItem(
                                child: SelectItemWidget(
                                  initValue: carRaised,
                                  title: LocaleKeys.carRaised.tr(),
                                  onSelect: (isSelected) {
                                    carRaised = isSelected;
                                  },
                                ),
                              ),
                              AttributeItem(
                                child: SelectItemWidget(
                                  initValue: carClosed,
                                  title: LocaleKeys.carClosed.tr(),
                                  onSelect: (isSelected) {
                                    carClosed = isSelected;
                                  },
                                ),
                              ),
                              const SizedBox(height: 12),
                              CmoTextFieldV2(
                                maxLines: 10,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                labelText: LocaleKeys.generalComments.tr(),
                                initialValue:
                                    initState.agent.comment ?? '\n\n\n\n',
                                onChanged: cubit.onCommentChanged,
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 0,
              right: 0,
              child: Center(
                child: CmoFilledButton(
                  title: LocaleKeys.save.tr(),
                  onTap: onSubmit,
                  loading: loading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectDateReleased(DateTime? dateReleased) {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateReleased',
        onChanged: cubit.onDateReleasedChanged,
        hintText: LocaleKeys.dateReleased.tr(),
        initialValue: dateReleased,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateReleased.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateReleased.tr(),
          labelStyle: context.textStyles.bodyBold.black,
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
        final findIndex = stateHolders
            .indexWhere((element) => element.stakeHolderId == stakeHolderId);
        final initValue = findIndex != -1 ? stateHolders[findIndex] : null;
        return AttributeItem(
          child: CmoDropdown<StakeHolder>(
            shouldBorderItem: true,
            name: 'StakeHolderId',
            hintText: LocaleKeys.stakeholderName.tr(),
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
              isDense: true,
              labelText: LocaleKeys.stakeholderName.tr(),
              labelStyle: context.textStyles.bodyBold.black,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: cubit.onStakeHolderChanged,
            initialValue: initValue,
            itemsData: stateHolders
                .map((e) =>
                    CmoDropdownItem(id: e, name: e.stakeholderName ?? ''))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildSelectDescriptionWidget() {
    return BlocSelector<AddBiologicalControlCubit, AddBiologicalControlState,
        List<MonitoringRequirement>>(
      selector: (state) => state.monitorings,
      builder: (context, monitorings) {
        final monitoringRequirementId =
            cubit.state.agent.monitoringRequirementId;
        final findIndex = monitorings.indexWhere((element) =>
            element.monitoringRequirementId == monitoringRequirementId);
        final initValue = findIndex != -1 ? monitorings[findIndex] : null;
        return BottomSheetSelection(
          hintText: LocaleKeys.descriptionOfMonitoringRequirements.tr(),
          value: initValue?.monitoringRequirementName,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (monitorings.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: monitorings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      cubit.onMonitoringChanged.call(monitorings[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        monitorings[index].monitoringRequirementName ?? '',
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
