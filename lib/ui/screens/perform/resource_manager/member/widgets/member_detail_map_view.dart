import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/components/radio_item.dart';
import 'package:cmo/ui/screens/perform/compartments/compartment_detail_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_detail_map_view_search_compartment.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_search_view_mode.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MemberDetailMapView extends StatefulWidget {
  final Farm farm;
  final void Function()? onNavigateToDetail;
  final void Function() onChangeViewMode;

  MemberDetailMapView(
    this.farm, {
    required this.onChangeViewMode,
    this.onNavigateToDetail,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MemberDetailMapViewState();
}

class _MemberDetailMapViewState extends State<MemberDetailMapView> {

  GoogleMapController? mapController;
  List<Marker> markers = <Marker>[];

  Set<Polygon> generatePolygon(
      BuildContext context,
    List<Compartment> compartments,
    Compartment? selectedCompartment,
  ) {
    final polygon = <Polygon>{};

    final visibleRegion = context.read<MemberDetailMapViewCubit>().state.visibleRegion;
    for (final compartment in compartments) {
      final isCompartmentVisible = visibleRegion?.contains(compartment.centerPoint());
      if (isCompartmentVisible != null && isCompartmentVisible) {
        final generatePolygon = generateSetPolygonFromCompartment(
          context,
          compartment,
          isSelected: compartment.localCompartmentId ==
              selectedCompartment?.localCompartmentId,
        );
        if (generatePolygon != null) {
          polygon.add(generatePolygon);
        }
      }
    }

    return polygon;
  }

  Polygon? generateSetPolygonFromCompartment(
    BuildContext context,
    Compartment compartment, {
    bool isSelected = false,
  }) {
    final strokeColor = isSelected ? context.colors.yellow : context.colors.greenFF47;
    final fillColor = strokeColor.withOpacity(0.5);

    if (compartment.getPolygonLatLng().isBlank) return null;

    return Polygon(
      polygonId: PolygonId('${compartment.localCompartmentId}'),
      points: compartment.getPolygonLatLng(),
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: 2,
      consumeTapEvents: true,
      onTap: () async {
        context.read<MemberDetailMapViewCubit>().updateSelectedCompartment(compartment);
        await moveMapCameraToLocation(context.read<MemberDetailMapViewCubit>().state.selectedCompartment!.centerPoint());
      },
    );
  }

  Future<void> moveMapCameraToLocation(LatLng position) async {
    await mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> moveMapCameraToInitLocation() async {
    var centerLat = 0.0;
    var centerLong = 0.0;
    if (widget.farm.compartments.isBlank) return;

    for(final compartment in widget.farm.compartments) {
      final centerPoint = compartment.centerPoint();
      centerLat += centerPoint.latitude;
      centerLong += centerPoint.longitude;
    }

    await mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          centerLat / widget.farm.compartments.length,
          centerLong / widget.farm.compartments.length,
        ),
      ),
    );
  }

  Future<void> navigateToCompartmentDetail(Compartment? compartment) async {
    await CompartmentDetailScreen.push(
      context,
      farmId: widget.farm.farmId,
      farmName: widget.farm.farmName,
      compartment: compartment,
      listCompartments: widget.farm.compartments,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MemberDetailMapViewCubit, MemberDetailMapViewState>(
          builder: (context, state) {
            final cubit = context.read<MemberDetailMapViewCubit>();
            return MemberSearchViewMode(
              viewMode: MemberManagementViewMode.mapDetailView,
              onChangeViewMode: widget.onChangeViewMode,
              searchWidget: BottomSheetSelection(
                hintText: LocaleKeys.compartment.tr(),
                margin: EdgeInsets.zero,
                value: state.selectedCompartment?.unitNumber,
                displayHorizontal: false,
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  if (state.compartments.isBlank) return;
                  await showCustomBottomSheet<void>(
                    context,
                    content: MemberDetailMapViewSearchCompartment(
                      compartments: state.compartments,
                      onSelectCompartment: (compartment) async {
                        Navigator.pop(context);
                        cubit.updateSelectedCompartment(
                          compartment,
                        );
                        await moveMapCameraToLocation(
                          compartment.centerPoint(),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
        const SizedBox(height: 18),
        Expanded(
          child: Stack(
            children: [
              BlocBuilder<MemberDetailMapViewCubit, MemberDetailMapViewState>(
                builder: (context, state) {
                  return GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: Constants.mapCenter,
                      zoom: 16,
                    ),
                    polygons: generatePolygon(
                      context,
                      state.farm?.compartments ?? <Compartment>[],
                      state.selectedCompartment,
                    ),
                    onCameraMove: (_) async {
                      final visibleRegion = await mapController?.getVisibleRegion();
                      context
                          .read<MemberDetailMapViewCubit>()
                          .onCameraMove(visibleRegion);
                    },
                    mapType: MapType.satellite,
                    markers: Set.of(state.markers),
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                      MapUtils.checkLocationPermission(
                        onAllowed: () async {
                          await Future.delayed(Duration(seconds: 1));
                          await context
                              .read<MemberDetailMapViewCubit>()
                              .initMapData();
                          if (state.selectedCompartment != null) {
                            await moveMapCameraToLocation(
                                state.selectedCompartment!.centerPoint());
                          } else {
                            await moveMapCameraToInitLocation();
                          }
                        },
                      );
                    },
                  );
                },
              ),
              const MapCenterIcon(),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        farmInformation(),
        const SizedBox(height: 12),
        radioButtons(),
        const SizedBox(height: 12),
        functionButtons(),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget farmInformation() {
    return Text(
      '${LocaleKeys.site_area.tr()}: ${widget.farm.calculateFarmSizeBasedOnCompartments().toStringAsFixed(2)} ha ${LocaleKeys.measured.tr()}',
      style: context.textStyles.bodyBold.blueDark2,
    );
  }

  Widget radioButtons() {
    final showCompartmentNameRadio = BlocSelector<MemberDetailMapViewCubit, MemberDetailMapViewState, bool>(
      selector: (state) => state.isShowCompartmentName,
      builder: (context, isShowCompartmentName) {
        return RadioItem(
          onTap: context.read<MemberDetailMapViewCubit>().updateShowCompartmentName,
          isDisplayIconFirst: true,
          title: LocaleKeys.show_compartment_names.tr(),
          isSelected: isShowCompartmentName,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
        );
      },
    );

    final showAsiRadio = BlocSelector<MemberDetailMapViewCubit, MemberDetailMapViewState, bool>(
      selector: (state) => state.isShowASI,
      builder: (context, isShowASI) {
        return RadioItem(
          onTap: context.read<MemberDetailMapViewCubit>().updateShowASI,
          isDisplayIconFirst: true,
          title: LocaleKeys.show_area_of_special_interest.tr(),
          isSelected: isShowASI,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
        );
      },
    );

    final showRteRadio = BlocSelector<MemberDetailMapViewCubit, MemberDetailMapViewState, bool>(
      selector: (state) => state.isShowRTE,
      builder: (context, isShowRTE) {
        return RadioItem(
          onTap: context.read<MemberDetailMapViewCubit>().updateShowRte,
          isDisplayIconFirst: true,
          title: LocaleKeys.show_rte.tr(),
          isSelected: isShowRTE,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
        );
      },
    );

    return BlocSelector<MemberDetailMapViewCubit, MemberDetailMapViewState, UserRoleEnum?>(
      selector: (state) => state.currentUserRole,
      builder: (context, currentUserRole) {
        switch (currentUserRole) {
          case UserRoleEnum.regionalManager:
            return Column(
              children: [
                showCompartmentNameRadio,
                const SizedBox(
                  height: 12,
                ),
                showAsiRadio,
              ],
            );
          case UserRoleEnum.farmerMember:
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(child: showAsiRadio),
                    Expanded(child: showRteRadio),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                showCompartmentNameRadio,
              ],
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget functionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocSelector<MemberDetailMapViewCubit, MemberDetailMapViewState, Compartment?>(
          selector: (state) => state.selectedCompartment,
          builder: (context, selectedCompartment) {
            return CmoFilledButton(
              title: LocaleKeys.open_compartment.tr(),
              disable: selectedCompartment == null,
              titleStyle: context.textStyles.bodyBold.white,
              onTap: () => navigateToCompartmentDetail(selectedCompartment),
            );
          },
        ),
        BlocSelector<MemberDetailMapViewCubit, MemberDetailMapViewState, UserRoleEnum?>(
          selector: (state) => state.currentUserRole,
          builder: (context, currentUserRole) {
            if (currentUserRole == UserRoleEnum.farmerMember) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: CmoFilledButton(
                title: LocaleKeys.view_member_details.tr(),
                titleStyle: context.textStyles.bodyBold.white,
                onTap: widget.onNavigateToDetail,
              ),
            );
          },
        ),
      ],
    );
  }
}
