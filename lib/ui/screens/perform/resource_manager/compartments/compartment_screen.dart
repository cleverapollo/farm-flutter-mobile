import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_map_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/widgets/compartment_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompartmentScreen extends StatefulWidget {
  const CompartmentScreen({super.key, this.farmName});
  final String? farmName;

  static Future<AddingCompartmentResult?> push(
    BuildContext context, {
    String? farmId,
    String? farmName,
    String? campId,
  }) {
    return Navigator.of(context).push<AddingCompartmentResult?>(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => CompartmentCubit(farmId ?? '', campId: campId),
            child: CompartmentScreen(
              farmName: farmName,
            ),
          );
        },
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _CompartmentScreenState();
}

class _CompartmentScreenState extends State<CompartmentScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<CompartmentCubit>().loadListCompartment();
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child:
          BlocSelector<CompartmentCubit, CompartmentState, List<Compartment>>(
        selector: (state) => state.listCompartment,
        builder: (context, listCompartment) {
          final total = listCompartment.fold(
              0.0,
              (previousValue, element) =>
                  previousValue + (element.polygonArea ?? 0));
          return Scaffold(
            appBar: CmoAppBarV2(
              title: LocaleKeys.compartment.tr(),
              subtitle: widget.farmName ?? '',
              showLeading: true,
              showTrailing: true,
              trailing: Assets.icons.icAdd.svgBlack,
              onTapLeading: () => onBack(listCompartment, total),
              onTapTrailing: () async {
                await CompartmentMapScreen.push(
                  context,
                  farmId: context.read<CompartmentCubit>().state.farmId,
                  farmName: widget.farmName,
                  campId: context.read<CompartmentCubit>().state.campId,
                );
                context.read<CompartmentCubit>().loadListCompartment();
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CmoTappable(
                    onTap: () => print('onSummary tapped'),
                    child: CmoCard(
                      content: [
                        CmoCardHeader(title: LocaleKeys.summary.tr()),
                        CmoCardItem(
                          title: LocaleKeys.total.tr(),
                          value: '${total.toStringAsFixed(2)} ha',
                          ratioTitleSpace: 3,
                        ),
                        CmoCardItem(
                          title: LocaleKeys.compartments.tr(),
                          value: listCompartment.length.toString(),
                          ratioTitleSpace: 3,
                        ),
                      ],
                      trailing: Assets.icons.icDown.svgWhite,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listCompartment.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: CompartmentItemWidget(
                            model: listCompartment[index],
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ),
                  if (listCompartment.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    CmoFilledButton(
                      title: LocaleKeys.done.tr(),
                      onTap: () => onBack(listCompartment, total),
                    ),
                    const SizedBox(height: 16),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddingCompartmentResult {
  List<Compartment>? compartments;
  double totalAreaHa = 0;

  AddingCompartmentResult({this.compartments, this.totalAreaHa = 0});
}
