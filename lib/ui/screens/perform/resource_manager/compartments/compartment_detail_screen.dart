import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompartmentDetailScreen extends StatefulWidget {
  final double? measuredArea;

  const CompartmentDetailScreen({Key? key, this.measuredArea})
      : super(key: key);

  static dynamic push(BuildContext context, {double? measuredArea}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => CompartmentDetailCubit(),
            child: CompartmentDetailScreen(measuredArea: measuredArea),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.compartment.tr(),
        subtitle: LocaleKeys.siteName.tr(),
        showLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
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
                          onChanged:
                              _compartmentDetailCubit.onCompartmentNameChanged,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: AttributeItem(
                          child: SelectorAttributeItem(
                            hintText: LocaleKeys.productGroup.tr(),
                            text: '',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: AttributeItem(
                          child: SelectorAttributeItem(
                            hintText: LocaleKeys.speciesGroup.tr(),
                            text: '',
                          ),
                        ),
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
                          onChanged:
                              _compartmentDetailCubit.onCompartmentUnitChanged,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          hintText: '${LocaleKeys.effectiveArea.tr()} ha',
                          keyboardType: TextInputType.number,
                          onChanged: (value) => _compartmentDetailCubit
                              .onEffectiveAreaChanged(double.tryParse(value)),
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
                                      .onEspacementChanged(_espacement?.name);
                                  setState(() {
                                    _espacement = Espacement.w;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 16),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: context.colors.grey),
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
                                      .onEspacementChanged(_espacement?.name);
                                  setState(() {
                                    _espacement = Espacement.l;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 16),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: context.colors.grey),
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
                          hintText: LocaleKeys.rotation.tr(),
                          onChanged: _compartmentDetailCubit.onRotationChanged,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          hintText: LocaleKeys.mai.tr(),
                          onChanged: _compartmentDetailCubit.onMAIChanged,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CmoFilledButton(
              title: LocaleKeys.save.tr(),
              onTap: () {
                _compartmentDetailCubit.saveCompartment();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum Espacement { w, l }
