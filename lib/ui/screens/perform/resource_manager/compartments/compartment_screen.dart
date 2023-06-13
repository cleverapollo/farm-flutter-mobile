import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_map_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/widgets/compartment_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompartmentScreen extends StatefulWidget {
  const CompartmentScreen({super.key});

  static dynamic push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CompartmentScreen(),
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
    context.read<CompartmentCubit>().loadListCompartment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.compartment.tr(),
        subtitle: LocaleKeys.siteName.tr(),
        showLeading: true,
        showTrailing: true,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () async {
          await CompartmentMapScreen.push(context);
          context.read<CompartmentCubit>().loadListCompartment();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:
            BlocSelector<CompartmentCubit, CompartmentState, List<Compartment>>(
          selector: (state) => state.listCompartment,
          builder: (context, listCompartment) {
            final total = listCompartment.fold(0.0, (previousValue, element) => previousValue +  (element.polygonArea ?? 0));
            return Column(
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
            ],
          );
          },
        ),
      ),
    );
  }
}
