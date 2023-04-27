import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

List<ControlAgent> _listControlAgent = [
  ControlAgent(
    scientificName: 'Hocus Pocus',
    countryOrigin: 'South Africa',
    reasonBioAgent: 'Eats the pest',
    nameControlAgent: 'West Indian Rooster',
  ),
  ControlAgent(
    scientificName: 'Hocus Pocus 1',
    countryOrigin: 'South Africa 1',
    reasonBioAgent: 'Eats the pest 1',
    nameControlAgent: 'West Indian Rooster 1',
  ),
  ControlAgent(
    scientificName: 'Hocus Pocus 2',
    countryOrigin: 'South Africa 2',
    reasonBioAgent: 'Eats the pest 2',
    nameControlAgent: 'West Indian Rooster 2',
  ),
];

class SelectControlAgentWidget extends StatefulWidget {
  final void Function(ControlAgent) onSelect;

  const SelectControlAgentWidget({
    super.key,
    required this.onSelect,
  });

  @override
  State<StatefulWidget> createState() => _SelectControlAgentWidgetState();
}

class _SelectControlAgentWidgetState extends State<SelectControlAgentWidget> {
  ControlAgent? selectedAgent;

  @override
  void initState() {
    super.initState();
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
        CmoDropdown<ControlAgent?>(
          name: 'ControlAgent',
          hintText: LocaleKeys.complaintName.tr(),
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            hintText: '${LocaleKeys.select.tr()} ${LocaleKeys.complaintName.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.grey)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.blue)),
          ),
          onChanged: (ControlAgent? item) {
            setState(() {
              selectedAgent = item;
            });

            if (selectedAgent != null) {
              widget.onSelect(selectedAgent!);
            }
          },
          itemsData: _listControlAgent
              .map(
                (e) => CmoDropdownItem<ControlAgent>(
                  id: e,
                  name: e.nameControlAgent ?? '',
                ),
              )
              .toList(),
        ),
        AttributeItem(
          child: _buildAutoFillWidget(
            LocaleKeys.scientificName.tr(),
            selectedAgent?.scientificName,
          ),
        ),
        AttributeItem(
          child: _buildAutoFillWidget(
            LocaleKeys.countryOfOrigin.tr(),
            selectedAgent?.countryOrigin,
          ),
        ),
        AttributeItem(
          child: _buildAutoFillWidget(
            LocaleKeys.reasonForBioAgent.tr(),
            selectedAgent?.reasonBioAgent,
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
