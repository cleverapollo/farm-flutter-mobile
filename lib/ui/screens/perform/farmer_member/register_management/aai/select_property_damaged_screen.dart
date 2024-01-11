import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class SelectPropertyDamagedScreen extends StatefulWidget {
  const SelectPropertyDamagedScreen({
    super.key,
    this.propertyDamages = const <PropertyDamaged>[],
    this.selectedPropertyDamages = const <PropertyDamaged>[],
  });

  final List<PropertyDamaged> propertyDamages;
  final List<PropertyDamaged> selectedPropertyDamages;

  @override
  State<StatefulWidget> createState() => SelectPropertyDamagedState();

  static Future<dynamic> push(
    BuildContext context,
    List<PropertyDamaged> propertyDamages,
      List<PropertyDamaged> selectedPropertyDamages,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectPropertyDamagedScreen(
          propertyDamages: propertyDamages,
          selectedPropertyDamages: selectedPropertyDamages,
        ),
      ),
    );
  }
}

class SelectPropertyDamagedState extends State<SelectPropertyDamagedScreen> {
  final List<PropertyDamaged> selectedItems = [];

  @override
  void initState() {
    super.initState();
    selectedItems.clear();
    selectedItems.addAll(widget.selectedPropertyDamages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.select_property_damaged.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: widget.propertyDamages.length,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              itemBuilder: (context, index) =>
                  _buildItem(widget.propertyDamages[index]),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CmoFilledButton(
        title: LocaleKeys.save.tr(),
        onTap: () {
          Navigator.of(context).pop(selectedItems);
        },
      ),
    );
  }

  Widget _buildItem(PropertyDamaged item) {
    final activeItem = selectedItems.firstWhere(
      (element) => element.propertyDamagedId == item.propertyDamagedId,
      orElse: () => const PropertyDamaged(),
    );

    return InkWell(
      onTap: () {
        setState(() {
          if (selectedItems.contains(item)) {
            selectedItems.remove(item);
          } else {
            selectedItems.add(item);
          }
        });
      },
      child: AttributeItem(
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.propertyDamagedName ?? '',
                style: context.textStyles.bodyNormal.black,
              ),
            ),
            if (activeItem != const PropertyDamaged())
              _buildSelectedIcon()
            else
              Assets.icons.icCheckCircle.svg(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedIcon() {
    return Stack(
      children: [
        Assets.icons.icCheckCircle.svg(),
        Positioned.fill(
          child: Align(
            child: Assets.icons.icCheck.svg(),
          ),
        ),
      ],
    );
  }
}
