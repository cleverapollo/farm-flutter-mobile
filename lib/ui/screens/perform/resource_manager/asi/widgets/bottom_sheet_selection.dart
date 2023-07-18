import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class BottomSheetSelection extends StatelessWidget {
  final VoidCallback onTap;
  final String? value;
  final String hintText;
  final Widget? rightIconData;

  const BottomSheetSelection({
    required this.onTap,
    required this.hintText,
    this.value,
    this.rightIconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: context.colors.grey),
          ),
        ),
        child: Row(
          children: [
            Text(
              hintText,
              style: context.textStyles.bodyBold.black,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Text(
                value ?? '',
                style: context.textStyles.bodyNormal.black,
                textAlign: TextAlign.center,
              ),
            ),
            rightIconData ?? Icon(
              Icons.keyboard_arrow_down_sharp,
              color: context.colors.black,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
