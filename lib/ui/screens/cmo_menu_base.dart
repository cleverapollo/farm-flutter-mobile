import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_add_screen.dart';
import 'package:cmo/ui/screens/behave/create_worker/worker_add_screen.dart';
import 'package:cmo/ui/screens/global_entity.dart';
import 'package:cmo/ui/screens/onboarding/login/login_screen.dart';
import 'package:cmo/ui/screens/perform/compartments/compartment_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_production_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/labour_detail/labour_detail_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/my_group_scheme/my_group_scheme_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/register_management.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/add_member_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/add_audit/audit_add_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/member_management_screen.dart';
import 'package:cmo/ui/screens/perform/stake_holder/create_new_stake_holder/stake_holder_detail_screen.dart';
import 'package:cmo/ui/screens/perform/stake_holder/stake_holder_management_screen.dart';
import 'package:cmo/ui/screens/setting/legal/legal_screen.dart';
import 'package:cmo/ui/screens/setting/settings_screen.dart';
import 'package:cmo/ui/screens/setting/support/support_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/screens/perform/farmer_member/annual_production/annual_budget/annual_budget_management_screen.dart';

import 'package:cmo/ui/screens/perform/farmer_member/labour_management/labour_management_screen.dart';

class CmoMenuBase extends StatefulWidget {
  factory CmoMenuBase.behave({required VoidCallback onTapClose}) {
    return CmoMenuBase._(
      onTapClose: onTapClose,
      userRole: UserRoleEnum.behave,
    );
  }

  factory CmoMenuBase.resourceManager({required VoidCallback onTapClose}) {
    return CmoMenuBase._(
      onTapClose: onTapClose,
      userRole: UserRoleEnum.regionalManager,
    );
  }

  factory CmoMenuBase.farmerMember({required VoidCallback onTapClose}) {
    return CmoMenuBase._(
      onTapClose: onTapClose,
      userRole: UserRoleEnum.farmerMember,
    );
  }

  const CmoMenuBase._({required this.onTapClose, required this.userRole});

  final UserRoleEnum userRole;
  final VoidCallback onTapClose;

  @override
  State<CmoMenuBase> createState() => _CmoMenuBaseState();
}

class _CmoMenuBaseState extends State<CmoMenuBase> {
  Widget _menuContent = const SizedBox.shrink();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    switch (widget.userRole) {
      case UserRoleEnum.behave:
        _menuContent = _buildBehaveContentMenu();
        break;
      case UserRoleEnum.regionalManager:
        _menuContent = _buildResourceManagerMenu();
        break;
      case UserRoleEnum.farmerMember:
        _menuContent = _buildFarmerMemberMenu();
        break;
    }
  }

  Widget _buildFarmerMemberMenu() {
    return Column(
      children: [
        _CmoOptionTile(
          title: LocaleKeys.my_groupscheme.tr(),
          displayDivider: false,
          onTap: () {
            if (context.mounted) Navigator.of(context).pop();
            MyGroupSchemeScreen.push(context);
          },
        ),
        const SizedBox(height: 7),
        const _Divider(),
        SiteManagementPlanSection(),
        const SizedBox(height: 7),
        const _Divider(),
        _HeaderItem(
          title: LocaleKeys.labourManagement.tr(),
          onTap: () {
            if (context.mounted) Navigator.of(context).pop();
            LabourManagementScreen.push(context);
          },
        ),
        _OptionItem(
          title: LocaleKeys.addLabour.tr(),
          onTap: () async {
            await LabourDetailScreen.push(
              context,
            );
            await context.read<DashboardCubit>().refresh();
          },
        ),
        const SizedBox(height: 7),
        const _Divider(),
        _HeaderItem(
          title: LocaleKeys.monitoring.tr(),
          onTap: () {
            if (context.mounted) Navigator.of(context).pop();
            RegisterManagement.push(context);
          },
        ),
        const _Divider(),
        _HeaderItem(
          title: LocaleKeys.neighbours.tr(),
          onTap: () {
            if (context.mounted) Navigator.of(context).pop();
            StakeHolderManagementScreen.push(context);
          },
        ),
        _OptionItem(
          title: LocaleKeys.add_local_neighbours_detail.tr(),
          onTap: () async {
            StakeHolderDetailScreen.push(context);
            await context.read<DashboardCubit>().refresh();
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }

  Widget _buildResourceManagerMenu() {
    return Column(
      children: [
        _CmoOptionTile(
          title: LocaleKeys.my_groupscheme.tr(),
          displayDivider: false,
          onTap: () {
            if (context.mounted) Navigator.of(context).pop();
            MyGroupSchemeScreen.push(context);
          },
        ),
        const SizedBox(height: 7),
        const _Divider(),
        _HeaderItem(
          title: LocaleKeys.memberManagement.tr(),
          onTap: () => MemberManagementScreen.push(context),
        ),
        _OptionItem(
          title: LocaleKeys.createNew.tr(),
          onTap: () async {
            await AddMemberScreen.push(context);
            await context.read<DashboardCubit>().getResourceManagerMembers();
          },
        ),
        const SizedBox(height: 7),
        const _Divider(),
        _HeaderItem(title: LocaleKeys.audit_s.tr()),
        _OptionItem(
          title: LocaleKeys.createNew.tr(),
          onTap: () {
            if (context.mounted) Navigator.of(context).pop();
            AuditAddScreen.push(
              context,
              AuditComeFromEnum.menu,
            );
          },
        ),
        const SizedBox(height: 7),
        const _Divider(),
        _HeaderItem(title: LocaleKeys.stakeholders.tr()),
        _OptionItem(
          title: LocaleKeys.createNewStakeholder.tr(),
          onTap: () async {
            StakeHolderDetailScreen.push(context);
            await context.read<DashboardCubit>().refresh();
          },
        ),
      ],
    );
  }

  Widget _buildBehaveContentMenu() {
    return Column(
      children: [
        _HeaderItem(title: LocaleKeys.dashboard.tr()),
        const _Divider(),
        _HeaderItem(title: LocaleKeys.assessments.tr()),
        _OptionItem(
          title: LocaleKeys.createNew.tr(),
          onTap: () => AssessmentAddScreen.push(context),
        ),
        const SizedBox(height: 7),
        const _Divider(),
        _HeaderItem(title: LocaleKeys.workers.tr()),
        _OptionItem(
          title: LocaleKeys.createNew.tr(),
          onTap: () => WorkerAddScreen.push(context),
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
                _UserRowInformation(onTapClose: widget.onTapClose),
                _HeaderItem(title: LocaleKeys.entity.tr()),
                EntityInformation(widget.userRole),
                const _Divider(),
                const SizedBox(height: 7),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        LocaleKeys.dashboard.tr(),
                        textAlign: TextAlign.start,
                        style: context.textStyles.bodyBold.white,
                      ),
                    ),
                  ),
                ),
                const _Divider(),
                const SizedBox(height: 7),
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
                const LogoutButton(),
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
}

class _HeaderItem extends StatelessWidget {
  _HeaderItem({required this.title, this.onTap,});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
      ),
    );
  }
}

