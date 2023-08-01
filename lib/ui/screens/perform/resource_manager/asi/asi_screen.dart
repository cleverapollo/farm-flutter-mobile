import 'dart:async';

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

class ASIScreen extends StatefulWidget {

  final String? farmName;
  const ASIScreen({this.farmName, super.key});

  static Future<List<Asi>?> push(BuildContext context,
      {String? farmId, String? farmName, String? campId}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AsiCubit(farmId ?? '', campId: campId)..loadAsis(),
            child: ASIScreen(
              farmName: farmName,
            ),
          );
        },
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _ASIScreenState();
}
class _ASIScreenState extends State<ASIScreen> {

  bool isCollapse = false;

  Timer? _debounceInputTimer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.asi.tr(),
        subtitle: widget.farmName ?? '',
        showTrailing: true,
        showLeading: true,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () async {
          await ASIMapScreen.push(
            context,
            farmId: context.read<AsiCubit>().state.farmId,
            farmName: widget.farmName,
            campId: context.read<AsiCubit>().state.campId,
          );

          await context.read<AsiCubit>().loadAsis();
        },
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
                child: CmoTextField(
                  name: LocaleKeys.search.tr(),
                  hintText: LocaleKeys.search.tr(),
                  suffixIcon: Assets.icons.icSearch.svg(),
                  onChanged: (input) {
                    _debounceInputTimer?.cancel();
                    _debounceInputTimer = Timer(
                      const Duration(milliseconds: 200),
                      () {
                        setState(() {
                          isCollapse = false;
                        });

                        context.read<AsiCubit>().searching(input);
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocSelector<AsiCubit, AsiState, List<Asi>>(
                  selector: (state) => state.filterAsi,
                  builder: (context, listAsi) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CmoTappable(
                            onTap: () {
                              setState(() {
                                isCollapse = !isCollapse;
                              });
                            },
                            child: CmoCard(
                              backgroundColor: context.colors.blueDark2,
                              trailing: Icon(
                                isCollapse ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                color: context.colors.white,
                                size: 40,
                              ),
                              content: [
                                CmoCardHeader(
                                  title: LocaleKeys.summary.tr(),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        LocaleKeys.total.tr(),
                                        style: context.textStyles.bodyBold.white,
                                      ),
                                    ),
                                    Text(
                                      listAsi.length.toString(),
                                      style: context.textStyles.bodyNormal.white,
                                    ),
                                    const SizedBox(width: 50),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Visibility(
                            visible: !isCollapse,
                            child: ListView.builder(
                              itemCount: listAsi.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CmoTappable(
                                    onTap: () async {
                                      await ASIMapScreen.push(
                                        context,
                                        farmId: context.read<AsiCubit>().state.farmId,
                                        farmName: widget.farmName,
                                        campId: context.read<AsiCubit>().state.campId,
                                        asi: listAsi[index],
                                      );
                                      if (context.mounted) {
                                        await context.read<AsiCubit>().loadAsis();
                                      }
                                    },
                                    child: CmoCard(
                                      content: [
                                        CmoCardHeader(
                                          title: listAsi[index].asiTypeName ?? LocaleKeys.asiType.tr(),
                                        ),
                                        CmoCardItem(
                                          title: listAsi[index].asiRegisterNo ?? '',
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Align(
                child: CmoFilledButton(
                    title: LocaleKeys.done.tr(),
                    onTap: () {
                      Navigator.pop<List<Asi>>(
                          context, context.read<AsiCubit>().state.listAsi);
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
