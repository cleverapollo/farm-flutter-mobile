import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';

class SelectControlAgentWidget extends StatefulWidget {
  const SelectControlAgentWidget({
    super.key,
    required this.onSelect,
    required this.initAgent,
    required this.agentTypes,
  });

  final BiologicalControlAgent initAgent;
  final List<BiologicalControlAgentType> agentTypes;

  final void Function(BiologicalControlAgentType) onSelect;

  @override
  State<StatefulWidget> createState() => _SelectControlAgentWidgetState();
}

class _SelectControlAgentWidgetState extends State<SelectControlAgentWidget> {
  BiologicalControlAgentType? selectedAgent;
  late final List<BiologicalControlAgentType> agentTypes;

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LocaleKeys.nameOfControlAgent.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        AttributeItem(
          child: CmoDropdown<BiologicalControlAgentType?>(
            shouldBorderItem: true,
            name: 'ControlAgent',
            hintText: LocaleKeys.complaintName.tr(),
            validator: requiredValidator,
            style: context.textStyles.bodyBold.blueDark2,
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              isDense: true,
              hintText: LocaleKeys.nameOfControlAgent.tr(),
              hintStyle: context.textStyles.bodyNormal.copyWith(color: Colors.grey),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            initialValue: selectedAgent,
            onChanged: (item) {
              setState(() {
                selectedAgent = item;
              });

              if (selectedAgent != null) {
                widget.onSelect(selectedAgent!);
              }
            },
            itemsData: agentTypes
                .map(
                  (e) => CmoDropdownItem<BiologicalControlAgentType>(
                    id: e,
                    name: e.biologicalControlAgentTypeName ?? '',
                  ),
                )
                .toList(),
          ),
        ),
        AttributeItem(
          child: _buildAutoFillWidget(
            LocaleKeys.scientificName.tr(),
            selectedAgent?.biologicalControlAgentTypeScientificName,
          ),
        ),
        AttributeItem(
          child: _buildAutoFillWidget(
            LocaleKeys.countryOfOrigin.tr(),
            selectedAgent?.biologicalControlAgentTypeName,
          ),
        ),
        AttributeItem(
          child: _buildAutoFillWidget(
            LocaleKeys.reasonForBioAgent.tr(),
            selectedAgent?.reasonForBioAgent,
          ),
        ),
      ],
    );
  }

  Widget _buildAutoFillWidget(
    String key,
    String? value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            key,
            style: context.textStyles.bodyBold.black,
          ),
          Row(
            children: [
              Text(
                value ?? '',
                style: context.textStyles.bodyNormal.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
