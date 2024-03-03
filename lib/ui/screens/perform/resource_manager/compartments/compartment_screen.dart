import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_list_view_mode.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_detail_map_view.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'compartment_detail_screen.dart';

class CompartmentScreen extends BaseStatefulWidget {
  CompartmentScreen({
    super.key,
    this.farmName,
    required this.shouldDisplayFarmNameOnBreadcrumbs,
  }) : super(
          screenName: shouldDisplayFarmNameOnBreadcrumbs
              ? farmName ?? ''
              : LocaleKeys.compartment.tr(),
        );

  final String? farmName;
  final bool shouldDisplayFarmNameOnBreadcrumbs;

  static Future<AddingCompartmentResult?> push(
    BuildContext context, {
    String? farmId,
    String? farmName,
    String? campId,
    bool shouldDisplayFarmNameOnBreadcrumbs = false,
  }) {
    return Navigator.of(context).push<AddingCompartmentResult?>(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => CompartmentCubit(farmId ?? '', campId: campId),
            child: CompartmentScreen(
              farmName: farmName,
              shouldDisplayFarmNameOnBreadcrumbs: shouldDisplayFarmNameOnBreadcrumbs,
            ),
          );
        },
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _CompartmentScreenState();
}

class _CompartmentScreenState extends BaseStatefulWidgetState<CompartmentScreen> {

  void onBack(
    List<Compartment> listCompartment,
    double total,
  ) {
    Navigator.of(context).pop(
      AddingCompartmentResult(
        compartments: listCompartment,
        totalAreaHa: total,
      ),
    );
  }

  Future<void> navigateToDetail({Compartment? compartment}) async {
    final state = context.read<CompartmentCubit>().state;
      await CompartmentDetailScreen.push(
        context,
        farmId: state.farmId,
        farmName: widget.farmName,
        campId: state.campId,
        compartment: compartment,
        listCompartments: state.listCompartment,
      );
    // }

    await context.read<CompartmentCubit>().initData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocBuilder<CompartmentCubit, CompartmentState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CmoAppBar(
              title: LocaleKeys.compartment.tr(),
              subtitle: widget.farmName ?? '',
              leading: Assets.icons.icBackButton.svgBlack,
              trailing: Assets.icons.icUpdatedAddButton.svgBlack,
              onTapLeading: () => onBack(state.listCompartment, state.totalSize),
              onTapTrailing: navigateToDetail,
            ),
            body: contentWidget(state),
          );
        },
      ),
    );
  }

  Widget contentWidget(CompartmentState state) {
    if (state.currentUserRole == UserRoleEnum.regionalManager) {
      return listViewMode();
    }

    switch (state.viewMode) {
      case MemberManagementViewMode.listView:
        return listViewMode();
      case MemberManagementViewMode.mapView:
      case MemberManagementViewMode.mapDetailView:
        return mapViewMode(state);
    }
  }

  Widget listViewMode() {
    return CompartmentListViewMode(
      navigateToDetail: (compartment) =>
          navigateToDetail(compartment: compartment),
    );
  }

  Widget mapViewMode(CompartmentState state) {
    return BlocProvider(
      create: (_) => MemberDetailMapViewCubit(state.getFullFarInformation()),
      child: state.getFullFarInformation() == null
          ? const SizedBox.shrink()
          : MemberDetailMapView(
              state.getFullFarInformation()!,
              onChangeViewMode: context.read<CompartmentCubit>().onChangeViewMode,
            ),
    );
  }
}

class AddingCompartmentResult {
  List<Compartment>? compartments;
  double totalAreaHa = 0;

  AddingCompartmentResult({this.compartments, this.totalAreaHa = 0});
}
