import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

// const _h1 = 60.0;
// const _h2 = 90.0;
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
    this.subtitleTextStyle,
    this.sectionName,
    this.titleWidget,
  });

  final String title;

  final Widget? titleWidget;

  final String? subtitle;

  final Widget? leading;

  final VoidCallback? onTapLeading;

  final Widget? trailing;

  final VoidCallback? onTapTrailing;

  final TextStyle? subtitleTextStyle;

  final String? sectionName;

  @override
  Size get preferredSize => const Size.fromHeight(_h2);

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

      text = Column(
        children: [
          text,
          FutureBuilder(
            future: configService.getActiveUserRole(),
            builder: (context, userRole) {
              switch (userRole.data) {
                case UserRoleEnum.farmerMember:
                  return FutureBuilder(
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
                  );
                case UserRoleEnum.regionalManager:
                case UserRoleEnum.behave:
                case null:
                  if (subtitle != null) {
                    return Text(
                      subtitle!,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: subtitleTextStyle ??
                          context.textStyles.bodyBold
                              .copyWith(color: context.colors.blue),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
              }
            },
          )
        ],
      );

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
                    child: titleWidget ?? text,
                  ),
                ),
                trailing,
              ],
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: buildNavigationBreadcrumbs(context),
            // ),
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
        child: ValueListenableBuilder(
          valueListenable: navigationBreadcrumbs.previousSectionName,
          builder: (context, previousSectionName, _) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (previousSectionName.isNotBlank)
                  ...previousSectionName.map((e) {
                    if (e.isBlank) {
                      return const SizedBox.shrink();
                    }

                    if (previousSectionName.last.toLowerCase() == e.toLowerCase()) {
                      return Text(
                        e,
                        style: context.textStyles.bodyNormal.blueDark2,
                      );
                    }

                    if (previousSectionName.first.toLowerCase() == e.toLowerCase()) {
                      return Text(
                        '$e > ',
                        style: context.textStyles.bodyNormal.grey,
                      );
                    }

                    return InkWell(
                      onTap: Navigator.of(context).pop,
                      child: Text(
                        '$e > ',
                        style: context.textStyles.bodyNormal.grey,
                      ),
                    );
                  }),
              ],
            );
          },
        ),
      ),
    );
  }
}
