import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'member_detail_map_view_state.dart';

class MemberDetailMapViewCubit extends Cubit<MemberDetailMapViewState> {
  MemberDetailMapViewCubit(Farm? farm) : super(MemberDetailMapViewState(farm: farm)) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final groupScheme = await configService.getActiveGroupScheme();
    final rmUnit = await configService.getActiveRegionalManager();

    emit(
      state.copyWith(
        activeGroupScheme: groupScheme,
        activeRMU: rmUnit,
      ),
    );

    emit(state.copyWith(isLoading: false));
  }

  void onChangeViewMode() {
    final currentViewMode = state.viewMode;
    if (currentViewMode == MemberManagementViewMode.mapView) {
      emit(
        state.copyWith(viewMode: MemberManagementViewMode.listView),
      );
    } else {
      emit(
        state.copyWith(
          viewMode: MemberManagementViewMode.mapView,
        ),
      );
    }
  }

  Future<void> onShowMemberDetailMapView() async {
    emit(
      state.copyWith(
        viewMode: MemberManagementViewMode.mapDetailView,
      ),
    );

    await generateListMarker();
  }

  Future<void> updateShowSiteName() async {
    emit(
      state.copyWith(
        isShowSiteName: !state.isShowSiteName,
      ),
    );

    await generateListMarker();
  }

  void updateSelectedFarm(Farm farm) {
    emit(
      state.copyWith(
        selectedFarm: farm,
      ),
    );
  }

  Future<void> generateListMarker() async {
    final markers = <Marker>[];
        for (final compartment in state.farm?.compartments ?? <Compartment>[]) {
          final centerPoint = compartment.centerPoint();
          final marker = Marker(
            markerId: MarkerId('place_name_${centerPoint.latitude}_${centerPoint.longitude}'),
            position: centerPoint,
            // onTap: () => onTap?.call(MarkerId('place_name_${position.latitude}_${position.longitude}')),
            // draggable: draggable,
            // onDrag: (latLng) {
            //   onDrag?.call(
            //     latLng,
            //     MarkerId('place_name_${position.latitude}_${position.longitude}'),
            //   );
            // },
            icon: await BitmapDescriptorHelper.getBytesFromCanvasDynamic(
              title: state.farm?.farmName,
              // subtitle: 'managementUnitName',
            ),
          );

          markers.add(marker);
        }

    emit(
      state.copyWith(
        markers: markers,
      ),
    );
  }
}
