import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/biological_control_agents/add_biological_control_agents/widgets/select_control_agent_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddBiologicalControlAgentsScreen extends StatefulWidget {
  const AddBiologicalControlAgentsScreen(
      {super.key, this.biologicalControlAgent});

  final BiologicalControlAgent? biologicalControlAgent;

  @override
  State<StatefulWidget> createState() =>
      _AddBiologicalControlAgentsScreenState();

  static Future<BiologicalControlAgent?> push(BuildContext context,
      {BiologicalControlAgent? biologicalControlAgent}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddBiologicalControlAgentsScreen(
            biologicalControlAgent: biologicalControlAgent),
      ),
    );
  }
}

class _AddBiologicalControlAgentsScreenState
    extends State<AddBiologicalControlAgentsScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late BiologicalControlAgent agent;

  bool carRaised = false;
  bool carClosed = false;

  @override
  void initState() {
    super.initState();
    if (widget.biologicalControlAgent == null) {
      agent = BiologicalControlAgent(
          biologicalControlAgentRegisterNo: DateTime.now().toIso8601String(),
          isActive: true,
          isMasterDataSynced: false);
    } else {
      agent = BiologicalControlAgent.fromJson(
          widget.biologicalControlAgent!.toJson());
    }
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
        agent = agent.copyWith(
          farmId: farm?.farmId,
          dateReleased: value['DateReleased'] as DateTime?,
          stakeholderId: value['StakeholderId']?.toString(),
          monitoringRequirementId: int.tryParse(
              value['DescriptionMonitoringRequirementsId']?.toString() ?? ''),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
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
              SelectControlAgentWidget(
                onSelect: (controlAgent) {
                  agent = agent.copyWith(
                      biologicalControlAgentTypeId: controlAgent.id,
                      biologicalControlAgentName: controlAgent.scientificName,
                      biologicalControlAgentTypeCountryName:
                          controlAgent.countryOrigin,
                      reasonForBioAgent: controlAgent.reasonBioAgent);
                },
              ),
              _buildSelectDateReleased(),
              _buildSelectStakeHolderWidget(),
              _buildSelectDescriptionWidget(),
              AttributeItem(
                child: SelectItemWidget(
                  title: LocaleKeys.carRaised.tr(),
                  onSelect: (isSelected) {
                    carRaised = isSelected;
                  },
                ),
              ),
              AttributeItem(
                child: SelectItemWidget(
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
                  onChanged: (value) {
                    agent = agent.copyWith(comment: value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectDateReleased() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateReleased',
        hintText: LocaleKeys.dateReleased.tr(),
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
    return CmoDropdown(
      name: 'StakeHolderId',
      hintText: LocaleKeys.stakeholderName.tr(),
      inputDecoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
        isDense: true,
        labelText: LocaleKeys.stakeholderName.tr(),
        labelStyle: context.textStyles.bodyBold.black,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.grey)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.blue)),
      ),
      onChanged: (int? id) {
        if (id == -1) {
          _formKey.currentState!.fields['StakeHolderId']?.reset();
        }
      },
      itemsData: [
        CmoDropdownItem(id: -1, name: LocaleKeys.stakeholderName.tr()),
        CmoDropdownItem(id: 0, name: 'Captain Planet 0'),
        CmoDropdownItem(id: 1, name: 'Captain Planet 1'),
      ],
    );
  }

  Widget _buildSelectDescriptionWidget() {
    return CmoDropdown(
      name: 'DescriptionMonitoringRequirementsId',
      hintText: LocaleKeys.descriptionOfMonitoringRequirements.tr(),
      inputDecoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
        isDense: true,
        labelText: LocaleKeys.descriptionOfMonitoringRequirements.tr(),
        labelStyle: context.textStyles.bodyBold.black,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.grey)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.blue)),
      ),
      onChanged: (int? id) {
        if (id == -1) {
          _formKey.currentState!.fields['DescriptionMonitoringRequirementsId']
              ?.reset();
        }
      },
      itemsData: [
        CmoDropdownItem(
            id: -1, name: LocaleKeys.descriptionOfMonitoringRequirements.tr()),
        CmoDropdownItem(id: 0, name: 'Description Planet 0'),
        CmoDropdownItem(id: 1, name: 'Description Planet 1'),
      ],
    );
  }
}
