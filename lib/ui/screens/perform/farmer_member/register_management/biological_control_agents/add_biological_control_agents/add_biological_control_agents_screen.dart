import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/biological_control_cubit/add_biological_control_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/biological_control_agents/add_biological_control_agents/widgets/select_control_agent_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/ui.dart';
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
                          biologicalControlAgentRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
                          isActive: true,
                          isMasterDataSynced: false,
                        ),
                    isAddNew: agent == null,
                  ),
              child: AddBiologicalControlAgentsScreen(biologicalControlAgent: agent),);
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
        appBar: CmoAppBar(
          title: widget.biologicalControlAgent == null
              ? LocaleKeys.addBCA.tr()
              : 'Edit BCA',
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SafeArea(
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
                          _buildSelectDateReleased(initState.agent.dateReleased),
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
                          SizedBox(
                            height: 250,
                            child: GeneralCommentWidget(
                              hintText: LocaleKeys.generalComments.tr(),
                              initialValue: initState.agent.comment,
                              onChanged: cubit.onCommentChanged,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
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
                .map((e) => CmoDropdownItem(id: e, name: e.stakeholderName ?? ''))
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

        return AttributeItem(
          child: CmoDropdown<MonitoringRequirement>(
            name: 'DescriptionMonitoringRequirementsId',
            hintText: LocaleKeys.descriptionOfMonitoringRequirements.tr(),
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
              isDense: true,
              labelText: LocaleKeys.descriptionOfMonitoringRequirements.tr(),
              labelStyle: context.textStyles.bodyBold.black,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: cubit.onMonitoringChanged,
            initialValue: initValue,
            itemsData: monitorings
                .map((e) => CmoDropdownItem(
                    id: e, name: e.monitoringRequirementName ?? ''))
                .toList(),
          ),
        );
      },
    );
  }
}
