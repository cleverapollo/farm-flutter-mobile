import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/information_text_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/cmo_text_field_widget.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class SelectControlAgentWidget extends StatefulWidget {
  const SelectControlAgentWidget({
    super.key,
    required this.onSelect,
    required this.initAgent,
    required this.agentTypes,
    this.isShowError = false,
  });

  final BiologicalControlAgent initAgent;
  final List<BiologicalControlAgentType> agentTypes;
  final bool isShowError;
  final void Function(BiologicalControlAgentType) onSelect;

  @override
  State<StatefulWidget> createState() => _SelectControlAgentWidgetState();
}

class _SelectControlAgentWidgetState extends State<SelectControlAgentWidget> {
  BiologicalControlAgentType? selectedAgent;
  late final List<BiologicalControlAgentType> agentTypes;
  List<Country> countries = <Country>[];

  @override
  void initState() {
    super.initState();
    agentTypes = widget.agentTypes;
    final intAgentTypeId = widget.initAgent.biologicalControlAgentTypeId;
    final index = agentTypes.indexWhere(
      (e) => e.biologicalControlAgentTypeId == intAgentTypeId,
    );
    if (index != -1) {
      selectedAgent = agentTypes[index];
    }

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        countries = await cmoDatabaseMasterService.getCountry();
        setState(() {});
      },
    );
  }

  String getCountryNameByCountryId(int? countryId) {
    final country = countries.firstWhereOrNull((element) => element.countryId == countryId);
    return country?.countryName == null ? '' : country!.countryName!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CmoHeaderTile(
          title: LocaleKeys.nameOfControlAgent.tr(),
          backgroundColor: context.colors.blueDark2,
        ),
        BottomSheetSelection(
          isShowError: widget.isShowError,
          hintText: LocaleKeys.select_name_of_control_agent.tr(),
          hintTextStyle: context.textStyles.bodyBold.blueDark3,
          value: selectedAgent?.biologicalControlAgentTypeName,
          isRequiredField: true,
          displayHorizontal: false,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (agentTypes.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: agentTypes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        selectedAgent = agentTypes[index];
                      });

                      if (selectedAgent != null) {
                        widget.onSelect(selectedAgent!);
                      }
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        agentTypes[index].biologicalControlAgentTypeName ?? '',
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
        ),
        InformationText(),
        CmoHeaderTile(
          title: LocaleKeys.additional_details_optional.tr(),
          backgroundColor: context.colors.blueDark2,
        ),
        const SizedBox(height: 8),
        AutofillWidget(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          title: LocaleKeys.scientificName.tr(),
          value: selectedAgent?.biologicalControlAgentTypeScientificName,
        ),
        AutofillWidget(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          title: LocaleKeys.countryOfOrigin.tr(),
          value: getCountryNameByCountryId(selectedAgent?.countryId),
        ),
        AutofillWidget(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          title: LocaleKeys.reasonForBioAgent.tr(),
          value: selectedAgent?.reasonForBioAgent,
        ),
      ],
    );
  }
}
