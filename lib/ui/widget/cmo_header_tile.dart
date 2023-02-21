import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoHeaderTile extends StatelessWidget {
  const CmoHeaderTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.blueDark1,
      child: SizedBox(
        height: 35,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 16, 0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: context.textStyles.bodyBold.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
