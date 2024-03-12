import 'package:cmo/di.dart';
import 'package:cmo/enum/user_role_enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/state/stake_holder_list_cubit/stake_holder_detail_cubit.dart';
import 'package:cmo/state/stake_holder_list_cubit/stake_holder_list_cubit.dart';
import 'package:cmo/ui/components/bottom_sheet_multiple_selection.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/information_text_widget.dart';
import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StakeHolderDetailScreen extends BaseStatefulWidget {
  StakeHolderDetailScreen({
    super.key,
    this.isEditing = false,
  }) : super(
          screenName: isEditing
              ? LocaleKeys.local_neighbours_detail.tr()
              : LocaleKeys.add_local_neighbours_detail.tr(),
        );

  final bool isEditing;

  static void push(
    BuildContext context, {
    StakeHolder? stakeHolder,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (_) => StakeholderDetailCubit(stakeHolder: stakeHolder),
                child: StakeHolderDetailScreen(
                  isEditing: stakeHolder != null,
                ),
              ),
      ),
    );
  }

  @override
  State<StakeHolderDetailScreen> createState() =>
      _StakeHolderDetailScreenState();
}

class _StakeHolderDetailScreenState extends BaseStatefulWidgetState<StakeHolderDetailScreen> {
  bool loading = false;

  Future<void> onSubmit(BuildContext context) async {
    final cubit = context.read<StakeholderDetailCubit>();
      setState(() {
        loading = true;
      });
      try {
        FocusManager.instance.primaryFocus?.unfocus();
        await cubit.onSaveStakeholder(
          widget.isEditing,
          onCallback: (resultId) async {
            if (resultId != null) {
              if (context.mounted) {
                showSnackSuccess(
                  msg:
                      '${widget.isEditing ? LocaleKeys.edit_stakeholder.tr() : LocaleKeys.createNewStakeholder.tr()} $resultId',
                );

                await context.read<StakeHolderListCubit>().refresh();
                await context.read<DashboardCubit>().refresh();
                Navigator.of(context).pop();
              }
            }
          },
        );
      } finally {
        setState(() {
          loading = false;
        });
      }
  }

