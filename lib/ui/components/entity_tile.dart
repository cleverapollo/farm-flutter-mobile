import 'package:flutter/material.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';

class EntityTile extends StatelessWidget {
  const EntityTile({
    super.key,
    required this.title,
    this.selected = false,
  });

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: Row(
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: Text(
                  title,
                  style: context.textStyles.bodyNormal,
                ),
              ),
              if (selected) Assets.icons.icTick.svg(),
              if (selected) const SizedBox(width: 24),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          indent: 24,
          endIndent: 24,
          color: context.colors.blueDark2,
        ),
      ],
    );
  }
}
