import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class OptionItem<T> {
  final T id;
  final String title;
  final Widget? suffixIcon;
  final bool isHighlighted;
  const OptionItem({
    required this.id,
    required this.title,
    this.suffixIcon,
    this.isHighlighted = false,
  });

  OptionItem<T> copyWith({
    Widget? suffixIcon,
    String? title,
    T? id,
    bool? isHighlighted,
  }) {
    return OptionItem<T>(
      title: title ?? this.title,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      id: id ?? this.id,
      isHighlighted: isHighlighted ?? this.isHighlighted,
    );
  }
}

class DropdownStateless<T> extends StatelessWidget {
  final String keyName;
  final OptionItem<T>? itemSelected;
  final List<OptionItem<T>> listItems;
  final String hintText;
  final void Function(T) onSelected;
  final bool enable;
  final void Function() onTapDropdown;
  final bool isDropdownOpened;
  final TextStyle? textStyle;

  DropdownStateless({
    required this.keyName,
    required this.onTapDropdown,
    required this.isDropdownOpened,
    required this.hintText,
    required this.onSelected,
    required this.listItems,
    this.itemSelected,
    this.enable = true,
    this.textStyle,
  }) {
    actionKey = LabeledGlobalKey(keyName);
  }

  late LabeledGlobalKey actionKey;
  late double height, width, xPosition, yPosition;
  OverlayEntry? floatingDropdown;

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
                    onRemoveDropdown();
                    onTapDropdown();
                  },
                ),
              ),
              Positioned(
                left: xPosition,
                top: yPosition,
                width: width,
                height: listItems.length * height,
                child: DropDown<T>(
                  listItem: listItems,
                  textStyle: textStyle,
                  onTap: (value) {
                    onRemoveDropdown();
                    onTapDropdown();
                    onSelected(value.id);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onShowDropdown(BuildContext? context) {
    if (context == null) return;
    findDropdownData();
    floatingDropdown = _createFloatingDropdown();
    Overlay.of(context).insert(floatingDropdown!);
  }

  void onRemoveDropdown() {
    if (floatingDropdown == null) return;
    floatingDropdown!.remove();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(isDropdownOpened) {
        onShowDropdown(context);
      } else {
        onRemoveDropdown();
      }
    });

    return GestureDetector(
      key: actionKey,
      onTap: () {
        if (enable) {
          onTapDropdown();
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
                itemSelected?.title ?? hintText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle ?? context.textStyles.bodyNormal.blueDark2,
              ),
            ),
            Assets.icons.icArrowDown.svg(),
          ],
        ),
      ),
    );
  }
}

class CmoCustomDropdown<T> extends StatefulWidget {
  final String keyName;
  final OptionItem<T>? itemSelected;
  final List<OptionItem<T>> listItems;
  final String hintText;
  final void Function(T) onSelected;
  final bool enable;
  final bool automaticallyChangeIsDropDownOpenedValue;
  final GlobalKey? actionKey;
  final TextStyle? textStyle;

  const CmoCustomDropdown({
    required this.keyName,
    required this.listItems,
    required this.onSelected,
    this.actionKey,
    this.hintText = '',
    this.itemSelected,
    this.enable = true,
    this.automaticallyChangeIsDropDownOpenedValue = false,
    this.textStyle,
  });

  @override
  CmoCustomDropdownState createState() => CmoCustomDropdownState<T>();
}

class CmoCustomDropdownState<T> extends State<CmoCustomDropdown<T>> {
  late GlobalKey actionKey;
  late double height, width, xPosition, yPosition;
  late OverlayEntry floatingDropdown;
  bool isDropdownOpened = false;

  @override
  void initState() {
    actionKey = widget.actionKey ?? GlobalKey(debugLabel: widget.keyName);
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
                  textStyle: widget.textStyle,
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
                style: widget.textStyle ?? context.textStyles.bodyNormal.blueDark2,
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
  final TextStyle? textStyle;

  const DropDown({
    required this.listItem,
    required this.onTap,
    this.textStyle,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
                      ? item.copyWith(
                          suffixIcon: Assets.icons.icArrowUp.svgWhite,
                          isHighlighted: true,
                        )
                      : item,
                  textStyle: textStyle,
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
  final TextStyle? textStyle;

  const CustomDropDownItem({
    super.key,
    required this.optionItem,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = optionItem.isHighlighted ? context.colors.white : context.colors.blueDark2;
    final backgroundColor = optionItem.isHighlighted ? context.colors.blue71B8 : context.colors.white;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              optionItem.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: (textStyle ?? context.textStyles.bodyNormal).copyWith(color: textColor),
            ),
          ),
          if (optionItem.suffixIcon != null) ...[optionItem.suffixIcon!],
        ],
      ),
    );
  }
}
