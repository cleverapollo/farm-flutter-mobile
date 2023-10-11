import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class SelectItemWidget extends StatefulWidget {
  const SelectItemWidget({
    super.key,
    required this.title,
    required this.onSelect,
    this.initValue,
  });

  final String title;
  final bool? initValue;
  final void Function(bool) onSelect;

  @override
  State<StatefulWidget> createState() => _SelectItemWidgetState();
}

class _SelectItemWidgetState extends State<SelectItemWidget> {
  bool? isYesCompliance;

  @override
  void initState() {
    super.initState();
    isYesCompliance = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 5, 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: context.textStyles.bodyNormal.blueDark2,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isYesCompliance = true;
              });

              widget.onSelect(isYesCompliance!);
            },
            child: buildComplianceWidget(
              title: 'Yes',
              isSelected: isYesCompliance,
            ),
          ),
          const SizedBox(width: 20,),
          InkWell(
              onTap: () {
                setState(() {
                  isYesCompliance = false;
                });

                widget.onSelect(isYesCompliance!);
              },
              child: buildComplianceWidget(
                title: 'No',
                isSelected: !isYesCompliance!,
              ),
          ),
        ],
      ),
    );
  }

  Widget buildComplianceWidget({
    required String title,
    required bool? isSelected,
  }) {
    final backgroundColor = isSelected == null
        ? context.colors.white
        : (isSelected ? context.colors.blue : context.colors.white);

    final textColor = isSelected == null
        ? context.colors.black
        : (isSelected ? context.colors.white : context.colors.black);
    
    return Container(
      width: 46,
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        border: Border.all(color: context.colors.grey),
        color: backgroundColor,
      ),

      child: Text(
        title,
        textAlign: TextAlign.center,
        style: context.textStyles.bodyNormal.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
