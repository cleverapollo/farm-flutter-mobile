import 'package:cmo/extensions/date.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/compartment/area_type.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_cubit.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/widgets/espacement_input_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompartmentDetailScreen extends StatefulWidget {
  final double? measuredArea;
  final List<PolygonItem>? locations;
  final String? farmName;

  const CompartmentDetailScreen({
    Key? key,
    this.measuredArea,
    this.locations,
    this.farmName,
  }) : super(key: key);

  static dynamic push(
    BuildContext context, {
    double? measuredArea,
    List<PolygonItem>? locations,
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
              measuredArea: measuredArea,
              locations: locations,
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
    _compartmentDetailCubit.onPolygonAreaChanged(widget.measuredArea);
    _compartmentDetailCubit.onLocationsChanged(widget.locations);
    _compartmentDetailCubit.fetchData(context: context);
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
                      style: context.textStyles.bodyBold.copyWith(color: context.colors.white),
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
                            AttributeItem(
                              child: BlocSelector<CompartmentDetailCubit, CompartmentDetailState, List<AreaType>?>(
                                selector: (state) => state.areaTypes,
                                builder: (context, areaTypes) {
                                  final state = context
                                      .read<CompartmentDetailCubit>()
                                      .state;
                                  if(!state.isDataReady) {
                                    return const SizedBox();
                                  }
                                  return CmoDropdown<AreaType>(
                                    name: LocaleKeys.type.tr(),
                                    style: context.textStyles.bodyBold.blueDark2,
                                    inputDecoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      isDense: true,
                                      hintText: LocaleKeys.type.tr(),
                                      hintStyle: context.textStyles.bodyBold.blueDark2,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    initialValue: areaTypes.firstWhereOrNull(
                                      (element) =>
                                          element.areaTypeId ==
                                          context
                                              .read<CompartmentDetailCubit>()
                                              .state
                                              .compartment
                                              .areaTypeId,
                                    ),
                                    itemsData: areaTypes
                                        ?.map(
                                          (e) => CmoDropdownItem<AreaType>(
                                            id: e,
                                            name: e.areaTypeName ?? '',
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        _compartmentDetailCubit
                                            .onAreaTypeChanged(
                                          value.areaTypeId!,
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),

                            AttributeItem(
                              child: BlocSelector<CompartmentDetailCubit, CompartmentDetailState, List<ProductGroupTemplate>?>(
                                selector: (state) => state.productGroupTemplates,
                                builder: (context, productGroupTemplates) {
                                  final state = context
                                      .read<CompartmentDetailCubit>()
                                      .state;
                                  if(!state.isDataReady) {
                                    return const SizedBox();
                                  }
                                  return CmoDropdown<ProductGroupTemplate>(
                                    name: LocaleKeys.productGroup.tr(),
                                    style: context.textStyles.bodyBold.blueDark2,
                                    inputDecoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      isDense: true,
                                      hintText: LocaleKeys.productGroup.tr(),
                                      hintStyle: context.textStyles.bodyBold.blueDark2,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    initialValue: productGroupTemplates.firstWhereOrNull(
                                      (element) =>
                                          element.productGroupTemplateId ==
                                          context
                                              .read<CompartmentDetailCubit>()
                                              .state
                                              .compartment
                                              .productGroupTemplateId,
                                    ),
                                    itemsData: productGroupTemplates?.map(
                                          (e) => CmoDropdownItem<ProductGroupTemplate>(
                                            id: e,
                                            name: e.productGroupTemplateName ?? '',
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      _compartmentDetailCubit.onProductGroupChanged(
                                        productGroupId: value?.productGroupTemplateId,
                                        productGroupName: value?.productGroupTemplateName,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            AttributeItem(
                              child: BlocSelector<CompartmentDetailCubit, CompartmentDetailState,
                                  List<SpeciesGroupTemplate>?>(
                                selector: (state) => state.speciesGroupTemplates,
                                builder: (context, speciesGroupTemplates) {
                                  final state = context
                                      .read<CompartmentDetailCubit>()
                                      .state;
                                  if(!state.isDataReady) {
                                    return const SizedBox();
                                  }
                                  return CmoDropdown<SpeciesGroupTemplate>(
                                      name: LocaleKeys.speciesGroup.tr(),
                                      style: context.textStyles.bodyBold.blueDark2,
                                      inputDecoration: InputDecoration(
                                        contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                                        isDense: true,
                                        hintText: LocaleKeys.speciesGroup.tr(),
                                        hintStyle: context.textStyles.bodyBold.blueDark2,
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                    initialValue: speciesGroupTemplates.firstWhereOrNull(
                                          (element) =>
                                      element.speciesGroupTemplateId ==
                                          context
                                              .read<CompartmentDetailCubit>()
                                              .state
                                              .compartment
                                              .speciesGroupTemplateId,
                                    ),
                                      itemsData: speciesGroupTemplates
                                          ?.map(
                                            (e) => CmoDropdownItem<SpeciesGroupTemplate>(
                                              id: e,
                                              name: e.speciesGroupTemplateName ?? '',
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        _compartmentDetailCubit.onSpeciesGroupChanged(
                                          speciesGroupId: value?.speciesGroupTemplateId,
                                          speciesGroupName: value?.speciesGroupTemplateName,
                                        );
                                      },
                                  );
                                },
                              ),
                            ),
                            AttributeItem(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 12),
                                    Text(
                                      LocaleKeys.polygonArea.tr(),
                                      style: context.textStyles.bodyBold,
                                    ),
                                    const SizedBox(width: 36),
                                    Text(
                                      '${widget.measuredArea?.toStringAsFixed(2)}ha ${LocaleKeys.measured.tr()}',
                                      style: context.textStyles.bodyNormal,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // AttributeItem(
                            //   child: InputAttributeItem(
                            //     hintText: LocaleKeys.unit.tr(),
                            //     onChanged: _compartmentDetailCubit.onCompartmentUnitChanged,
                            //   ),
                            // ),
                            BlocSelector<CompartmentDetailCubit, CompartmentDetailState, bool>(
                              selector: (state) => state.isEffectiveAreaError,
                              builder: (context, isEffectiveAreaError) {
                                return AttributeItem(
                                  errorText: '${LocaleKeys.effectiveArea.tr()} ha',
                                  isShowError: isEffectiveAreaError,
                                  child: InputAttributeItem(
                                    labelText: '${LocaleKeys.effectiveArea.tr()} ha',
                                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                                    textStyle: context.textStyles.bodyNormal.blueDark2,
                                    keyboardType: TextInputType.number,
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
                                        style: context.textStyles.bodyBold,
                                      ),
                                    ),
                                    EspacementInputWidget(
                                      widthValue: initCompartment.espacementWidth ?? '',
                                      lengthValue: initCompartment.espacementLength ?? '',
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
                                              style: context.textStyles.bodyBold,
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
                                          firstDate: DateTime.now().add(Duration(days: -1000000)),
                                          lastDate: DateTime.now().add(Duration(days: 1000000)),
                                        );
                                        _compartmentDetailCubit.onPlannedPlantDateChanged(datetime);
                                      },
                                      icon: Assets.icons.icCalendar.svgBlack
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AttributeItem(
                              child: InputAttributeItem(
                                labelText: '${LocaleKeys.survival.tr()} %',
                                labelTextStyle: context.textStyles.bodyBold.blueDark2,
                                textStyle: context.textStyles.bodyNormal.blueDark2,
                                initialValue: (initCompartment.survival ?? '').toString(),
                                hintText: '${LocaleKeys.survival.tr()} %',
                                keyboardType: TextInputType.number,
                                onChanged: (value) =>
                                    _compartmentDetailCubit.onSurvivalPercentageDateChanged(double.tryParse(value)),
                              ),
                            ),
                            buildingStockWidget(),
                            AttributeItem(
                              child: InputAttributeItem(
                                  labelText: LocaleKeys.rotation.tr(),
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
                                  labelText: LocaleKeys.mai.tr(),
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
                      final complete = _compartmentDetailCubit.checkCompleteRequiredField();
                      if (!complete) {
                        return;
                      }
                      final errorMessage = _compartmentDetailCubit.checkCompleteDropDownField();
                      if (errorMessage.isNotBlank) {
                        showSnackError(msg: errorMessage!);
                        return;
                      }
                      await _compartmentDetailCubit.saveCompartment();
                      if (context.mounted) {
                        Navigator.of(context).pop();
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
                      child: CircularProgressIndicator(),
                    );
                  }),
            ],
          ),
        ),
      ),
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
                      LocaleKeys.stocking.tr(),
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
