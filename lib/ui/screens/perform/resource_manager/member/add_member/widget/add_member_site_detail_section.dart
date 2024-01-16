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

class AddMemberSiteDetailSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddMemberSiteDetailSectionState();
}

class _AddMemberSiteDetailSectionState
    extends State<AddMemberSiteDetailSection> {
  final townTextController = TextEditingController();
  final provinceTextController = TextEditingController();
  late AddMemberCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddMemberCubit>();
    townTextController.text = cubit.state.addMemberSDetails.town ?? '';
    provinceTextController.text = cubit.state.addMemberSDetails.province ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberSDetails>(
      selector: (state) => state.addMemberSDetails,
      builder: (context, AddMemberSDetails data) {
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
                        cubit.onChangeMemberRiskAssessmentState(
                            isCollapse: false);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isTownError,
                  errorText: LocaleKeys.town.tr(),
                  child: InputAttributeItem(
                    controller: townTextController,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.town.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onDataChangeSiteDetail(town: value);
                    },
                    onSubmitted: (_) {
                      if (data.isComplete) {
                        cubit.onChangeSiteDetailState(isCollapse: true);
                        cubit.onChangeMemberRiskAssessmentState(
                            isCollapse: false);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isProvinceError,
                  errorText: LocaleKeys.province.tr(),
                  child: InputAttributeItem(
                    controller: provinceTextController,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.province.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onDataChangeSiteDetail(province: value);
                    },
                    onSubmitted: (_) {
                      if (data.isComplete) {
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
                          province: siteLocationScreenResult
                              .placeMark?.administrativeArea,
                          town: siteLocationScreenResult
                              .placeMark?.subAdministrativeArea,
                        );

                        townTextController.text = siteLocationScreenResult
                                .placeMark?.subAdministrativeArea ??
                            townTextController.text;
                        provinceTextController.text = siteLocationScreenResult
                                .placeMark?.administrativeArea ??
                            provinceTextController.text;
                        if (context
                            .read<AddMemberCubit>()
                            .state
                            .addMemberSDetails
                            .isComplete) {
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
                            shouldDisplayFarmNameOnBreadcrumbs: true,
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

  @override
  void dispose() {
    townTextController.dispose();
    provinceTextController.dispose();
    super.dispose();
  }
}
