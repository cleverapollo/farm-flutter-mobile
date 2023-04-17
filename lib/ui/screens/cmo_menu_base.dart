import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/components/entity_component/utils.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_add_screen.dart';
import 'package:cmo/ui/screens/behave/create_worker/worker_add_screen.dart';
import 'package:cmo/ui/screens/onboarding/login/login_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_screen.dart';
import 'package:cmo/ui/screens/setting/legal/legal_screen.dart';
import 'package:cmo/ui/screens/setting/settings_screen.dart';
import 'package:cmo/ui/screens/setting/support/support_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum UserRole { behave, resourceManager, farmerMember }

class CmoMenuBase extends StatefulWidget {
  factory CmoMenuBase.behave({required VoidCallback onTapClose}) {
    return CmoMenuBase._(onTapClose: onTapClose, userRole: UserRole.behave);
  }
  factory CmoMenuBase.resourceManager({required VoidCallback onTapClose}) {
    return CmoMenuBase._(
        onTapClose: onTapClose, userRole: UserRole.resourceManager);
  }
  factory CmoMenuBase.farmerMember({required VoidCallback onTapClose}) {
    return CmoMenuBase._(
        onTapClose: onTapClose, userRole: UserRole.farmerMember);
  }
  const CmoMenuBase._({required this.onTapClose, required this.userRole});

  final UserRole userRole;
  final VoidCallback onTapClose;

  @override
  State<CmoMenuBase> createState() => _CmoMenuBaseState();
}

class _CmoMenuBaseState extends State<CmoMenuBase> {
  late final Widget _menuContent;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    switch (widget.userRole) {
      case UserRole.behave:
        _menuContent = _buildBehaveContentMenu();
        break;
      case UserRole.resourceManager:
        _menuContent = _buildResourceManagerMenu();
        break;
      case UserRole.farmerMember:
        _menuContent = _buildFarmerMemberMenu();
        break;
    }
  }

  Widget _buildFarmerMemberMenu() {
    return Column(
      children: [
        buildHeader(context, title: LocaleKeys.managementPlan.tr()),
        buildOption(
          context,
          title: LocaleKeys.labourManagement.tr(),
        ),
        buildOption(context, title: LocaleKeys.campManagement.tr()),
        buildOption(
          context,
          title: LocaleKeys.annualProduction.tr(),
        ),
        buildHeader(context, title: LocaleKeys.compartments.tr()),
        const SizedBox(height: 7),
        const _Divider(),
        buildHeader(context, title: LocaleKeys.stakeholders.tr()),
        buildOption(
          context,
          title: LocaleKeys.createNewStakeholder.tr(),
        ),
      ],
    );
  }

  Widget _buildResourceManagerMenu() {
    return Column(
      children: [
        buildHeader(
          context,
          title: LocaleKeys.memberManagement.tr(),
        ),
        buildOption(context, title: LocaleKeys.createNew.tr(), onTap: () {
          AddMemberScreen.push(context);
        }),
        buildOption(context, title: LocaleKeys.compartments.tr()),
        const SizedBox(height: 7),
        const _Divider(),
        buildHeader(context, title: LocaleKeys.audit_s.tr()),
        buildOption(context, title: LocaleKeys.createNew.tr()),
        const SizedBox(height: 7),
        const _Divider(),
        buildHeader(context, title: LocaleKeys.stakeholders.tr()),
        buildOption(
          context,
          title: LocaleKeys.createNewStakeholder.tr(),
        ),
      ],
    );
  }

  Widget _buildBehaveContentMenu() {
    return Column(
      children: [
        buildHeader(context, title: LocaleKeys.dashboard.tr()),
        const _Divider(),
        buildHeader(context, title: LocaleKeys.assessments.tr()),
        CmoTappable(
          onTap: () => AssessmentAddScreen.push(context),
          child: buildOption(
            context,
            title: LocaleKeys.createNew.tr(),
          ),
        ),
        const SizedBox(height: 7),
        const _Divider(),
        buildHeader(context, title: LocaleKeys.workers.tr()),
        CmoTappable(
          onTap: () => WorkerAddScreen.push(context),
          child: buildOption(
            context,
            title: LocaleKeys.createNew.tr(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: context.colors.grey),
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
                buildEntity(context),
                const SizedBox(height: 7),
                const _Divider(),
                _menuContent,
                const SizedBox(height: 7),
                const _Divider(),
                _CmoOptionTile(
                  title: LocaleKeys.settings.tr(),
                  onTap: () => SettingsScreen.push(context),
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
                const _LogoutButton(),
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
    final version = appInfoService.version;
    return Text(
      'V$version',
      style: context.textStyles.bodyNormal.white,
    );
  }

  Widget buildEntity(BuildContext context) {
    return CmoTappable(
      onTap: () {
        final screen = entityScreenByType();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => screen,
          ),
        );
      },
      child: SizedBox(
        height: 34,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: BlocSelector<EntityCubit, EntityState, String?>(
                    selector: (state) => state.entity?.name,
                    builder: (context, name) {
                      return Text(
                        name ?? '--',
                        style: context.textStyles.bodyNormal.white,
                      );
                    },
                  ),
                ),
              ),
              Assets.icons.icArrowRight.svgWhite,
              const SizedBox(width: 16),
            ],
          ),
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

  Widget buildOption(BuildContext context,
      {required String title, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: SizedBox(
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
      ),
    );
  }

  Widget buildUserRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
      child: Row(
        children: [
          const _UserAvatar(imageUrl: 'https://placekitten.com/200/200'),
          const SizedBox(width: 8),
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
                  )
                ],
              ),
            ),
          ),
          CmoTappable(
            onTap: widget.onTapClose,
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
  const _Divider();

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

class _LogoutButton extends StatefulWidget {
  const _LogoutButton();

  @override
  State<_LogoutButton> createState() => __LogoutButtonState();
}

class __LogoutButtonState extends State<_LogoutButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return CmoFilledButton(
      loading: loading,
      title: LocaleKeys.signOut.tr(),
      onTap: () async {
        if (loading) return;
        try {
          setState(() {
            loading = true;
          });
          await cmoDatabaseService.deleteAll();
          if (context.mounted) await context.read<AuthCubit>().logOut();
          if (context.mounted) {
            await Future.wait([
              context.read<EntityCubit>().clear(),
              context.read<UserDeviceCubit>().clear(),
              context.read<UserInfoCubit>().clear(),
            ]);
          }
          if (context.mounted) Navigator.of(context).pop();
          if (context.mounted) LoginScreen.push(context);
        } finally {
          setState(() {
            loading = false;
          });
        }
      },
    );
  }
}
