import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCampCubit extends Cubit<AddCampState> {
  AddCampCubit({Camp? camp})
      : super(
          AddCampState(
            camp: camp ??
                Camp(
                  campId: DateTime.now().millisecondsSinceEpoch.toString(),
                  plannedYearOfHarvest: DateTime.now().year,
                ),
          ),
        );

  Future init() async {
    initDataForAreaMetricsSection();
    final activeFarm = await configService.getActiveFarm();
    var compartments = await cmoDatabaseMasterService
        .getCompartmentByFarmId(activeFarm?.farmId ?? '');
    if (compartments != null) {
      compartments = compartments
          .where((element) => element.campId == state.camp?.campId)
          .toList();
    }
    var asis = await cmoDatabaseMasterService
        .getAsiRegisterByFarmId(activeFarm?.farmId ?? '');
    asis =
        asis.where((element) => element.campId == state.camp?.campId).toList();
    emit(state.copyWith(
      farm: activeFarm,
      compartments: compartments,
      asis: asis,
    ));
  }

  void initDataForAreaMetricsSection() {
    emit(
      state.copyWith(
        addCampAreaMetricsSectionState: state.addCampAreaMetricsSectionState.copyWith(
          isSectionCollapse: false,
          rangeLand: (state.camp?.rangeLand ?? '').toString(),
          convertedToGrassland: (state.camp?.convertedToGrassland ?? '').toString(),
          poachingAlleviationZone: (state.camp?.poachingAlleviationZone ?? '').toString(),
          roadAndFireBreaks: (state.camp?.roadAndFireBreaks ?? '').toString(),
          corridors: (state.camp?.corridors ?? '').toString(),
          cattlePostHousing: (state.camp?.cattlePostHousing ?? '').toString(),
          protectedArea: (state.camp?.protectedArea ?? '').toString(),
          campName: state.camp?.campName,
        ),
      ),
    );
  }

  void onCheckInfestationDetailComplete({bool isCheckCollapse = false}) {
    final camp = state.camp;
    final unAllocatePercent = 100
        - (camp?.infestationCategory1 ?? 0.0)
        - (camp?.infestationCategory2 ?? 0.0)
        - (camp?.infestationCategory3 ?? 0.0)
        - (camp?.infestationCategory4 ?? 0.0)
        - (camp?.infestationCategory5 ?? 0.0);
    emit(state.copyWith(
      addCampInfestationDetailsState: state.addCampInfestationDetailsState.copyWith(
        unAllocatePercent: unAllocatePercent,
      ),),
    );
    if (isCheckCollapse && state.addCampInfestationDetailsState.isComplete(state.camp!) && unAllocatePercent <= 0) {
      onChangeInfestationState(isCollapse: true);
      onChangeActualState(isCollapse: false);
    }
  }

  void onChangeInfestationState({bool? isCollapse}) {
    emit(
      state.copyWith(
        addCampInfestationDetailsState: state.addCampInfestationDetailsState.copyWith(
          isSectionCollapse: isCollapse ?? !state.addCampInfestationDetailsState.isSectionCollapse,
        ),
      ),
    );
  }

  void onChangeActualState({bool? isCollapse}) {
    emit(
      state.copyWith(
        addCampActualSectionState: state.addCampActualSectionState.copyWith(
          isSectionCollapse: isCollapse ?? !state.addCampActualSectionState.isSectionCollapse,
        ),
      ),
    );
  }

  void onLocationChanged({double? latitude, double? longitude}) {
    emit(
      state.copyWith(
        camp: state.camp?.copyWith(latitude: latitude, longitude: longitude),
      ),
    );
  }

  void onInfestationCategory1Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory1: double.tryParse(value))));
    onCheckInfestationDetailComplete();
  }

  void onInfestationCategory2Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory2: double.tryParse(value))));
    onCheckInfestationDetailComplete();
  }

  void onInfestationCategory3Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory3: double.tryParse(value))));
    onCheckInfestationDetailComplete();
  }

  void onInfestationCategory4Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory4: double.tryParse(value))));
    onCheckInfestationDetailComplete();
  }

  void onInfestationCategory5Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory5: double.tryParse(value))));
    onCheckInfestationDetailComplete(isCheckCollapse: true);
  }

  void onPlannedYearOfHarvestChanged(int? value) {
    emit(state.copyWith(
        camp: state.camp?.copyWith(plannedYearOfHarvest: value)));
  }

  void onActualYearOfHarvestChanged(int? value) {
    emit(
        state.copyWith(camp: state.camp?.copyWith(actualYearOfHarvest: value)));
  }

  void onAsisChanged({List<Asi>? asis}) {
    emit(state.copyWith(asis: asis ?? []));
  }

  void onTonsOfProductChanged(String? value) {
    emit(
        state.copyWith(
            camp: state.camp?.copyWith(tonsOfCharcoalProduced: double.tryParse(value ?? '')),
        ),
    );
  }
  
  Future<void> saveCamp(BuildContext context) async {
    emit(state.copyWith(
      camp: state.camp
          ?.copyWith(farmId: state.farm?.farmId, isActive: true, isLocal: true),
    ));

    await cmoDatabaseMasterService.cacheCamp(state.camp!);
  }

  Future<void> onChangeAreaMetricsSection({
    bool onTapCollapse = false,
    String? campName,
    String? protectedArea,
    String? cattlePostHousing,
    String? corridors,
    String? roadAndFireBreaks,
    String? poachingAlleviationZone,
    String? rangeLand,
    String? convertedToGrassland,
  }) async {
    if (onTapCollapse) {
      emit(
        state.copyWith(
          addCampAreaMetricsSectionState:
              state.addCampAreaMetricsSectionState.copyWith(
            isSectionCollapse:
                !state.addCampAreaMetricsSectionState.isSectionCollapse,
          ),
        ),
      );

      return;
    }

    final areaMetricsSectionState = state.addCampAreaMetricsSectionState;

    emit(
      state.copyWith(
        addCampAreaMetricsSectionState: areaMetricsSectionState.copyWith(
          campName: campName ?? areaMetricsSectionState.campName,
          protectedArea: protectedArea ?? areaMetricsSectionState.protectedArea,
          cattlePostHousing: cattlePostHousing ?? areaMetricsSectionState.cattlePostHousing,
          corridors: corridors ?? areaMetricsSectionState.corridors,
          roadAndFireBreaks: roadAndFireBreaks ?? areaMetricsSectionState.roadAndFireBreaks,
          poachingAlleviationZone: poachingAlleviationZone ?? areaMetricsSectionState.poachingAlleviationZone,
          rangeLand: rangeLand ?? areaMetricsSectionState.rangeLand,
          convertedToGrassland: convertedToGrassland ?? areaMetricsSectionState.convertedToGrassland,
        ),
      ),
    );

    emit(
      state.copyWith(
        camp: state.camp?.copyWith(
          campName: state.addCampAreaMetricsSectionState.campName,
          protectedArea: double.tryParse(state.addCampAreaMetricsSectionState.protectedArea ?? ''),
          cattlePostHousing: double.tryParse(state.addCampAreaMetricsSectionState.cattlePostHousing ?? ''),
          corridors: double.tryParse(state.addCampAreaMetricsSectionState.corridors ?? ''),
          roadAndFireBreaks: double.tryParse(state.addCampAreaMetricsSectionState.roadAndFireBreaks ?? ''),
          poachingAlleviationZone: double.tryParse(state.addCampAreaMetricsSectionState.poachingAlleviationZone ?? ''),
          rangeLand: double.tryParse(state.addCampAreaMetricsSectionState.rangeLand ?? ''),
          convertedToGrassland: double.tryParse(state.addCampAreaMetricsSectionState.convertedToGrassland ?? ''),
        ),
      ),
    );

    if (state.addCampAreaMetricsSectionState.isComplete) {
      await cmoDatabaseMasterService.cacheCamp(state.camp!);
      if (rangeLand.isNotBlank) {
        await Future.delayed(const Duration(milliseconds: 800)).then(
          (value) {
            emit(
              state.copyWith(
                addCampAreaMetricsSectionState:
                    state.addCampAreaMetricsSectionState.copyWith(
                  isSectionCollapse: true,
                ),
                addCampInfestationDetailsState:
                    state.addCampInfestationDetailsState.copyWith(
                  isSectionCollapse: false,
                ),
              ),
            );
          },
        );
      }
    }
  }
}
