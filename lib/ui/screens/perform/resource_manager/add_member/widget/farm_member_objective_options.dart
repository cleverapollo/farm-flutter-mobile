import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class FarmMemberObjectiveOptions extends StatefulWidget {
  const FarmMemberObjectiveOptions({
    super.key,
    this.onTap,
    this.initFarmMemberObjectiveOptionId,
    this.farmObjectiveOption = const <FarmObjectiveOption>[],
  });

  final List<FarmObjectiveOption> farmObjectiveOption;
  final int? initFarmMemberObjectiveOptionId;
  final void Function(int)? onTap;

  @override
  State<FarmMemberObjectiveOptions> createState() => _FarmMemberObjectiveOptionsState();
}

class _FarmMemberObjectiveOptionsState extends State<FarmMemberObjectiveOptions> {
  int? isSelect;

  @override
  void initState() {
    super.initState();
    isSelect = widget.initFarmMemberObjectiveOptionId;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.farmObjectiveOption
          .map(
            (e) => FarmMemberObjectiveOption(
              option: e,
              selectedOptionId: isSelect,
              width: (MediaQuery.of(context).size.width -
                      10 * (widget.farmObjectiveOption.length - 1) -
                      16) /
                  widget.farmObjectiveOption.length,
              onTap: () {
                setState(() {
                  isSelect = e.farmObjectiveOptionId;
                  widget.onTap?.call(e.farmObjectiveOptionId);
                });
              },
            ),
          )
          .toList()
          .withSpaceBetween(width: 10),
    );
  }
}

class FarmMemberObjectiveOption extends StatelessWidget {

  final FarmObjectiveOption option;
  final int? selectedOptionId;
  final VoidCallback onTap;
  final double width;
  const FarmMemberObjectiveOption({
    required this.option,
    required this.width,
    required this.selectedOptionId,
    required this.onTap,
  });

  bool? get isSelected => selectedOptionId == null ? null : selectedOptionId == option.farmObjectiveOptionId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Container(
        alignment: Alignment.center,
        width: width,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buildColor(context),
          border: (isSelected ?? false)
              ? null
              : Border.all(
            width: 2,
            color: context.colors.blueDark2,
          ),
        ),
        child: Text(
          option.farmObjectiveOptionName ?? '',
          style: context.textStyles.bodyBold.copyWith(
            color: (isSelected ?? false) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Color buildColor(BuildContext context) {
    if (isSelected == null || !isSelected!) {
      return Colors.white;
    }

    if (isSelected!) {
      return context.colors.blue;
    }

    return Colors.white;
  }
}
