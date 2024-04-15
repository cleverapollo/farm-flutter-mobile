import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/components/bottom_sheet_selection/bottom_sheet_multiple_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class MultipleSelectionWidget<T> extends StatelessWidget {
  final List<BottomSheetMultipleSelectionItem<T>> items;
  final void Function(T) onRemove;

  const MultipleSelectionWidget({
    super.key,
    this.items = const [],
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colors.blueDark2,
            width: 2,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10,
        runSpacing: 6,
        children: items
            .map(
              (element) => _MultipleSelectionItem(
                title: element.titleValue,
                onRemove: () => onRemove(element.item),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _MultipleSelectionItem extends StatelessWidget {
  final String? title;
  final void Function() onRemove;

  _MultipleSelectionItem({
    required this.title,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRemove,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.blue,
        ),
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.bodyBold.white.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Assets.icons.icRemoveTrainee.svg(),
          ],
        ),
      ),
    );
  }
}
