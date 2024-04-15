import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/components/bottom_sheet_selection/bottom_sheet_selection.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/components/radio_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_search_view_mode.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MemberMapView extends BaseStatefulWidget {
  const MemberMapView({super.key}) : super(screenName: 'MemberMapView');

  @override
  State<StatefulWidget> createState() => MemberMapViewState();
}

class MemberMapViewState extends BaseStatefulWidgetState<MemberMapView> {

  GoogleMapController? mapController;

  Set<Polygon> generatePolygon(
    List<Farm> farms,
    Farm? selectedFarm,
  ) {
    final polygon = <Polygon>{};
    final visibleRegion = context.read<MemberManagementCubit>().state.visibleRegion;

    for (final farm in farms) {
      for (final compartment in farm.compartments) {
        final isCompartmentVisible = visibleRegion?.contains(compartment.centerPoint());
        if (isCompartmentVisible != null && isCompartmentVisible) {
          final generatePolygon = generateSetPolygonFromCompartment(
            compartment,
            isSelected: farm.farmId == selectedFarm?.farmId,
          );
          if (generatePolygon != null) {
            polygon.add(generatePolygon);
          }
        }
      }
    }

    return polygon;
  }

  Polygon? generateSetPolygonFromCompartment(
    Compartment compartment, {
    bool isSelected = false,
  }) {
    final fillColor = isSelected
        ? context.colors.greenFF47.withOpacity(0.5)
        : context.colors.white.withOpacity(0.5);
    final strokeColor =
        isSelected ? context.colors.greenFF47 : context.colors.white;

    if (compartment.getPolygonLatLng().isBlank) return null;

    return Polygon(
      polygonId: PolygonId('${compartment.localCompartmentId}'),
      points: compartment.getPolygonLatLng(),
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: 2,
    );
  }

  Future<void> moveMapCameraToLocation(LatLng? position) async {
    if (position == null) return;
    await mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> moveMapCameraToInitLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          position.latitude,
          position.longitude,
        ),
      ),
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        buildMemberSearchViewMode(),
        const SizedBox(height: 18),
        Expanded(
          child: Stack(
            children: [
              BlocBuilder<MemberManagementCubit, MemberManagementState>(
                builder: (context, state) {
                  return GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: Constants.mapCenter,
                      zoom: Constants.mapZoom,
                    ),
                    polygons: generatePolygon(
                      state.completedFarms,
                      state.selectedFarm,
                    ),
                    mapType: state.mapType,
                    markers: Set.of(state.markers),
                    myLocationEnabled: true,
                    onCameraMove: (_) async {
                      final visibleRegion = await mapController?.getVisibleRegion();
                      context.read<MemberManagementCubit>().onCameraMove(visibleRegion);
                    },
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                      MapUtils.checkLocationPermission(
                        onAllowed: () async {
                          await Future.delayed(const Duration(seconds: 1));
                          if (state.selectedFarm != null && state.selectedFarm!.centerPoint() != null) {
                            await moveMapCameraToLocation(
                              state.selectedFarm!.centerPoint(),
                            );
                          } else {
                            await moveMapCameraToInitLocation();
                          }
                        },
                      );
                    },
                  );
                    },
                  ),
              Positioned(
                left: 15,
                bottom: 15,
                child: MapTypeSwitchButton(
                  onTap: context.read<MemberManagementCubit>().onChangeMapType,
                ),
              ),
              const MapCenterIcon(),
            ],
          ),
        ),
        const SizedBox(height: 8,),
        rmuInformation(),
        const SizedBox(height: 16),
        radioButtons(),
        const SizedBox(height: 16),
        functionButtons(),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildMemberSearchViewMode() {
    return BlocBuilder<MemberManagementCubit, MemberManagementState>(
      builder: (context, state) {
        final cubit = context.read<MemberManagementCubit>();
        return MemberSearchViewMode(
          viewMode: state.viewMode,
          onChangeViewMode: cubit.onChangeViewMode,
          searchWidget: BottomSheetSelection(
            hintText: LocaleKeys.site.tr(),
            margin: EdgeInsets.zero,
            value: state.selectedFarm?.farmName,
            displayHorizontal: false,
            onTap: () async {
              FocusScope.of(context).unfocus();
              if (state.filteringFarms.isBlank) return;
              await showCustomBottomSheet<void>(
                context,
                content: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CmoTextField(
                        name: LocaleKeys.search_site.tr(),
                        hintText: LocaleKeys.search_site.tr(),
                        prefixIcon: Assets.icons.icSearch.svg(),
                        initialValue: state.filteringText,
                        onChanged: context.read<MemberManagementCubit>().onSearchTextChanged,
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<MemberManagementCubit, MemberManagementState>(
                        builder: (context, state) {
                          return ListView.builder(
                            itemCount: state.filteringFarms.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () async {
                                  Navigator.pop(context);
                                  final selectedFarm = state.filteringFarms[index];
                                  context
                                      .read<MemberManagementCubit>()
                                      .updateSelectedFarm(selectedFarm);
                                  await moveMapCameraToLocation(
                                    selectedFarm.centerPoint(),
                                  );
                                },
                                contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                                title: Text(
                                  state.filteringFarms[index].farmName ?? '',
                                  style: context.textStyles.bodyBold.blueDark2,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget rmuInformation() {
    return BlocBuilder<MemberManagementCubit, MemberManagementState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              state.activeRMU?.regionalManagerUnitName ?? '',
              style: context.textStyles.bodyBold.blueDark2.copyWith(fontSize: 18),
            ),
            Text(
              '${LocaleKeys.site_area.tr()}: ${convertAreaUnit(context.read<MemberManagementCubit>().calculateTotalFarmSizeRmu())?.toStringAsFixed(2)} $areaUnit ${LocaleKeys.measured.tr()}',
              style: context.textStyles.bodyBold.blueDark2,
            ),
          ],
        );
      },
    );
  }

  Widget radioButtons() {
    return BlocSelector<MemberManagementCubit, MemberManagementState, bool>(
      selector: (state) => state.isShowSiteName,
      builder: (context, isShowSiteName) {
        return RadioItem(
          onTap: context.read<MemberManagementCubit>().updateShowSiteName,
          isDisplayIconFirst: true,
          title: LocaleKeys.show_site_names.tr(),
          isSelected: isShowSiteName,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
        );
      },
    );
  }

  Widget functionButtons() {
    return BlocSelector<MemberManagementCubit, MemberManagementState, Farm?>(
      selector: (state) => state.selectedFarm,
      builder: (context, selectedFarm) {
        return CmoFilledButton(
          title: LocaleKeys.open_site.tr(),
          titleStyle: context.textStyles.bodyBold.white,
          disable: selectedFarm == null,
          onTap: context.read<MemberManagementCubit>().onShowMemberDetailMapView,
        );
      },
    );
  }
}
