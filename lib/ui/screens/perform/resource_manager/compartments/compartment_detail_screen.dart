import 'dart:convert';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_cubit.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/widgets/espacement_input_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/cmo_percentage_input_attribute_widget.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../asi/widgets/bottom_sheet_selection.dart';
import 'compartment_map_screen.dart';

class CompartmentDetailScreen extends StatefulWidget {
  final String? farmName;

  const CompartmentDetailScreen({
    Key? key,
    this.farmName,
  }) : super(key: key);

  static dynamic push(
    BuildContext context, {
    required String farmId,
    Compartment? compartment,
    String? farmName,
    String? campId,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => CompartmentDetailCubit(
              farmId,
              campId: campId,
              compartment: compartment ?? const Compartment(
                isActive: true,
              ),
            ),
            child: CompartmentDetailScreen(
              farmName: farmName,
            ),
          );
        },
      ),
    );
  }

  @override
  State<CompartmentDetailScreen> createState() => _CompartmentDetailScreenState();
}

class _CompartmentDetailScreenState extends State<CompartmentDetailScreen> {
  late CompartmentDetailCubit _compartmentDetailCubit;

  @override
  void initState() {
    super.initState();
    _compartmentDetailCubit = context.read<CompartmentDetailCubit>();
    _compartmentDetailCubit.fetchData();
  }

  Future<void> navigateToMap() async {
    List<PolygonItem>? points = <PolygonItem>[];
    final compartment = context.read<CompartmentDetailCubit>().state.compartment;

    if (compartment.polygon.isNotBlank) {
      final jsonArray = json.decode(compartment.polygon ?? '') as List?;
      points = jsonArray
          ?.map((model) => PolygonItem.fromJson(model as Map<String, dynamic>))
          .toList();
    }

    await CompartmentMapScreen.push(
      context,
      farmId: context.read<CompartmentDetailCubit>().state.farmId,
      farmName: widget.farmName,
      campId: context.read<CompartmentDetailCubit>().state.campId,
      compartment: compartment,
      points: points
          ?.map((e) => LatLng(e.latitude ?? 0, e.longitude ?? 0))
          .toList(),
      onSave: _compartmentDetailCubit.onChangeLocation,
    );
  }

