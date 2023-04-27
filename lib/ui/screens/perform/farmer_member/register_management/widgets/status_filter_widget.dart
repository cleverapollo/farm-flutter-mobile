import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class StatusFilterWidget extends StatefulWidget {
  const StatusFilterWidget({
    super.key,
    required this.onSelectFilter,
    this.statusFilter,
  });

  final void Function(StatusFilterEnum) onSelectFilter;
  final StatusFilterEnum? statusFilter;

  @override
  State<StatefulWidget> createState() => _StatusFilterWidgetState();
}

class _StatusFilterWidgetState extends State<StatusFilterWidget> {
  late StatusFilterEnum statusFilter;

  @override
  void initState() {
    super.initState();
    statusFilter = widget.statusFilter ?? StatusFilterEnum.open;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: StatusFilterEnum.values.map(_buildItem).toList().withSpaceBetween(width: 8),
    );
  }

  Widget _buildItem(StatusFilterEnum item) {
    final isSelected = item == statusFilter;
    return InkWell(
      onTap: () {
        setState(() {
          statusFilter = item;
        });

        widget.onSelectFilter(statusFilter);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? context.colors.blue : context.colors.white,
          border: isSelected ? null : Border.all(color: context.colors.black),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
        alignment: Alignment.center,
        child: Text(
          item.valueName,
          style: context.textStyles.bodyNormal.copyWith(
            fontSize: 12,
            color: isSelected ? context.colors.white : context.colors.black,
          ),
        ),
      ),
    );
  }
}
