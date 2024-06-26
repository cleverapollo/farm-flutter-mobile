import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class SelectPropertyDamaged extends StatefulWidget {
  const SelectPropertyDamaged({
    required this.treatmentMethods,
    required this.selectTreatmentMethod,
  });

  final List<TreatmentMethod> treatmentMethods;
  final List<TreatmentMethod> selectTreatmentMethod;

  @override
  State<StatefulWidget> createState() => _SelectPropertyDamagedState();

  static Future<dynamic> push({
    required BuildContext context,
    required List<TreatmentMethod> treatmentMethods,
    required List<TreatmentMethod> selectTreatmentMethod,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectPropertyDamaged(
          treatmentMethods: treatmentMethods,
          selectTreatmentMethod: selectTreatmentMethod,
        ),
      ),
    );
  }
}

class _SelectPropertyDamagedState extends State<SelectPropertyDamaged> {

  final List<TreatmentMethod> selectedItems = <TreatmentMethod>[];

  @override
  void initState() {
    super.initState();
    selectedItems.clear();
    selectedItems.addAll(widget.selectTreatmentMethod);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.select_treatment_method.tr(),
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
              itemCount: widget.treatmentMethods.length,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              itemBuilder: (context, index) =>
                  _buildItem(widget.treatmentMethods[index]),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CmoFilledButton(
        title: LocaleKeys.save.tr(),
        onTap: () => Navigator.of(context).pop(selectedItems),
      ),
    );
  }

  Widget _buildItem(TreatmentMethod item) {
    final activeItem = selectedItems.firstWhereOrNull((element) => element.treatmentMethodId == item.treatmentMethodId);

    return InkWell(
      onTap: () {
        setState(() {
          final canAdd = selectedItems.firstWhereOrNull((e) => e.treatmentMethodId == item.treatmentMethodId) == null;
          if (canAdd) {
            selectedItems.add(item);
          } else {
            selectedItems.removeWhere(
              (e) => e.treatmentMethodId == item.treatmentMethodId,
            );
          }
        });
      },
      child: AttributeItem(
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.treatmentMethodName ?? '',
                style: context.textStyles.bodyNormal.black,
              ),
            ),
            if (activeItem != null)
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
