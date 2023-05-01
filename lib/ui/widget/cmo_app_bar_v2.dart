import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

const _h1 = 45.0;
const _h2 = 60.0;

class CmoAppBarV2 extends StatelessWidget implements PreferredSizeWidget {
  const CmoAppBarV2({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.onTapLeading,
    this.trailing,
    this.onTapTrailing,
    this.showLeading = false,
    this.showTrailing = false,
    this.showAdding = false,
    this.adding,
    this.onTapAdding,
  });

  final bool showAdding;
  final bool showLeading;
  final bool showTrailing;

  final String title;

  final String? subtitle;

  final Widget? leading;

  final VoidCallback? onTapLeading;

  final Widget? trailing;

  final VoidCallback? onTapTrailing;

  final Widget? adding;

  final VoidCallback? onTapAdding;

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
          Text(
            subtitle!,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: context.textStyles.bodyBold
                .copyWith(color: context.colors.blue),
          )
        ],
      );
    }

    var leading = showLeading
        ? CmoTappable(
            onTap: onTapLeading ?? () => Navigator.pop(context),
            child: SizedBox.square(
              dimension: _h1,
              child: Center(
                  child: this.leading ?? Assets.icons.icArrowLeft.svgBlack),
            ),
          )
        : const SizedBox(width: _h1);
    leading = Padding(
      padding: const EdgeInsets.only(left: 10),
      child: leading,
    );

    var trailing = showTrailing
        ? CmoTappable(
            onTap: onTapTrailing ?? () => Navigator.pop(context),
            child: SizedBox.square(
              dimension: _h1,
              child:
                  Center(child: this.trailing ?? Assets.icons.icClose.svgBlack),
            ),
          )
        : const SizedBox(width: _h1);
    trailing = Padding(
      padding: const EdgeInsets.only(right: 4),
      child: trailing,
    );

    var adding = showAdding
        ? CmoTappable(
            onTap: onTapAdding ?? () => Navigator.pop(context),
            child: SizedBox.square(
              dimension: _h1,
              child:
                  Center(child: this.trailing ?? Assets.icons.icAdd.svgBlack),
            ),
          )
        : const SizedBox(width: _h1);
    adding = Padding(
      padding: const EdgeInsets.only(right: 4),
      child: adding,
    );

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
            if (showAdding) adding else Container(),
          ],
        ),
      ),
    );
  }
}
