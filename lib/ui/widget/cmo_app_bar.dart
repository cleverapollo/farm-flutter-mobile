import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

const _h1 = 45.0;
const _h2 = 60.0;

class CmoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CmoAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.onTapLeading,
    this.trailing,
    this.onTapTrailing,
  });

  final String title;

  final String? subtitle;

  final Widget? leading;

  final VoidCallback? onTapLeading;

  final Widget? trailing;

  final VoidCallback? onTapTrailing;

  @override
  Size get preferredSize => Size.fromHeight(subtitle != null ? _h2 : _h1);

  @override
  Widget build(BuildContext context) {
    Widget text = FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        title,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: context.textStyles.titleBold,
      ),
    );

    if (subtitle != null) {
      text = Column(
        children: [
          text,
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              subtitle!,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyBold.copyWith(color: context.colors.blue),
            ),
          )
        ],
      );
    }

    Widget leading = this.leading != null
        ? CmoTappable(
            onTap: onTapLeading ?? () {},
            child: SizedBox.square(
              dimension: _h1,
              child: Center(child: this.leading),
            ),
          )
        : const SizedBox(width: _h1);
    leading = Padding(
      padding: const EdgeInsets.only(left: 4),
      child: leading,
    );

    final Widget trailing = this.trailing != null
        ? CmoTappable(
            onTap: onTapTrailing ?? () {},
            child: SizedBox.square(
              dimension: _h1,
              child: Center(child: this.trailing),
            ),
          )
        : const SizedBox(width: _h1);

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox.fromSize(
        size: preferredSize,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: text,
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
