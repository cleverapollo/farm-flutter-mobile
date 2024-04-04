import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/state/rm_asi/asi_cubit.dart';
import 'package:cmo/state/rm_asi/asi_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_item.dart';
import 'package:cmo/ui/screens/perform/asi/asi_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ASIScreen extends BaseStatefulWidget {
  final String? farmName;
  ASIScreen({this.farmName, super.key}) : super(screenName: farmName ?? '');

  static Future<List<Asi>?> push(BuildContext context,
      {String? farmId, String? farmName, String? campId}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AsiCubit(farmId ?? '', campId: campId),
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

class _ASIScreenState extends BaseStatefulWidgetState<ASIScreen> {
  bool isCollapse = false;

  Timer? _debounceInputTimer;

  Future<void> navigateToASIDetail({Asi? asi}) async {
    await ASIDetailScreen.push(
      context,
      farmName: widget.farmName,
      farmId: context.read<AsiCubit>().state.farmId,
      campId: context.read<AsiCubit>().state.campId,
      asi: asi,
    );

    if (context.mounted) {
      await context.read<AsiCubit>().loadAsis();
    }
  }

  Map<String, String?> generateInformationMapData(Asi registerItem) {
    return {
      LocaleKeys.asiType.tr(): context.read<AsiCubit>().getAsiTypeName(registerItem),
      LocaleKeys.date.tr(): convertDateTimeToLunarString(registerItem.date),
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.asi.tr(),
        subtitle: widget.farmName ?? '',
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
        onTapTrailing: navigateToASIDetail,
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
                                isCollapse
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
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
                                        style:
                                            context.textStyles.bodyBold.white,
                                      ),
                                    ),
                                    Text(
                                      listAsi.length.toString(),
                                      style:
                                          context.textStyles.bodyNormal.white,
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
                                    onTap: () => navigateToASIDetail(asi: listAsi[index]),
                                    child: RegisterItem(
                                      title: '${LocaleKeys.asi_no.tr()}: ${listAsi[index].asiRegisterNo}',
                                      mapData: generateInformationMapData(listAsi[index]),
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
