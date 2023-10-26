import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/ui/components/select_site_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_sign_contract_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_collapse_title_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/farm_member_objectives_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/farm_member_risk_assessments_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/slimf_and_mpo_section.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key, this.farm});

  final Farm? farm;

  static Future<bool?> push(BuildContext context, {Farm? farm}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddMemberScreen(farm: farm),
      ),
    );
  }

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  late final AddMemberCubit cubit;
  late final DashboardCubit dashboardCubit;

  final onScrollDownButtonValue = ValueNotifier(true);

  late final ScrollController _scrollController;

  @override
  void dispose() {
    cubit.stepCount();
    dashboardCubit.getResourceManagerMembers();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        onScrollDownButtonValue.value = !(_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent);
      });
    dashboardCubit = context.read<DashboardCubit>();
    Future.microtask(() async {
      await context.read<AddMemberCubit>().initAddMember(farm: widget.farm);
      cubit = context.read<AddMemberCubit>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: widget.farm == null ? LocaleKeys.addMember.tr() : LocaleKeys.member_detail.tr(),
        showTrailing: true,
        onTapTrailing: () {
          Navigator.pop(context, true);
        },
      ),
      body: BlocSelector<AddMemberCubit, AddMemberState, bool>(
        selector: (state) => state.isLoading,
        builder: (context, bool isLoading) {
          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.colors.blueDark2,
              ),
            );
          }
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 8),
                const SlimfAndMpoSection(),
                const SizedBox(height: 12),
                const _AddMemberMDetails(),
                const SizedBox(height: 12),
                const _AddMemberSDetails(),
                const SizedBox(height: 12),
                const FarmMemberRiskAssessmentsWidget(),
                const SizedBox(height: 12),
                const FarmMemberObjectivesWidget(),
                const SizedBox(height: 12),
                AddMemberSignContractWidget(
                  shouldScrollBottom: _handleScrollBottom,
                  farm: widget.farm,
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
      floatingActionButton:
          BlocSelector<AddMemberCubit, AddMemberState, AddMemberSAF>(
        selector: (state) {
          return state.addMemberSAF;
        },
        builder: (context, addMemberSAF) {
          return Visibility(
            visible: addMemberSAF.isExpanded,
            child: ValueListenableBuilder(
              valueListenable: onScrollDownButtonValue,
              builder: (context, data, __) {
                return _bindScrollDownButton(data);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _bindScrollDownButton(bool shouldShowDown) {
    if (shouldShowDown) {
      return CupertinoButton(
        onPressed: () {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        },
        child: Icon(
          CupertinoIcons.arrow_down_circle_fill,
          size: 40,
          color: context.colors.blueDark1,
        ),
      );
    } else {
      return CupertinoButton(
        onPressed: () {
          _scrollController.jumpTo(0);
        },
        child: Icon(
          CupertinoIcons.arrow_up_circle_fill,
          size: 40,
          color: context.colors.blueDark1,
        ),
      );
    }
  }

  Future<void> _handleScrollBottom(bool isExpanded, bool isCompleted) async {
    cubit.onExpandedSAF(!isExpanded);
    if (isExpanded) return;

    await Future.delayed(const Duration(milliseconds: 500), () {});

    if (isCompleted) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}

class _AddMemberSDetails extends StatelessWidget {
  const _AddMemberSDetails();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberSDetails>(
      selector: (state) => state.addMemberSDetails,
      builder: (context, AddMemberSDetails data) {
        final cubit = context.read<AddMemberCubit>();
        return CmoCollapseTitle(
          key: data.sectionKey,
          initiallyExpanded: !data.isSectionCollapse,
          title: LocaleKeys.site_details.tr(),
          showTick: data.isComplete,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            color: context.colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AttributeItem(
                  isShowError: data.isSiteNameError,
                  errorText: LocaleKeys.siteName.tr(),
                  child: InputAttributeItem(
                    initialValue: data.siteName,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.siteName.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onDataChangeSiteDetail(siteName: value);
                    },
                    onSubmitted: (_) {
                      if (data.isComplete) {
                        cubit.onChangeSiteDetailState(isCollapse: true);
                        cubit.onChangeMemberRiskAssessmentState(isCollapse: false);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isTownError,
                  errorText: LocaleKeys.town.tr(),
                  child: InputAttributeItem(
                    initialValue: data.town,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.town.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onDataChangeSiteDetail(town: value);
                    },
                    onSubmitted: (_) {
                      if (data.isComplete) {
                        cubit.onChangeSiteDetailState(isCollapse: true);
                        cubit.onChangeMemberRiskAssessmentState(isCollapse: false);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isProvinceError,
                  errorText: LocaleKeys.province.tr(),
                  child: InputAttributeItem(
                    initialValue: data.province,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.province.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onDataChangeSiteDetail(province: value);
                    },
                    onSubmitted: (_) {
                      if (data.isComplete) {
                        cubit.onChangeSiteDetailState(isCollapse: true);
                        cubit.onChangeMemberRiskAssessmentState(isCollapse: false);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                AttributeItem(
                  child: CmoDropDownLayoutWidget(
                    onTap: () async {
                      final siteLocationScreenResult =
                          await SelectSiteLocationScreen.push<
                              SiteLocationScreenResult>(
                        context,
                        showMarker: true,
                        showResetAcceptIcons: true,
                        initAddress: data.addMemberSiteLocations.address ??
                            data.initAddressForSiteLocation(),
                        latLng: data.addMemberSiteLocations.lat != null &&
                                data.addMemberSiteLocations.lng != null
                            ? LatLng(data.addMemberSiteLocations.lat!,
                                data.addMemberSiteLocations.lng!)
                            : null,
                      );

                      if (siteLocationScreenResult
                          is SiteLocationScreenResult) {
                        final latLong = siteLocationScreenResult.latLong;
                        if (latLong?.latitude == null ||
                            latLong?.longitude == null) {
                          return;
                        }

                        final address =
                            '${siteLocationScreenResult.address}\n${latLong?.latitude.toStringAsFixed(6)}, ${latLong?.longitude.toStringAsFixed(6)}';

                        await cubit.onDataChangeSiteDetail(
                          siteLocationLat:
                              siteLocationScreenResult.latLong?.latitude,
                          siteLocationLng:
                              siteLocationScreenResult.latLong?.longitude,
                          siteLocationAddress: address,
                        );

                        if (context.read<AddMemberCubit>().state.addMemberSDetails.isComplete) {
                          cubit.onChangeSiteDetailState(isCollapse: true);
                          cubit.onChangeMemberRiskAssessmentState(isCollapse: false);
                        }
                      }
                    },
                    title: LocaleKeys.siteLocation.tr(),
                    showTick: data.isCompleteSiteLocation,
                    isHideBorder: true,
                  ),
                ),
                const SizedBox(height: 16),
                AttributeItem(
                  child: BlocSelector<AddMemberCubit, AddMemberState, double?>(
                    selector: (state) => state
                        .addMemberSDetails.addMemberCompartmentsState.farmSize,
                    builder: (context, farmSize) {
                      final farmSizeTitle = farmSize == null
                          ? null
                          : '${farmSize.toStringAsFixed(2)}${LocaleKeys.ha_unit.tr()}';
                      return CmoDropDownLayoutWidget(
                        title: LocaleKeys.compartment_s.tr(),
                        showTick: data.haveCompartments,
                        subTitle: farmSizeTitle,
                        subTitleAlignment: Alignment.center,
                        subTitleTextStyle:
                            context.textStyles.titleBold.copyWith(fontSize: 16),
                        isHideBorder: true,
                        onTap: () async {
                          final state = context.read<AddMemberCubit>().state;
                          final farmName = state.farm?.farmName;
                          final farmId = state.farm?.farmId;
                          final result = await CompartmentScreen.push(
                            context,
                            farmId: farmId,
                            farmName: farmName,
                          );

                          if (result != null) {
                            await cubit.onDataChangeSiteDetail(
                              addingCompartmentResult: result,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                AttributeItem(
                  child: CmoDropDownLayoutWidget(
                    onTap: () async {
                      final state = context.read<AddMemberCubit>().state;
                      final farmName = state.farm?.farmName;
                      final farmId = state.farm?.farmId;
                      final result = await ASIScreen.push(context,
                          farmId: farmId, farmName: farmName);

                      await cubit.onDataChangeSiteDetail(asis: result);
                    },
                    title: LocaleKeys.asi.tr(),
                    showTick: data.isCompleteASI,
                    isHideBorder: true,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AddMemberMDetails extends StatelessWidget {
  const _AddMemberMDetails();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberMDetails>(
      selector: (state) => state.addMemberMDetails,
      builder: (context, AddMemberMDetails data) {
        final cubit = context.read<AddMemberCubit>();
        return CmoCollapseTitle(
          key: data.sectionKey,
          initiallyExpanded: !data.isSectionCollapse,
          title: LocaleKeys.memberDetails.tr(),
          showTick: data.isComplete,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AttributeItem(
                  isShowError: data.isFirstNameError,
                  errorText: LocaleKeys.firstName.tr(),
                  child: InputAttributeItem(
                    initialValue: data.firstName,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.firstName.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onSubmitted: (p0) {
                      if (data.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(firstName: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isLastNameError,
                  errorText: LocaleKeys.lastName.tr(),
                  child: InputAttributeItem(
                    initialValue: data.lastName,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.lastName.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onSubmitted: (p0) {
                      if (data.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(lastName: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isIdNumberError,
                  errorText: LocaleKeys.idPassportNumber.tr(),
                  child: InputAttributeItem(
                    initialValue: data.idNumber,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.idPassportNumber.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (p0) {
                      if (data.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(idNumber: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isMobileNumberError,
                  errorText: LocaleKeys.mobileNumber.tr(),
                  child: InputAttributeItem(
                    initialValue: data.mobileNumber,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.mobileNumber.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    keyboardType: TextInputType.phone,
                    onSubmitted: (p0) {
                      if (data.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(mobileNumber: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  errorText: 'Please enter a valid email format',
                  isShowError: data.isEmailError,
                  child: InputAttributeItem(
                    initialValue: data.emailAddress,
                    textStyle: context.textStyles.bodyNormal.black,
                    labelText:
                        '${LocaleKeys.emailAddress.tr()} (${LocaleKeys.optional.tr()})',
                    labelTextStyle: context.textStyles.bodyNormal.blueDark2,
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (text) {
                      if (data.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(emailAddress: value);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
