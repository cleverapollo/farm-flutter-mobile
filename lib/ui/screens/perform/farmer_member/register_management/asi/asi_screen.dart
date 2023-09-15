import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_cubit.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/asi/adding_asi_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsiScreen extends StatefulWidget {
  const AsiScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider<RMAsiCubit>(
                  create: (_) {
                    return RMAsiCubit()..initListData();
                  },
                  child: const AsiScreen(),
                )));
  }

  @override
  State<AsiScreen> createState() => _AsiScreenState();
}

class _AsiScreenState extends State<AsiScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RMAsiCubit, RMAsiState>(
      builder: (context, state) {
        final cubit = context.read<RMAsiCubit>();
        return Scaffold(
          appBar: CmoFarmAppBar.listRegisterWithFarmName(
            title: LocaleKeys.asi.tr(),
            onTapAdding: () async {
              final result = await AddingAsiScreen.push(context);
              if (result != null && result is int) {
                await cubit.initListData();
              }
            },
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CmoTappable(
                    onTap: () => {},
                    child: CmoCard(
                      childAlignment: MainAxisAlignment.center,
                      content: [
                        CmoCardHeader(title: LocaleKeys.summary.tr()),
                        CmoCardHeader(
                          title: LocaleKeys.total.tr(),
                          valueEnd: state.asisData.length.toString(),
                        ),
                      ],
                      trailing: Assets.icons.icDown.svgWhite,
                    ),
                  ),
                  if (state.isLoading)
                    const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        itemCount: state.asisData.length,
                        separatorBuilder: (_, index) =>
                            const SizedBox(height: 14),
                        itemBuilder: (_, index) => InkWell(
                          onTap: () async {
                            final result = await AddingAsiScreen.push(
                              context,
                              asi: state.asisData[index],
                            );
                            if (result != null && result is int) {
                              await cubit.initListData();
                            }
                          },
                          child: _AsiItem(state.asisData[index]),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StatusFilterWidget extends StatelessWidget {
  final bool isSelected;
  final String text;

  const _StatusFilterWidget({
    required this.text,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? context.colors.blue : context.colors.white,
        border: isSelected ? null : Border.all(color: context.colors.black),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
      alignment: Alignment.center,
      child: Text(
        text,
        style: context.textStyles.bodyNormal.copyWith(
          fontSize: 12,
          color: isSelected ? context.colors.white : context.colors.black,
        ),
      ),
    );
  }
}

class _AsiItem extends StatelessWidget {
  static const double _itemHorizontalPadding = 4;

  final Asi asi;

  const _AsiItem(this.asi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.greyD9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _itemHorizontalPadding,
            ),
            child: Text(
              '${LocaleKeys.asi_no.tr()}: ${asi.asiRegisterNo}',
              style: context.textStyles.bodyBold
                  .copyWith(color: context.colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _itemHorizontalPadding * 2,
              vertical: 6,
            ),
            child: Container(
              height: 1,
              color: context.colors.black,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.asiType.tr(),
                    style: context.textStyles.bodyNormal,
                  ),
                ),
                Expanded(
                  child: Text(
                    asi.asiTypeName ?? '',
                    style: context.textStyles.bodyNormal,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: context.colors.greyLight1,
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.date.tr(),
                    style: context.textStyles.bodyNormal,
                  ),
                  Text(
                    asi.date?.ddMMYyyy() ?? '',
                    style: context.textStyles.bodyNormal,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.general_comments.tr(),
                  style: context.textStyles.bodyNormal,
                ),
                Text(
                  asi.comment ?? '',
                  style: context.textStyles.bodyNormal,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
