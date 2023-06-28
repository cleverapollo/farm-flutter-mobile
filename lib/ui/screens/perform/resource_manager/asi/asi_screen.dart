import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/state/rm_asi/asi_cubit.dart';
import 'package:cmo/state/rm_asi/asi_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_map_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ASIScreen extends StatelessWidget {
  final String? farmName;
  const ASIScreen({this.farmName, super.key});

  static Future<void> push(BuildContext context,
      {String? farmId, String? farmName}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AsiCubit(farmId ?? '')..loadAsis(),
            child: ASIScreen(
              farmName: farmName,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.asi.tr(),
        subtitle: farmName ?? '',
        showTrailing: true,
        showLeading: true,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () async {
          ASIMapScreen.push(context);
        },
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colors.white,
          child: Column(
            children: [
              Expanded(
                child: BlocSelector<AsiCubit, AsiState, List<Asi>>(
                  selector: (state) => state.listAsi,
                  builder: (context, listAsi) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CmoTappable(
                            onTap: () {},
                            child: CmoCard(
                              content: [
                                CmoCardHeader(title: LocaleKeys.summary.tr()),
                                CmoCardItem(title: LocaleKeys.total.tr(), value: listAsi.length.toString()),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: listAsi.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CmoTappable(
                                  onTap: () {},
                                  child: CmoCard(
                                    content: [
                                      CmoCardHeader(title: LocaleKeys.asiType.tr()),
                                      CmoCardItem(
                                          title: LocaleKeys.compartments.tr(), value: ''),
                                    ],
                                  ),
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
              const Spacer(),
              Align(
                child: CmoFilledButton(
                    title: LocaleKeys.done.tr(),
                    onTap: () {
                      ASIMapScreen.push(context, farmId: context.read<AsiCubit>().state.farmId, farmName: farmName);
                    }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