  @override
  Widget build(BuildContext context) {
    final initCompartment = context.read<CompartmentDetailCubit>().state.compartment;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CmoAppBarV2(
          title: LocaleKeys.compartment.tr(),
          subtitle: widget.farmName ?? '',
          showLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                    alignment: Alignment.centerLeft,
                    color: context.colors.blueDark1,
                    child: Text(
                      LocaleKeys.details.tr(),
                      style: context.textStyles.bodyBold.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            BlocSelector<CompartmentDetailCubit, CompartmentDetailState, bool>(
                              selector: (state) => state.isCompartmentNameError,
                              builder: (context, isCompartmentNameError) {
                                return AttributeItem(
                                  isShowError: isCompartmentNameError,
                                  errorText: LocaleKeys.compartmentName.tr(),
                                  child: InputAttributeItem(
                                    labelText: LocaleKeys.compartmentName.tr(),
                                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                                    textStyle: context.textStyles.bodyNormal.blueDark2,
                                    initialValue: initCompartment.unitNumber,
                                    onChanged: _compartmentDetailCubit.onCompartmentNameChanged,
                                  ),
                                );
                              },
                            ),
                            buildSelectAreaType(),
                            buildSelectProductGroupTemplate(),
                            buildSelectSpecies(),
                            BlocSelector<CompartmentDetailCubit, CompartmentDetailState, Compartment>(
                              selector: (state) => state.compartment,
                              builder: (context, compartment) {
                                return AttributeItem(
                                  child: InkWell(
                                    onTap: navigateToMap,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 12),
                                          Text(
                                            LocaleKeys.polygonArea.tr(),
                                            style: context.textStyles.bodyBold.blueDark2,
                                          ),
                                          const SizedBox(width: 36),
                                          Text(
                                            compartment.polygonArea == null
                                                ? ''
                                                : '${compartment.polygonArea?.toStringAsFixed(2)}ha ${LocaleKeys.measured.tr()}',
                                            style: context.textStyles.bodyNormal.blueDark2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            BlocSelector<CompartmentDetailCubit, CompartmentDetailState, bool>(
                              selector: (state) => state.isEffectiveAreaError,
                              builder: (context, isEffectiveAreaError) {
                                return AttributeItem(
                                  errorText: '${LocaleKeys.effectiveArea.tr()} (%)',
                                  isShowError: isEffectiveAreaError,
                                  child: PercentageInputAttributeItem(
                                    labelText: '${LocaleKeys.effectiveArea.tr()} (%)',
                                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                                    textStyle: context.textStyles.bodyNormal.blueDark2,
                                    initialValue: (initCompartment.effectiveArea ?? '').toString(),
                                    onChanged: (value) =>
                                        _compartmentDetailCubit.onEffectiveAreaChanged(double.tryParse(value)),
                                  ),
                                );
                              },
                            ),
                            AttributeItem(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        LocaleKeys.espacement.tr(),
                                        style: context.textStyles.bodyBold.blueDark2,
                                      ),
                                    ),
                                    EspacementInputWidget(
                                      widthValue: (initCompartment.espacementWidth ?? '').toString(),
                                      lengthValue: (initCompartment.espacementLength ?? '').toString(),
                                      onWidthChanged: (value) {
                                        _compartmentDetailCubit.onEspacementWidthChanged(value);
                                      },
                                      onLengthChanged: (value) {
                                        _compartmentDetailCubit.onEspacementLengthChanged(value);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            AttributeItem(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: BlocSelector<CompartmentDetailCubit, CompartmentDetailState, String?>(
                                          selector: (state) => state.compartment.plannedPlantDT,
                                          builder: (context, plannedDate) {
                                            return Text(
                                              plannedDate == null
                                            ? LocaleKeys.plannedPlantDate.tr()
                                            : DateTime.parse(plannedDate).yMd(),
                                              style: context.textStyles.bodyBold.blueDark2,
                                            );
                                          },
                                      ),
                                    ),
                                    IconButton(
                                      padding: const EdgeInsets.all(4),
                                      constraints: const BoxConstraints(),
                                      onPressed: () async {
                                        final datetime = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now().add(const Duration(days: -1000000)),
                                          lastDate: DateTime.now(),
                                        );
                                        _compartmentDetailCubit.onPlannedPlantDateChanged(datetime);
                                      },
                                      icon: Assets.icons.icCalendar.svgBlack,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AttributeItem(
                              child: PercentageInputAttributeItem(
                                labelText: '${LocaleKeys.survival.tr()} (%)',
                                labelTextStyle: context.textStyles.bodyBold.blueDark2,
                                textStyle: context.textStyles.bodyNormal.blueDark2,
                                initialValue: (initCompartment.survival ?? '').toString(),
                                hintText: '${LocaleKeys.survival.tr()} %',
                                onChanged: (value) =>
                                    _compartmentDetailCubit.onSurvivalPercentageDateChanged(double.tryParse(value)),
                              ),
                            ),
                            buildingStockWidget(),
                            AttributeItem(
                              child: InputAttributeItem(
                                  labelText: '${LocaleKeys.rotation.tr()} (Years)',
                                  labelTextStyle: context.textStyles.bodyBold.blueDark2,
                                  textStyle: context.textStyles.bodyNormal.blueDark2,
                                  initialValue: (initCompartment.rotationNumber ?? '').toString(),
                                  keyboardType: TextInputType.phone,
                                  hintText: LocaleKeys.rotation.tr(),
                                  onChanged: (value) =>
                                      _compartmentDetailCubit.onRotationChanged(int.tryParse(value))),
                            ),
                            AttributeItem(
                              child: InputAttributeItem(
                                  labelText: '${LocaleKeys.mai.tr()} m3/ha/pa',
                                  labelTextStyle: context.textStyles.bodyBold.blueDark2,
                                  textStyle: context.textStyles.bodyNormal.blueDark2,
                                  initialValue: (initCompartment.utilMAI ?? '').toString(),
                                  keyboardType: TextInputType.phone,
                                  hintText: LocaleKeys.mai.tr(),
                                  onChanged: (value) => _compartmentDetailCubit.onMAIChanged(int.tryParse(value))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CmoFilledButton(
                    title: LocaleKeys.save.tr(),
                    onTap: () async {
                      final errorMessage = _compartmentDetailCubit.checkCompleteRequiredField();
                      if (errorMessage.isNotBlank) {
                        showSnackError(msg: errorMessage!);
                        return;
                      }
                      await _compartmentDetailCubit.saveCompartment();
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
              BlocSelector<CompartmentDetailCubit, CompartmentDetailState, bool>(
                  selector: (state) => state.loading,
                  builder: (context, loading) {
                    if (!loading) return Container();
                    return Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSelectAreaType() {
    return BlocBuilder<CompartmentDetailCubit, CompartmentDetailState>(
      builder: (context, state) {
        if (!state.isDataReady) {
          return const SizedBox();
        }

        return BottomSheetSelection(
          hintText: LocaleKeys.type.tr(),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: state.areaTypes
              .firstWhereOrNull(
                (element) => element.areaTypeId == state.compartment.areaTypeId,
              )
              ?.areaTypeName,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.areaTypes.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.areaTypes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      _compartmentDetailCubit.onAreaTypeChanged(
                        state.areaTypes[index].areaTypeId!,
                      );

                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.areaTypes[index].areaTypeName ?? '',
                        style: context.textStyles.bodyBold.blueDark2,
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

  Widget buildSelectProductGroupTemplate() {
    return BlocBuilder<CompartmentDetailCubit, CompartmentDetailState>(
      builder: (context, state) {
        if (!state.isDataReady) {
          return const SizedBox();
        }

        return BottomSheetSelection(
          hintText: LocaleKeys.productGroup.tr(),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: state.filterProductGroupTemplates
              .firstWhereOrNull(
                (element) =>
                    element.productGroupTemplateId ==
                    state.compartment.productGroupTemplateId,
              )
              ?.productGroupTemplateName,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.filterProductGroupTemplates.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.filterProductGroupTemplates.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      _compartmentDetailCubit.onProductGroupChanged(
                        productGroupId: state.filterProductGroupTemplates[index]
                            .productGroupTemplateId,
                        productGroupName: state
                            .filterProductGroupTemplates[index]
                            .productGroupTemplateName,
                      );

                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.filterProductGroupTemplates[index]
                                .productGroupTemplateName ??
                            '',
                        style: context.textStyles.bodyBold.blueDark2,
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

  Widget buildSelectSpecies() {
    return BlocBuilder<CompartmentDetailCubit, CompartmentDetailState>(
      builder: (context, state) {
        if (!state.isDataReady) {
          return const SizedBox();
        }

        return BottomSheetSelection(
          hintText: LocaleKeys.speciesGroup.tr(),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: state.filterSpeciesGroupTemplates
              .firstWhereOrNull(
                (element) =>
                    element.speciesGroupTemplateId ==
                    state.compartment.speciesGroupTemplateId,
              )
              ?.speciesGroupTemplateName,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.filterSpeciesGroupTemplates.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.filterSpeciesGroupTemplates.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      _compartmentDetailCubit.onSpeciesGroupChanged(
                        speciesGroupId: state.filterSpeciesGroupTemplates[index]
                            .speciesGroupTemplateId,
                        speciesGroupName: state
                            .filterSpeciesGroupTemplates[index]
                            .speciesGroupTemplateName,
                      );

                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.filterSpeciesGroupTemplates[index]
                                .speciesGroupTemplateName ??
                            '',
                        style: context.textStyles.bodyBold.blueDark2,
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

  Widget buildingStockWidget() {
    return BlocBuilder<CompartmentDetailCubit, CompartmentDetailState>(
      builder: (context, state) {
        return AttributeItem(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${LocaleKeys.stocking.tr()} (SHPa)',
                      style: context.textStyles.bodyBold.blueDark2,
                    ),
                  ],
                ),
                Text(
                  state.compartment.stockingPercentage != null ? state.compartment.stockingPercentage!.toStringAsFixed(2) : '',
                  style: context.textStyles.bodyNormal.blueDark2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
