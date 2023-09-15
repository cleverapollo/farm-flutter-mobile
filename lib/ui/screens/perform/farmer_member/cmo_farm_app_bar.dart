import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

const _h1 = 45.0;
const _h2 = 65.0;

class CmoFarmAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CmoFarmAppBar({
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
    this.showFarmName = false,
  });

  factory CmoFarmAppBar.addingRegisterWithFarmName({required String title}) {
    return CmoFarmAppBar(
      title: title,
      showFarmName: true,
      showTrailing: true,
      showLeading: true,
    );
  }

  factory CmoFarmAppBar.listRegisterWithFarmName(
      {required String title, void Function()? onTapAdding}) {
    return CmoFarmAppBar(
      title: title,
      showFarmName: true,
      showAdding: true,
      showLeading: true,
      onTapAdding: onTapAdding,
    );
  }

  final bool showAdding;
  final bool showLeading;
  final bool showTrailing;
  final bool showFarmName;

  final String title;

  final String? subtitle;

  final Widget? leading;

  final VoidCallback? onTapLeading;

  final Widget? trailing;

  final VoidCallback? onTapTrailing;

  final Widget? adding;

  final VoidCallback? onTapAdding;

  @override
  Size get preferredSize =>
      Size.fromHeight((subtitle != null || showFarmName) ? _h2 : _h1);

  @override
  State<CmoFarmAppBar> createState() => _CmoFarmAppBarState();
}

class _CmoFarmAppBarState extends State<CmoFarmAppBar> {
  @override
  Widget build(BuildContext context) {
    Widget text = FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        widget.title,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: context.textStyles.titleBold,
      ),
    );

    if (widget.subtitle.isNullOrEmpty && widget.showFarmName) {
      text = Column(
        children: [
          text,
          FutureBuilder(
            future: configService.getActiveFarm(),
            builder: (context, farm) {
              return Text(
                farm.data?.farmName ?? '',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.blue),
              );
            },
          )
        ],
      );
    }

    if (widget.subtitle != null && widget.showFarmName == false) {
      text = Column(
        children: [
          text,
          Text(
            widget.subtitle!,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: context.textStyles.bodyBold
                .copyWith(color: context.colors.blue),
          )
        ],
      );
    }

    var leading = widget.showLeading
        ? CmoTappable(
            onTap: widget.onTapLeading ?? () => Navigator.pop(context),
            child: SizedBox.square(
              dimension: _h1,
              child: Center(
                  child: widget.leading ?? Assets.icons.icArrowLeft.svgBlack),
            ),
          )
        : const SizedBox(width: _h1);
    leading = Padding(
      padding: const EdgeInsets.only(left: 10),
      child: leading,
    );

    var trailing = widget.showTrailing
        ? CmoTappable(
            onTap: widget.onTapTrailing ?? () => Navigator.pop(context),
            child: SizedBox.square(
              dimension: _h1,
              child: Center(
                  child: widget.trailing ?? Assets.icons.icClose.svgBlack),
            ),
          )
        : const SizedBox(width: _h1);
    trailing = Padding(
      padding: const EdgeInsets.only(right: 4),
      child: trailing,
    );

    var adding = widget.showAdding
        ? CmoTappable(
            onTap: widget.onTapAdding ?? () => Navigator.pop(context),
            child: SizedBox.square(
              dimension: _h1,
              child:
                  Center(child: widget.trailing ?? Assets.icons.icAdd.svgBlack),
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
        size: widget.preferredSize,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: text,
              ),
            ),
            if (widget.showAdding) adding,
            if (widget.showTrailing) trailing
          ],
        ),
      ),
    );
  }
}
