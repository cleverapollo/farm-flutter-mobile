import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/select_site_location_screen.dart';
import 'package:cmo/ui/screens/perform/asi/asi_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../compartments/compartment_screen.dart';
import 'cmo_collapse_title_widget.dart';
import 'cmo_drop_down_layout_widget.dart';

class MemberSiteDetailSection extends StatefulWidget {
  const MemberSiteDetailSection({super.key});

  @override
  State<StatefulWidget> createState() => _MemberSiteDetailSectionState();
}

class _MemberSiteDetailSectionState extends State<MemberSiteDetailSection> {
  final townTextController = TextEditingController();
  final provinceTextController = TextEditingController();
  late MemberDetailCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<MemberDetailCubit>();
    townTextController.text = cubit.state.memberSiteDetailsState.town ?? '';
    provinceTextController.text = cubit.state.memberSiteDetailsState.province ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MemberDetailCubit, MemberDetailState, MemberSiteDetailsState>(
      selector: (state) => state.memberSiteDetailsState,
      builder: (context, memberSiteDetailsState) {
        return CmoCollapseTitle(
          key: memberSiteDetailsState.sectionKey,
          initiallyExpanded: !memberSiteDetailsState.isSectionCollapse,
          title: LocaleKeys.site_details.tr(),
          showTick: memberSiteDetailsState.isComplete,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            color: context.colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AttributeItem(
                  isShowError: memberSiteDetailsState.isSiteNameError,
                  errorText: LocaleKeys.siteName.tr(),
                  child: InputAttributeItem(
                    initialValue: memberSiteDetailsState.siteName,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.siteName.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onChangeMemberSiteDetailSection(siteName: value);
                    },
                    onSubmitted: (_) {
                      if (memberSiteDetailsState.isComplete) {
                        cubit.onChangeSiteDetailState(isCollapse: true);
                        cubit.onChangeMemberRiskAssessmentState(
                            isCollapse: false);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: memberSiteDetailsState.isTownError,
                  errorText: LocaleKeys.town.tr(),
                  child: InputAttributeItem(
                    controller: townTextController,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.town.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onChangeMemberSiteDetailSection(town: value);
                    },
                    onSubmitted: (_) {
                      if (memberSiteDetailsState.isComplete) {
                        cubit.onChangeSiteDetailState(isCollapse: true);
                        cubit.onChangeMemberRiskAssessmentState(
                            isCollapse: false);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: memberSiteDetailsState.isProvinceError,
                  errorText: LocaleKeys.province.tr(),
                  child: InputAttributeItem(
                    controller: provinceTextController,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.province.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onChangeMemberSiteDetailSection(province: value);
                    },
                    onSubmitted: (_) {
                      if (memberSiteDetailsState.isComplete) {
                        cubit.onChangeSiteDetailState(isCollapse: true);
                        cubit.onChangeMemberRiskAssessmentState(
                            isCollapse: false);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                AttributeItem(
                  child: CmoDropDownLayoutWidget(
                    onTap: () async {
                      final siteLocationScreenResult = await SelectSiteLocationScreen.push<SiteLocationScreenResult>(
                        context,
                        showMarker: true,
                        showResetAcceptIcons: true,
                        initAddress: memberSiteDetailsState.initAddressForSiteLocation(),
                        latLng: memberSiteDetailsState.lat != null && memberSiteDetailsState.lng != null
                            ? LatLng(memberSiteDetailsState.lat!, memberSiteDetailsState.lng!)
                            : null,
                      );

                      if (siteLocationScreenResult is SiteLocationScreenResult) {
                        final latLong = siteLocationScreenResult.latLong;
                        if (latLong?.latitude == null ||
                            latLong?.longitude == null) {
                          return;
                        }

                        final address = '${siteLocationScreenResult.address}\n${latLong?.latitude.toStringAsFixed(6)}, ${latLong?.longitude.toStringAsFixed(6)}';

                        await cubit.onChangeMemberSiteDetailSection(
                          siteLocationLat: siteLocationScreenResult.latLong?.latitude,
                          siteLocationLng: siteLocationScreenResult.latLong?.longitude,
                          siteLocationAddress: address,
                          province: siteLocationScreenResult.placeMark?.administrativeArea,
                          town: siteLocationScreenResult.placeMark?.subAdministrativeArea,
                        );

                        townTextController.text = siteLocationScreenResult.placeMark?.subAdministrativeArea ?? townTextController.text;
                        provinceTextController.text = siteLocationScreenResult.placeMark?.administrativeArea ?? provinceTextController.text;
                        if (context
                            .read<MemberDetailCubit>()
                            .state
                            .memberSiteDetailsState
                            .isComplete) {
                          cubit.onChangeSiteDetailState(isCollapse: true);
                          cubit.onChangeMemberRiskAssessmentState(isCollapse: false);
                        }
                      }
                    },
                    title: LocaleKeys.siteLocation.tr(),
                    showTick: memberSiteDetailsState.isCompleteSiteLocation,
                    isHideBorder: true,
                  ),
                ),
                const SizedBox(height: 16),
                AttributeItem(
                  child: BlocBuilder<MemberDetailCubit, MemberDetailState>(
                    builder: (context, state) {
                      final farmSizeTitle = state.farm?.farmSize == null
                          ? null
                          : '${state.farm!.farmSize!.toStringAsFixed(2)}${LocaleKeys.ha_unit.tr()}';
                      return CmoDropDownLayoutWidget(
                        title: LocaleKeys.compartment_s.tr(),
                        showTick: state.farm?.farmSize != null && state.farm!.farmSize! > 0,
                        subTitle: farmSizeTitle,
                        subTitleAlignment: Alignment.center,
                        subTitleTextStyle: context.textStyles.titleBold.copyWith(fontSize: 16),
                        isHideBorder: true,
                        onTap: () async {
                          final state = context.read<MemberDetailCubit>().state;
                          final farmName = state.farm?.farmName;
                          final farmId = state.farm?.farmId;
                          await CompartmentScreen.push(
                            context,
                            farmId: farmId,
                            farmName: farmName,
                            shouldDisplayFarmNameOnBreadcrumbs: true,
                          );

                          await cubit.updateFarmSizeByCompartments(
                            shouldCacheFarm: true,
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                AttributeItem(
                  child: CmoDropDownLayoutWidget(
                    onTap: () async {
                      final state = context.read<MemberDetailCubit>().state;
                      final farmName = state.farm?.farmName;
                      final farmId = state.farm?.farmId;
                      final result = await ASIScreen.push(context,
                          farmId: farmId, farmName: farmName);

                      await cubit.onChangeMemberSiteDetailSection(asis: result);
                    },
                    title: LocaleKeys.asi.tr(),
                    showTick: memberSiteDetailsState.isCompleteASI,
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

  @override
  void dispose() {
    townTextController.dispose();
    provinceTextController.dispose();
    super.dispose();
  }
}
