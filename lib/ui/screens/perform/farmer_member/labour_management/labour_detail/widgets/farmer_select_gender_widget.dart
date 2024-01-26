import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class FarmerSelectGenderWidget extends StatefulWidget {
  final void Function(int) onTap;
  final int? initialValue;

  const FarmerSelectGenderWidget({
    super.key,
    required this.onTap,
    this.initialValue,
  });

  @override
  State<StatefulWidget> createState() => _FarmerSelectGenderWidgetState();
}

class _FarmerSelectGenderWidgetState extends State<FarmerSelectGenderWidget> {
  final listGender = ValueNotifier(<Gender>[]);

  late Gender selectedGender;
  double widthButton = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      // listGender.value = await cmoDatabaseMasterService.getGender();
      listGender.value = [
        Gender(genderId: 1, genderName: LocaleKeys.male_key.tr()),
        Gender(genderId: 2, genderName: LocaleKeys.female_key.tr()),
      ];

      selectedGender = listGender.value.firstWhereOrNull(
              (element) => element.id == widget.initialValue) ??
          listGender.value.first;
      widthButton =
          (MediaQuery.of(context).size.width - 75) / listGender.value.length;
    });
  }

  void _onSelectGender(Gender selectedItem) {
    setState(() {
      selectedGender = selectedItem;
    });

    widget.onTap(selectedGender.id);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: listGender,
      builder: (context, data, _) {
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
              children: data
                  .map((element) => _buildItem(element))
                  .toList()
                  .withSpaceBetween(width: 25),
            ),
          ],
        );
      },
    );
  }

  Widget _buildItem(Gender item) {
    final isSelected = item.id == selectedGender.id;
    return InkWell(
      onTap: () => _onSelectGender(item),
      child: Container(
        width: widthButton,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? context.colors.blue : context.colors.white,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? null : Border.all(color: context.colors.grey),
        ),
        child: Text(
          item.genderName ?? '',
          style: context.textStyles.bodyBold.copyWith(
            color: isSelected ? context.colors.white : context.colors.black,
          ),
        ),
      ),
    );
  }
}
