import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FarmerSelectGenderWidget extends StatefulWidget {
  final void Function(int) onTap;

  const FarmerSelectGenderWidget({
    super.key,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() => _FarmerSelectGenderWidgetState();
}

class _FarmerSelectGenderWidgetState extends State<FarmerSelectGenderWidget> {
  final List<CmoDropdownItem> listGender = [
    CmoDropdownItem(id: 0, name: LocaleKeys.male_key.tr()),
    CmoDropdownItem(id: 1, name: LocaleKeys.female_key.tr()),
  ];

  late CmoDropdownItem selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = listGender.first;
  }

  void _onSelectGender(CmoDropdownItem selectedItem) {
    setState(() {
      selectedGender = selectedItem;
    });

    widget.onTap(selectedGender.id as int);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
          child: Text(
            LocaleKeys.gender.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: listGender.map(_buildItem).toList().withSpaceBetween(width: 24),
        )
      ],
    );
  }

  Widget _buildItem(CmoDropdownItem item) {
    final isSelected = item.id == selectedGender.id;
    return FilledButton(
      onPressed: () => _onSelectGender(item),
      style: FilledButton.styleFrom(
        minimumSize: const Size(140, 39),
        backgroundColor: isSelected ? context.colors.blue : context.colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: isSelected ? BorderSide.none : BorderSide(color: context.colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  item.name,
                  style: context.textStyles.bodyBold.copyWith(
                    color: isSelected ? context.colors.white : context.colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
