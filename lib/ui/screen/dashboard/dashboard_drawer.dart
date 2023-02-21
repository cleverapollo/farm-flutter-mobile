import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/entity.dart';
import 'package:cmo/service/app_info_service.dart';
import 'package:cmo/ui/screen/auth/login_screen.dart';
import 'package:cmo/ui/screen/legal/legal_screen.dart';
import 'package:cmo/ui/screen/support/support_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    super.key,
    required this.entity,
    required this.onTapClose,
  });

  final Entity entity;

  final VoidCallback onTapClose;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: context.colors.grey, width: 1),
        ),
        elevation: 0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                context.colors.blue,
                context.colors.blueDark1,
                context.colors.blueDark2,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.37, 1],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildUserRow(context),
                buildHeader(context, title: LocaleKeys.entity.tr()),
                buildOptionArrow(context, title: entity.name),
                const SizedBox(height: 7),
                const _Divider(),
                buildHeader(context, title: LocaleKeys.dashboard.tr()),
                const _Divider(),
                buildHeader(context, title: LocaleKeys.memberManagement.tr()),
                buildOption(context, title: LocaleKeys.createNew.tr()),
                buildOption(context, title: LocaleKeys.compartments.tr()),
                const SizedBox(height: 7),
                const _Divider(),
                buildHeader(context, title: LocaleKeys.audit_s.tr()),
                buildOption(context, title: LocaleKeys.createNew.tr()),
                const SizedBox(height: 7),
                const _Divider(),
                buildHeader(context, title: LocaleKeys.stakeholders.tr()),
                buildOption(context,
                    title: LocaleKeys.createNewStakeholder.tr()),
                const SizedBox(height: 7),
                const _Divider(),
                _CmoOptionTile(
                  title: LocaleKeys.settings.tr(),
                  onTap: () {},
                ),
                _CmoOptionTile(
                  title: LocaleKeys.support.tr(),
                  onTap: () => SupportScreen.push(context),
                ),
                _CmoOptionTile(
                  title: LocaleKeys.legal.tr(),
                  onTap: () => LegalScreen.push(context),
                ),
                const SizedBox(height: 55),
                CmoFilledButton(
                  title: LocaleKeys.signOut.tr(),
                  onTap: () {
                    Navigator.of(context).pop();
                    LoginScreen.push(context);
                  },
                ),
                const SizedBox(height: 24),
                Assets.images.logo.image(height: 47, fit: BoxFit.contain),
                const SizedBox(height: 12),
                buildVersionText(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildVersionText(BuildContext context) {
    final version = get<AppInfoService>().version;
    return Text(
      'V$version',
      style: context.textStyles.bodyNormal.white,
    );
  }

  Widget buildOptionArrow(BuildContext context, {required String title}) {
    return SizedBox(
      height: 34,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  title,
                  style: context.textStyles.bodyNormal.white,
                ),
              ),
            ),
            Assets.icons.icArrowRight.svgWhite,
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, {required String title}) {
    return SizedBox(
      height: 43,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            title,
            style: context.textStyles.bodyBold.white,
          ),
        ),
      ),
    );
  }

  Widget buildOption(BuildContext context, {required String title}) {
    return SizedBox(
      height: 34,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            title,
            style: context.textStyles.bodyNormal.white,
          ),
        ),
      ),
    );
  }

  Widget buildUserRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
      child: Row(
        children: [
          _UserAvatar(imageUrl: 'https://placekitten.com/200/200'),
          const SizedBox(width: 18),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Leon Chetty',
                    maxLines: 1,
                    style: context.textStyles.bodyBold.white,
                  ),
                  Text(
                    'leon@cmogroup.io',
                    style: context.textStyles.bodyBold.white,
                  ),
                ],
              ),
            ),
          ),
          CmoTappable(
            onTap: onTapClose,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Assets.icons.icClose.svg(),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.black),
        borderRadius: BorderRadius.circular(22.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.5),
          child: SizedBox.square(
            dimension: 45,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _CmoOptionTile extends StatelessWidget {
  const _CmoOptionTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 43,
            child: Row(
              children: [
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    title,
                    style: context.textStyles.bodyBold.white,
                  ),
                ),
                Assets.icons.icArrowRight.svgWhite,
                const SizedBox(width: 16),
              ],
            ),
          ),
          const _Divider(),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2,
      thickness: 2,
      indent: 3,
      endIndent: 3,
      color: context.colors.grey,
    );
  }
}