class _OptionItem extends StatelessWidget {
  _OptionItem({required this.title, required this.onTap,});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
}

class SiteManagementPlanSection extends StatefulWidget {

  SiteManagementPlanSection();

  @override
  State<StatefulWidget> createState() => _SiteManagementPlanSectionState();
}

class _SiteManagementPlanSectionState extends State<SiteManagementPlanSection> {

  CharcoalPlantationRoleEnum? charcoalPlantationRoleEnum;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final userInfo = await configService.getActiveUser();
      final getCharcoalPlantationRole = userInfo?.getCharcoalPlantationRole;
      charcoalPlantationRoleEnum = getCharcoalPlantationRole;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HeaderItem(title: LocaleKeys.siteManagementPlan.tr()),
        campCompartmentItem(),
        if (charcoalPlantationRoleEnum == CharcoalPlantationRoleEnum.isCharcoal) ...[
          _OptionItem(
            title: LocaleKeys.annualProduction.tr(),
            onTap: () {
              if (context.mounted) Navigator.of(context).pop();
              AnnualProductionManagementScreen.push(context);
            },
          ),
          _OptionItem(
            title: LocaleKeys.annualBudgets.tr(),
            onTap: () {
              if (context.mounted) Navigator.of(context).pop();
              AnnualBudgetManagementScreen.push(context);
            },
          ),
        ],
      ],
    );
  }

  Widget campCompartmentItem() {
    return _OptionItem(
      title: LocaleKeys.camp_compartment_management.tr(),
      onTap: () {
        if (charcoalPlantationRoleEnum == null) return;
        switch (charcoalPlantationRoleEnum) {
          case CharcoalPlantationRoleEnum.isCharcoal:
            // CampManagementScreen.push(context);
            break;
          case CharcoalPlantationRoleEnum.isPlantation:
            CompartmentScreen.push(context);
            break;
          default:
            break;
        }
      },
    );
  }
}

class EntityInformation extends StatefulWidget {

  final UserRoleEnum userRole;

  EntityInformation(this.userRole);

  @override
  State<StatefulWidget> createState() => _EntityInformationState();
}

class _EntityInformationState extends State<EntityInformation> {

  String? entityName;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      switch (widget.userRole) {
        case UserRoleEnum.behave:
          final company = await configService.getActiveCompany();
          entityName = company?.companyName;
          break;
        case UserRoleEnum.regionalManager:
          final resourceManager = await configService.getActiveRegionalManager();
          entityName = resourceManager?.regionalManagerUnitName;
          break;
        case UserRoleEnum.farmerMember:
          final farm = await configService.getActiveFarm();
          entityName = farm?.farmName;
          break;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: () {
        GlobalEntityScreen.push(
          context,
          canNavigateBack: true,
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
                  child: Text(
                    entityName ?? '--',
                    style: context.textStyles.bodyNormal.white,
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
}

class _UserRowInformation extends StatefulWidget {
  const _UserRowInformation({
    required this.onTapClose,
  });

  final VoidCallback onTapClose;

  @override
  State<StatefulWidget> createState() => _UserRowInformationState();
}

class _UserRowInformationState extends State<_UserRowInformation> {

  UserInfo? userInfo;
  String? avatarUrl;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      userInfo = await configService.getActiveUser();
      avatarUrl = await userInfo?.avatarUrl;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final fullname = userInfo?.fullName ?? '';
    final email = userInfo?.userEmail ?? '';
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
      child: Row(
        children: [
          _UserAvatar(imageUrl: avatarUrl),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.bodyBold.white,
                ),
                Text(
                  email,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.bodyBold.white,
                )
              ],
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
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isBlank) return const SizedBox.shrink();
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
              imageUrl: imageUrl!,
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
    this.displayDivider = true,
  });

  final String title;

  final VoidCallback onTap;

  final bool displayDivider;

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
          if (displayDivider)
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

class LogoutButton extends StatefulWidget {
  const LogoutButton();

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
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
          if (context.mounted) {
            navigationBreadcrumbs.logout();
            await context.read<AuthCubit>().logOut();
            await context.read<EntityCubit>().clear();
            await context.read<UserDeviceCubit>().clear();
            await context.read<UserInfoCubit>().clear();
            await configService.logout();
          }

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
