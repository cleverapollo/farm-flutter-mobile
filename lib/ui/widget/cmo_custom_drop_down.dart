import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class OptionItem<T> {
  final T id;
  final String title;
  final Widget? suffixIcon;

  const OptionItem({
    required this.id,
    required this.title,
    this.suffixIcon,
  });

  OptionItem<T> copyWith({
    Widget? suffixIcon,
    String? title,
    T? id,
  }) {
    return OptionItem<T>(
      title: title ?? this.title,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      id: id ?? this.id,
    );
  }
}

class CmoCustomDropdown<T> extends StatefulWidget {
  final String actionKey;
  final OptionItem<T>? itemSelected;
  final List<OptionItem<T>> listItems;
  final String hintText;
  final void Function(T) onSelected;
  final bool enable;

  const CmoCustomDropdown({
    required this.actionKey,
    required this.listItems,
    required this.onSelected,
    this.hintText = '',
    this.itemSelected,
    this.enable = true,
  }) : super();

  @override
  _CmoCustomDropdownState createState() => _CmoCustomDropdownState<T>();
}

class _CmoCustomDropdownState<T> extends State<CmoCustomDropdown<T>> {
  late GlobalKey actionKey;
  late double height, width, xPosition, yPosition;
  late OverlayEntry floatingDropdown;
  bool isDropdownOpened = false;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.actionKey);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void findDropdownData() {
    final renderBox = actionKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    height = renderBox.size.height;
    width = renderBox.size.width;
    final offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    floatingDropdown.remove();
                    setState(() {
                      isDropdownOpened = !isDropdownOpened;
                    });
                  },
                ),
              ),
              Positioned(
                left: xPosition,
                top: yPosition,
                width: width,
                height: widget.listItems.length * height,
                child: DropDown<T>(
                  listItem: widget.listItems,
                  onTap: (value) {
                    floatingDropdown.remove();
                    setState(() {
                      isDropdownOpened = !isDropdownOpened;
                    });

                    widget.onSelected(value.id);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        if (widget.enable) {
          setState(() {
            if (isDropdownOpened) {
              floatingDropdown.remove();
            } else {
              findDropdownData();
              floatingDropdown = _createFloatingDropdown();
              Overlay.of(context).insert(floatingDropdown);
            }

            isDropdownOpened = !isDropdownOpened;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: context.colors.white,
          border: Border.all(color: context.colors.blueDark2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                widget.itemSelected?.title ?? widget.hintText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.bodyNormal.blueDark2,
              ),
            ),
            Assets.icons.icArrowDown.svg(),
          ],
        ),
      ),
    );
  }
}

class DropDown<T> extends StatelessWidget {
  final List<OptionItem<T>> listItem;
  final void Function(OptionItem<T>) onTap;

  const DropDown({
    required this.listItem,
    required this.onTap,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colors.white,
        border: Border.all(color: context.colors.blueDark2),
      ),
      child: Column(
        children: listItem
            .map(
              (item) => GestureDetector(
                onTap: () => onTap(item),
                child: CustomDropDownItem(
                  optionItem: listItem.first == item
                      ? item.copyWith(suffixIcon: Assets.icons.icArrowUp.svg())
                      : item,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CustomDropDownItem<T> extends StatelessWidget {
  final OptionItem<T> optionItem;

  const CustomDropDownItem({required this.optionItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              optionItem.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyNormal.blueDark2,
            ),
          ),
          if (optionItem.suffixIcon != null) ...[optionItem.suffixIcon!],
        ],
      ),
    );
  }
}
