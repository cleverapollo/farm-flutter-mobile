import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
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
        BottomSheetSelection(
          hintText: LocaleKeys.nameOfControlAgent.tr(),
          value: selectedAgent?.biologicalControlAgentTypeName,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
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
        const SizedBox(height: 8),
        _buildAutoFillWidget(
          LocaleKeys.scientificName.tr(),
          selectedAgent?.biologicalControlAgentTypeScientificName,
        ),
        _buildAutoFillWidget(
          LocaleKeys.countryOfOrigin.tr(),
          selectedAgent?.biologicalControlAgentTypeName,
        ),
        _buildAutoFillWidget(
          LocaleKeys.reasonForBioAgent.tr(),
          selectedAgent?.reasonForBioAgent,
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
        vertical: 8.0,
      ),
      child: CmoTextFieldV2(
        readOnly: true,
        labelText: key,
        initialValue: value,
      ),
    );
  }
}