  @override
  bool get canPopWithoutWarningDialog => false;

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
        appBar: _buildCmoAppBar(context),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    CmoHeaderTile(
                      title: LocaleKeys.details.tr(),
                      backgroundColor: context.colors.blueDark2,
                    ),
                    _buildSelectWorkerWidget(),
                    BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
                      builder: (context, state) {
                        return AttributeItem(
                          isShowError: state.isEntityNameError,
                          isUnderErrorBorder: true,
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: InputAttributeItem(
                            initialValue: state.stakeHolder?.stakeholderName,
                            textStyle: context.textStyles.bodyNormal.blueDark3,
                            labelText: LocaleKeys.entityName.tr(),
                            labelTextStyle: context.textStyles.bodyBold.blueDark3,
                            onChanged: context.read<StakeholderDetailCubit>().onChangeStakeholderName,
                          ),
                        );
                      },
                    ),
                    BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
                      builder: (context, state) {
                        return AttributeItem(
                          isShowError: state.isContactNameError,
                          isUnderErrorBorder: true,
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: InputAttributeItem(
                            initialValue: state.stakeHolder?.contactName,
                            textStyle: context.textStyles.bodyNormal.blueDark3,
                            labelText: LocaleKeys.contactName.tr(),
                            labelTextStyle: context.textStyles.bodyBold.blueDark3,
                            onChanged: context.read<StakeholderDetailCubit>().onChangeContactName,
                          ),
                        );
                      },
                    ),
                    InformationText(),
                    CmoHeaderTile(
                      title: LocaleKeys.additional_details_optional.tr(),
                      backgroundColor: context.colors.blueDark2,
                    ),

                    BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
                      builder: (context, state) {
                        return AttributeItem(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          padding: const EdgeInsets.only(right: 12, top: 6, bottom: 6),
                          child: InputAttributeItem(
                            initialValue: state.stakeHolder?.email,
                            textStyle: context.textStyles.bodyNormal.blueDark3,
                            labelText: LocaleKeys.email.tr(),
                            keyboardType: TextInputType.emailAddress,
                            labelTextStyle: context.textStyles.bodyBold.blueDark3,
                            textCapitalization: TextCapitalization.none,
                            onChanged: context
                                .read<StakeholderDetailCubit>()
                                .onChangeEmail,
                            suffixIcon: CmoTappable(
                              onTap: () => CommonFunctions.sendEmail(state.stakeHolder?.email),
                              child: state.stakeHolder?.email != null && state.stakeHolder!.email.validEmail
                                  ? Assets.icons.icMail.svg(
                                      width: 24,
                                      height: 24,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        );
                      },
                    ),

                    BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
                      builder: (context, state) {
                        return AttributeItem(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: InputAttributeItem(
                            initialValue: state.stakeHolder?.address1,
                            textStyle: context.textStyles.bodyNormal.blueDark3,
                            labelText: LocaleKeys.address.tr(),
                            maxLines: 2,
                            labelTextStyle: context.textStyles.bodyBold.blueDark3,
                            keyboardType: TextInputType.multiline,
                            onChanged: context.read<StakeholderDetailCubit>().onChangeAddress,
                          ),
                        );
                      },
                    ),

                    BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
                      builder: (context, state) {
                        return AttributeItem(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              Expanded(
                                child: InputAttributeItem(
                                  initialValue: state.stakeHolder?.cell,
                                  textStyle: context.textStyles.bodyNormal.blueDark3,
                                  labelText: LocaleKeys.phoneNumber.tr(),
                                  labelTextStyle: context.textStyles.bodyBold.blueDark3,
                                  keyboardType: TextInputType.number,
                                  onChanged: context.read<StakeholderDetailCubit>().onChangePhoneNumber,
                                ),
                              ),
                              if (state.stakeHolder?.cell != null && state.stakeHolder!.cell.validPhoneNumber) ...[
                                CmoTappable(
                                  onTap: () => CommonFunctions.sendSms(state.stakeHolder?.cell),
                                  child: Assets.icons.icSms.svg(
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                const SizedBox(width: 32),
                                CmoTappable(
                                  onTap: () => CommonFunctions.makePhoneCall(state.stakeHolder?.cell),
                                  child: Assets.icons.icPhone.svg(
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ],
                              const SizedBox(width: 12),
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: _buildAdditionalInfo(),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
              child: CmoFilledButton(
                title: LocaleKeys.save.tr(),
                onTap: () async => onSubmit(context),
                loading: loading,
              ),
            ),
          ],
        ),
      );
  }

  PreferredSize _buildCmoAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90),
      child: FutureBuilder(
        future: configService.getActiveUserRole(),
        builder: (context, value) {
          if (value.data == UserRoleEnum.farmerMember) {
            return PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: FutureBuilder(
                future: configService.getActiveFarm(),
                builder: (context, snapshot) {
                  return CmoAppBar(
                    title: widget.isEditing
                        ? LocaleKeys.local_neighbours_detail.tr()
                        : LocaleKeys.add_local_neighbours_detail.tr(),
                    subtitle: snapshot.data?.farmName ?? '',
                    leading: Assets.icons.icBackButton.svgBlack,
                    onTapLeading: onShowWarningDispose,
                  );
                },
              ),
            );
          }

          return CmoAppBar(
            title: widget.isEditing
                ? LocaleKeys.edit_stakeholder.tr()
                : LocaleKeys.add_stakeholder.tr(),
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: onShowWarningDispose,
          );
        },
      ),
    );
  }

  Widget _buildSelectWorkerWidget() {
    return BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
      builder: (context, state) {
        final initStakeholderType = state.listStakeholderTypes.firstWhereOrNull(
            (e) => e.stakeHolderTypeId == state.stakeHolder?.stakeholderTypeId);
        return BottomSheetSelection(
          hintText: LocaleKeys.type.tr(),
          isShowError: state.isSelectTypeError,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: initStakeholderType?.stakeHolderTypeName,
          displayHorizontal: false,
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.listStakeholderTypes.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.listStakeholderTypes!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      context
                          .read<StakeholderDetailCubit>()
                          .onSelectStakeholder(state
                              .listStakeholderTypes![index].stakeHolderTypeId);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.listStakeholderTypes![index]
                                .stakeHolderTypeName ??
                            '',
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSelectSocialUpliftments() {
    return BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.listSocialUpliftments.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                child: BottomSheetMultipleSelection<SocialUpliftment>(
                  alwaysShowSearchField: false,
                  listItems: state.listSocialUpliftments
                      .map(
                        (e) => BottomSheetMultipleSelectionItem(
                          item: e,
                          id: e.socialUpliftmentId,
                          titleValue: e.socialUpliftmentName,
                        ),
                      )
                      .toList(),
                  selectedItems: state.selectedSocialUpliftments
                      .map(
                        (e) => BottomSheetMultipleSelectionItem(
                          item: e,
                          id: e.socialUpliftmentId,
                          titleValue: e.socialUpliftmentName,
                        ),
                      )
                      .toList(),
                  onSave: context
                      .read<StakeholderDetailCubit>()
                      .onChangeSocialUpliftment,
                ),
              ),
            );
          },
          child: AttributeItem(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      LocaleKeys.social_upliftments.tr(),
                      style: context.textStyles.bodyBold.blueDark2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    state.selectedSocialUpliftments.length.toString(),
                    style: context.textStyles.bodyBold.blueDark2,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Assets.icons.icArrowRight.svgBlack,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectSpecialSites() {
    return BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.listSpecialSites.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                child: BottomSheetMultipleSelection<SpecialSite>(
                  alwaysShowSearchField: false,
                  listItems: state.listSpecialSites
                      .map(
                        (e) => BottomSheetMultipleSelectionItem(
                          item: e,
                          id: e.specialSiteId,
                          titleValue: e.specialSiteName,
                        ),
                      )
                      .toList(),
                  selectedItems: state.selectedSpecialSites
                      .map(
                        (e) => BottomSheetMultipleSelectionItem(
                          item: e,
                          id: e.specialSiteId,
                          titleValue: e.specialSiteName,
                        ),
                      )
                      .toList(),
                  onSave: context
                      .read<StakeholderDetailCubit>()
                      .onChangeSpecialSite,
                ),
              ),
            );
          },
          child: AttributeItem(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      LocaleKeys.special_sites.tr(),
                      style: context.textStyles.bodyBold.blueDark2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    state.selectedSpecialSites.length.toString(),
                    style: context.textStyles.bodyBold.blueDark2,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Assets.icons.icArrowRight.svgBlack,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectCustomaryUseRights() {
    return BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.listCustomaryUseRights.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                child: BottomSheetMultipleSelection<CustomaryUseRight>(
                  alwaysShowSearchField: false,
                  listItems: state.listCustomaryUseRights
                      .map(
                        (e) => BottomSheetMultipleSelectionItem(
                          item: e,
                          id: e.customaryUseRightId,
                          titleValue: e.customaryUseRightName,
                        ),
                      )
                      .toList(),
                  selectedItems: state.selectedCustomaryUseRights
                      .map(
                        (e) => BottomSheetMultipleSelectionItem(
                          item: e,
                          id: e.customaryUseRightId,
                          titleValue: e.customaryUseRightName,
                        ),
                      )
                      .toList(),
                  onSave: context
                      .read<StakeholderDetailCubit>()
                      .onChangeCustomaryUseRight,
                ),
              ),
            );
          },
          child: AttributeItem(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      LocaleKeys.customary_use_rights.tr(),
                      style: context.textStyles.bodyBold.blueDark2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    state.selectedCustomaryUseRights.length.toString(),
                    style: context.textStyles.bodyBold.blueDark2,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Assets.icons.icArrowRight.svgBlack,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAdditionalInfo() {
    return BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
      builder: (context, state) {
        if (state.currentUserRole == UserRoleEnum.regionalManager) {
          return const SizedBox.shrink();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSelectSocialUpliftments(),
            _buildSelectSpecialSites(),
            _buildSelectCustomaryUseRights(),
          ],
        );
      },
    );
  }
}
