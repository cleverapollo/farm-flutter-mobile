import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class CompartmentDetailScreen extends StatefulWidget {
  const CompartmentDetailScreen({Key? key}) : super(key: key);

  static dynamic push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CompartmentDetailScreen(),
      ),
    );
  }

  @override
  State<CompartmentDetailScreen> createState() => _CompartmentDetailScreenState();
}

class _CompartmentDetailScreenState extends State<CompartmentDetailScreen> {
  Espacement? _espacement;
  DateTime? _plannedPlantDate;

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
                      _CompartmentDetailItem(
                        child: _CompartmentTextField(
                          hintText: LocaleKeys.compartmentName.tr(),
                        ),
                      ),
                      _CompartmentDetailItem(
                        child: _CompartmentSelectorField(
                          hintText: LocaleKeys.productGroup.tr(),
                        ),
                      ),
                      _CompartmentDetailItem(
                        child: _CompartmentSelectorField(
                          hintText: LocaleKeys.speciesGroup.tr(),
                        ),
                      ),
                      _CompartmentDetailItem(
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text(
                              LocaleKeys.polygonArea.tr(),
                              style: context.textStyles.bodyBold,
                            ),
                            const SizedBox(width: 36),
                            Text(
                              '10ha ${LocaleKeys.measured.tr()}',
                              style: context.textStyles.bodyNormal,
                            ),
                          ],
                        ),
                      ),
                      _CompartmentDetailItem(
                        child: _CompartmentTextField(
                          hintText: LocaleKeys.unit.tr(),
                        ),
                      ),
                      _CompartmentDetailItem(
                        child: _CompartmentTextField(
                          hintText: '${LocaleKeys.effectiveArea.tr()} ha',
                        ),
                      ),
                      _CompartmentDetailItem(
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
                              onTap: () => setState(() {
                                  _espacement = Espacement.w;
                                }),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 16),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: context.colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                  color: _espacement == Espacement.w ? context.colors.yellow : null,
                                ),
                                child: Text('W'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () => setState(() {
                                _espacement = Espacement.l;
                              }),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 16),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: context.colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                  color: _espacement == Espacement.l ? context.colors.yellow : null,
                                ),
                                child: Text('L'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _CompartmentDetailItem(
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
                                setState(() {
                                });
                              },
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                      _CompartmentDetailItem(
                        child: _CompartmentTextField(
                          hintText: '${LocaleKeys.survival.tr()} %',
                        ),
                      ),
                      _CompartmentDetailItem(
                        child: _CompartmentTextField(
                          hintText: '${LocaleKeys.stocking.tr()} %',
                        ),
                      ),
                      _CompartmentDetailItem(
                        child: _CompartmentTextField(
                          hintText: LocaleKeys.rotation.tr(),
                        ),
                      ),
                      _CompartmentDetailItem(
                        child: _CompartmentTextField(
                          hintText: '${LocaleKeys.mai.tr()} ha',
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

class _CompartmentDetailItem extends StatelessWidget {
  final Widget child;

  const _CompartmentDetailItem({required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: context.colors.grey),
        ),
      ),
      child: child,
    );
  }
}

class _CompartmentTextField extends StatelessWidget {
  final String hintText;

  const _CompartmentTextField({
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      style: context.textStyles.bodyBold,
      decoration: InputDecoration(
        hintText: hintText,
        isCollapsed: true,
        contentPadding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}

class _CompartmentSelectorField extends StatelessWidget {
  final String hintText;

  const _CompartmentSelectorField({
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            minLines: 1,
            style: context.textStyles.bodyBold,
            enabled: false,
            decoration: InputDecoration(
              hintText: hintText,
              isCollapsed: true,
              contentPadding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Assets.icons.icArrowRight.svgBlack,
        const SizedBox(width: 16),
      ],
    );
  }
}

enum Espacement { w, l }
