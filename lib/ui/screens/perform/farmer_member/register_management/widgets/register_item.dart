import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class RegisterItem extends StatelessWidget {

  final String title;
  final Map<String, String?> mapData;

  RegisterItem({
    required this.title,
    required this.mapData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.greyD9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: Text(
              title,
              style: context.textStyles.bodyBold.copyWith(
                color: context.colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6,
            ),
            child: Container(
              height: 1,
              color: context.colors.black,
            ),
          ),
          ...informationWidget(),
        ],
      ),
    );
  }

  List<Widget> informationWidget() {
    final children = <Widget>[];
    for (var index = 0; index < mapData.keys.length; index++) {
      final keyString = mapData.keys.elementAt(index);
      children.add(
        InformationRowItem(
          keyString: keyString,
          value: mapData[keyString],
          isGreyBackground: index.isOdd,
        ),
      );
    }

    return children;
  }
}

class InformationRowItem extends StatelessWidget {
  final String keyString;
  final String? value;
  final bool isGreyBackground;

  const InformationRowItem({
    super.key,
    required this.keyString,
    required this.value,
    this.isGreyBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isGreyBackground ? context.colors.greyLight1 : context.colors.white;
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.fromLTRB(4, 8, 11, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              keyString,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyNormal,
            ),
          ),
          Expanded(
            child: Text(
              value ?? '',
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyNormal,
            ),
          ),
        ],
      ),
    );
  }
}
