import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

Future<Object> showCustomBottomSheet<T>(
  BuildContext context, {
  required Widget content,
}) async {
  return showBottomSheet<T>(
    context: context,
    enableDrag: true,
    elevation: 4,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    builder: (builder) {
      return Container(
        height: MediaQuery.of(context).size.height / 2.4,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              color: context.colors.blueDark2,
            ),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: context.colors.blueDark2,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(child: content),
          ],
        ),
      );
    },
  );
}