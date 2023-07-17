import 'package:flutter/material.dart';

Future showCustomModalBottomSheet(
  BuildContext context, {
  required Widget content,
}) async {
  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 2 / 3,
      minHeight: MediaQuery.of(context).size.height / 2,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    builder: (builder) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 10),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 2,
              width: 20,
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 16,
              ),
              color: Colors.black,
            ),
            Expanded(child: content),
          ],
        ),
      );
    },
  );
}

Future<Object> showCustomBottomSheet<T>(
  BuildContext context, {
  required Widget content,
}) async {
  return showBottomSheet<T>(
    context: context,
    enableDrag: true,
    elevation: 4,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 2 / 3,
      minHeight: MediaQuery.of(context).size.height / 2,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    builder: (builder) {
      return DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 5),
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
                color: Colors.black,
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
