import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/asi/adding_asi_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsiScreen extends StatefulWidget {
  const AsiScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider<RMAsiCubit>(
                  create: (_) => RMAsiCubit()..initListData(),
                  child: const AsiScreen(),
                )));
  }

  @override
  State<AsiScreen> createState() => _AsiScreenState();
}

class _AsiScreenState extends State<AsiScreen> {
  List<Asi> filteredAsis = [];
  bool _isOpenSelected = true;
  Timer? _debounceSearching;
  late final RMAsiCubit cubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit = context.read<RMAsiCubit>();
      filteredAsis = cubit.state.asisData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.accident_incidents.tr(),
        showLeading: true,
        showTrailing: true,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddingAsiScreen.push(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: CmoTextField(
              onChanged: _search,
              name: LocaleKeys.search.tr(),
              prefixIcon: Assets.icons.icSearch.svg(),
              hintText: LocaleKeys.search.tr(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() => _isOpenSelected = true),
                child: _StatusFilterWidget(
                  text: LocaleKeys.open.tr(),
                  isSelected: _isOpenSelected,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => _isOpenSelected = false),
                child: _StatusFilterWidget(
                  text: LocaleKeys.close.tr(),
                  isSelected: !_isOpenSelected,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              itemCount: filteredAsis.length,
              separatorBuilder: (_, index) => const SizedBox(height: 14),
              itemBuilder: (_, index) => _AsiItem(filteredAsis[index]),
            ),
          ),
        ],
      ),
    );
  }

  void _search(String? value) {
    _debounceSearching?.cancel();
    _debounceSearching = Timer(
      const Duration(milliseconds: 300),
      () {
        if (value?.isEmpty ?? true) {
          filteredAsis = cubit.state.asisData;
        } else {
          filteredAsis = cubit.state.asisData
              .where(
                  (element) => element.asiRegisterNo?.contains(value!) ?? false)
              .toList();
        }
        setState(() {});
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
                Text(
                  LocaleKeys.asiType.tr(),
                  style: context.textStyles.bodyNormal,
                ),
                Text(
                  asi.asiTypeName ?? '',
                  style: context.textStyles.bodyNormal,
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
