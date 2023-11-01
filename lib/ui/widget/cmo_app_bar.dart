import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

const _h1 = 60.0;
const _h2 = 90.0;

class NavigationBreadcrumbsModel {
  final String? groupSchemeName;
  final String? rmuName;

  NavigationBreadcrumbsModel({
    this.groupSchemeName,
    this.rmuName,
  });
}

class CmoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CmoAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.onTapLeading,
    this.trailing,
    this.onTapTrailing,
    this.subtitleTextStyle,
    this.sectionName,
  });

  final String title;

  final String? subtitle;

  final Widget? leading;

  final VoidCallback? onTapLeading;

  final Widget? trailing;

  final VoidCallback? onTapTrailing;

  final TextStyle? subtitleTextStyle;

  final String? sectionName;

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
            style: subtitleTextStyle ?? context.textStyles.bodyBold
                .copyWith(color: context.colors.blue),
          )
        ],
      );
    }

    var leading = this.leading != null
        ? CmoTappable(
            onTap: onTapLeading ?? () {},
            child: SizedBox.square(
              dimension: _h1,
              child: Center(child: this.leading),
            ),
          )
        : const SizedBox(width: _h1);
    leading = Padding(
      padding: const EdgeInsets.only(left: 10),
      child: leading,
    );

    var trailing = this.trailing != null
        ? CmoTappable(
            onTap: onTapTrailing ?? () {},
            child: SizedBox.square(
              dimension: _h1,
              child: Center(child: this.trailing),
            ),
          )
        : const SizedBox(width: _h1);
    trailing = Padding(
      padding: const EdgeInsets.only(right: 4),
      child: trailing,
    );

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox.fromSize(
        size: preferredSize,
        child: Column(
          children: [
            Row(
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
            Align(
              alignment: Alignment.centerLeft,
              child: buildNavigationBreadcrumbs(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavigationBreadcrumbs(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 4,
        ),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (navigationBreadcrumbs.previousSectionName.isNotBlank)
              ...navigationBreadcrumbs.previousSectionName.map((e) {
                return InkWell(
                  onTap: () {
                    navigationBreadcrumbs.updateCurrentSectionName(null);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '$e > ',
                    style: context.textStyles.bodyNormal.grey,
                  ),
                );
              }),
            if (navigationBreadcrumbs.currentSectionName.isNotBlank)
              Text(
                navigationBreadcrumbs.currentSectionName ?? '',
                style: context.textStyles.bodyNormal.blueDark2,
              ),
          ],
        ),
      ),
    );
  }
}
