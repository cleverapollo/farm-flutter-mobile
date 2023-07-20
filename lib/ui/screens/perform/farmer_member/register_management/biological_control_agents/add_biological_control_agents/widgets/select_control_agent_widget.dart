import 'package:cmo/di.dart';
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
  });

  final void Function(BiologicalControlAgentType) onSelect;

  @override
  State<StatefulWidget> createState() => _SelectControlAgentWidgetState();
}

class _SelectControlAgentWidgetState extends State<SelectControlAgentWidget> {
  BiologicalControlAgentType? selectedAgent;
  final types = ValueNotifier(<BiologicalControlAgentType>[]);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final farm = await configService.getActiveFarm();

      types.value = await cmoDatabaseMasterService
          .getBiologicalControlAgentTypeByGroupSchemeId(
              farm?.groupSchemeId ?? 0);
    });
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
        ValueListenableBuilder(
          valueListenable: types,
          builder: (_, value, __) {
            return CmoDropdown<BiologicalControlAgentType?>(
              name: 'ControlAgent',
              hintText: LocaleKeys.complaintName.tr(),
              validator: requiredValidator,
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                hintText:
                    '${LocaleKeys.select.tr()} ${LocaleKeys.complaintName.tr().toLowerCase()}',
                hintStyle: context.textStyles.bodyNormal.grey,
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: context.colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: context.colors.blue)),
              ),
              onChanged: (item) {
                setState(() {
                  selectedAgent = item;
                });

                if (selectedAgent != null) {
                  widget.onSelect(selectedAgent!);
                }
              },
              itemsData: value
                  .map(
                    (e) => CmoDropdownItem<BiologicalControlAgentType>(
                      id: e,
                      name: e.biologicalControlAgentTypeName ?? '',
                    ),
                  )
                  .toList(),
            );
          },
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
