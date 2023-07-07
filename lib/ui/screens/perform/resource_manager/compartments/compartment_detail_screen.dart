import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/compartment/area_type.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_cubit.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompartmentDetailScreen extends StatefulWidget {
  final double? measuredArea;
  final List<GeoLocation>? locations;
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
    List<GeoLocation>? locations,
    required String farmId,
    String? farmName,
    String? campId,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => CompartmentDetailCubit(farmId, campId: campId),
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
  State<CompartmentDetailScreen> createState() =>
      _CompartmentDetailScreenState();
}

class _CompartmentDetailScreenState extends State<CompartmentDetailScreen> {
  Espacement? _espacement;
  DateTime? _plannedPlantDate;
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
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.compartment.tr(),
        subtitle: widget.farmName ?? LocaleKeys.siteName.tr(),
        showLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                  alignment: Alignment.centerLeft,
                  color: context.colors.blueDark1,
                  child: Text(
                    LocaleKeys.details.tr(),
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.white),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AttributeItem(
                            child: InputAttributeItem(
                              hintText: LocaleKeys.compartmentName.tr(),
                              onChanged: _compartmentDetailCubit
                                  .onCompartmentNameChanged,
                            ),
                          ),
                          BlocSelector<CompartmentDetailCubit,
                              CompartmentDetailState, List<AreaType>>(
                            selector: (state) => state.areaTypes,
                            builder: (context, areaTypes) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: CmoDropdown(
                                  name: LocaleKeys.type.tr(),
                                  style: context.textStyles.bodyBold
                                      .copyWith(color: context.colors.black),
                                  inputDecoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(4, 8, 4, 8),
                                    isDense: true,
                                    hintText: LocaleKeys.type.tr(),
                                    hintStyle:
                                        context.textStyles.bodyNormal.grey,
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: context.colors.grey)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: context.colors.blue)),
                                  ),
                                  itemsData: areaTypes
                                      .map((e) => CmoDropdownItem(
                                          id: e.areaTypeId,
                                          name: e.areaTypeName ?? ''))
                                      .toList(),
                                  onChanged: (value) {
                                    _compartmentDetailCubit
                                        .onAreaTypeChanged(value!);
                                  },
                                ),
                              );
                            },
                          ),
                          BlocSelector<CompartmentDetailCubit,
                              CompartmentDetailState, Compartment>(
                            selector: (state) => state.compartment,
                            builder: (context, compartment) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: CmoDropdown(
                                  name: LocaleKeys.productGroup.tr(),
                                  style: context.textStyles.bodyBold
                                      .copyWith(color: context.colors.black),
                                  inputDecoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(4, 8, 4, 8),
                                    isDense: true,
                                    hintText: LocaleKeys.productGroup.tr(),
                                    hintStyle:
                                        context.textStyles.bodyNormal.grey,
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: context.colors.grey)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: context.colors.blue)),
                                  ),
                                  itemsData: _compartmentDetailCubit
                                      .state.productGroupTemplates
                                      .where((element) =>
                                          element.areaTypeId ==
                                          _compartmentDetailCubit
                                              .state.compartment.areaTypeId)
                                      .map((e) => CmoDropdownItem(
                                          id: e.productGroupTemplateId,
                                          name:
                                              e.productGroupTemplateName ?? ''))
                                      .toList(),
                                  onChanged: (value) {
                                    _compartmentDetailCubit
                                        .onProductGroupChanged(
                                      productGroupId: value!,
                                      productGroupName: _compartmentDetailCubit
                                          .state.productGroupTemplates
                                          .firstWhereOrNull((e) =>
                                              e.productGroupTemplateId == value)
                                          ?.productGroupTemplateName,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          BlocSelector<CompartmentDetailCubit,
                              CompartmentDetailState, Compartment>(
                            selector: (state) => state.compartment,
                            builder: (context, compartment) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: CmoDropdown(
                                  name: LocaleKeys.speciesGroup.tr(),
                                  style: context.textStyles.bodyBold
                                      .copyWith(color: context.colors.black),
                                  inputDecoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(4, 8, 4, 8),
                                    isDense: true,
                                    hintText: LocaleKeys.speciesGroup.tr(),
                                    hintStyle:
                                        context.textStyles.bodyNormal.grey,
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: context.colors.grey)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: context.colors.blue)),
                                  ),
                                  itemsData: _compartmentDetailCubit
                                      .state.speciesGroupTemplates
                                      .where((element) =>
                                          element.areaTypeId ==
                                          _compartmentDetailCubit
                                              .state.compartment.areaTypeId)
                                      .map((e) => CmoDropdownItem(
                                          id: e.speciesGroupTemplateId,
                                          name:
                                              e.speciesGroupTemplateName ?? ''))
                                      .toList(),
                                  onChanged: (value) {
                                    _compartmentDetailCubit
                                        .onSpeciesGroupChanged(
                                      speciesGroupId: value!,
                                      speciesGroupName: _compartmentDetailCubit
                                          .state.speciesGroupTemplates
                                          .firstWhereOrNull((e) =>
                                              e.speciesGroupTemplateId == value)
                                          ?.speciesGroupTemplateName,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          AttributeItem(
                            child: Row(
                              children: [
                                const SizedBox(width: 16),
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
                          AttributeItem(
                            child: InputAttributeItem(
                              hintText: LocaleKeys.unit.tr(),
                              onChanged: _compartmentDetailCubit
                                  .onCompartmentUnitChanged,
                            ),
                          ),
                          AttributeItem(
                            child: InputAttributeItem(
                              hintText: '${LocaleKeys.effectiveArea.tr()} ha',
                              keyboardType: TextInputType.number,
                              onChanged: (value) => _compartmentDetailCubit
                                  .onEffectiveAreaChanged(
                                      double.tryParse(value)),
                            ),
                          ),
                          AttributeItem(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      LocaleKeys.espacement.tr(),
                                      style: context.textStyles.bodyBold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _compartmentDetailCubit
                                          .onEspacementChanged(
                                              _espacement?.name);
                                      setState(() {
                                        _espacement = Espacement.w;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: context.colors.grey),
                                        borderRadius: BorderRadius.circular(4),
                                        color: _espacement == Espacement.w
                                            ? context.colors.yellow
                                            : null,
                                      ),
                                      child: Text('W'),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  GestureDetector(
                                    onTap: () {
                                      _compartmentDetailCubit
                                          .onEspacementChanged(
                                              _espacement?.name);
                                      setState(() {
                                        _espacement = Espacement.l;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: context.colors.grey),
                                        borderRadius: BorderRadius.circular(4),
                                        color: _espacement == Espacement.l
                                            ? context.colors.yellow
                                            : null,
                                      ),
                                      child: Text('L'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AttributeItem(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    _plannedPlantDate == null
                                        ? LocaleKeys.plannedPlantDate.tr()
                                        : DateFormat.yMMMd()
                                            .format(_plannedPlantDate!),
                                    style: context.textStyles.bodyBold,
                                  ),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.all(4),
                                  constraints: const BoxConstraints(),
                                  onPressed: () async {
                                    _plannedPlantDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now()
                                          .add(Duration(days: -1000000)),
                                      lastDate: DateTime.now()
                                          .add(Duration(days: 1000000)),
                                    );
                                    _compartmentDetailCubit
                                        .onPlannedPlantDateChanged(
                                            _plannedPlantDate);
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.calendar_month),
                                ),
                              ],
                            ),
                          ),
                          AttributeItem(
                            child: InputAttributeItem(
                              hintText: '${LocaleKeys.survival.tr()} %',
                              keyboardType: TextInputType.number,
                              onChanged: (value) => _compartmentDetailCubit
                                  .onSurvivalPercentageDateChanged(
                                      double.tryParse(value)),
                            ),
                          ),
                          AttributeItem(
                            child: InputAttributeItem(
                              hintText: '${LocaleKeys.stocking.tr()} %',
                              keyboardType: TextInputType.number,
                              onChanged: (value) => _compartmentDetailCubit
                                  .onStockingPercentageDateChanged(
                                      double.tryParse(value)),
                            ),
                          ),
                          AttributeItem(
                            child: InputAttributeItem(
                                keyboardType: TextInputType.number,
                                hintText: LocaleKeys.rotation.tr(),
                                onChanged: (value) => _compartmentDetailCubit
                                    .onRotationChanged(double.tryParse(value))),
                          ),
                          AttributeItem(
                            child: InputAttributeItem(
                                keyboardType: TextInputType.number,
                                hintText: LocaleKeys.mai.tr(),
                                onChanged: (value) => _compartmentDetailCubit
                                    .onMAIChanged(double.tryParse(value))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CmoFilledButton(
                  title: LocaleKeys.save.tr(),
                  onTap: () async {
                    await _compartmentDetailCubit.saveCompartment();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
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
    );
  }
}

enum Espacement { w, l }
