import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_cubit.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/asi/adding_asi_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsiScreen extends BaseStatefulWidget {
  AsiScreen({super.key}) : super(screenName: LocaleKeys.asi.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider<RMAsiCubit>(
          create: (_) {
            return RMAsiCubit()..initListData();
          },
          child: AsiScreen(),
        ),
      ),
    );
  }

  @override
  State<AsiScreen> createState() => _AsiScreenState();
}

class _AsiScreenState extends BaseStatefulWidgetState<AsiScreen> {
  final _searchFocusNode = FocusNode();
  final _searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RMAsiCubit, RMAsiState>(
      builder: (context, state) {
        final cubit = context.read<RMAsiCubit>();
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.asi.tr(),
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icUpdatedAddButton.svgBlack,
            onTapTrailing: () async {
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                    child: CmoTextField(
                      controller: _searchEditingController,
                      focusNode: _searchFocusNode,
                      onChanged: cubit.onSearch,
                      name: LocaleKeys.search.tr(),
                      prefixIcon: Assets.icons.icSearch.svg(),
                      hintText: LocaleKeys.search.tr(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _searchFocusNode.unfocus();
                          _searchEditingController.clear();
                          cubit.onChangeStatus(true);
                        },
                        child: _StatusFilterWidget(
                          text: LocaleKeys.open.tr(),
                          isSelected: state.isOpen,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          _searchFocusNode.unfocus();
                          _searchEditingController.clear();
                          cubit.onChangeStatus(false);
                        },
                        child: _StatusFilterWidget(
                          text: LocaleKeys.close.tr(),
                          isSelected: !state.isOpen,
                        ),
                      ),
                    ],
                  ),
                  if (state.isLoading)
                    const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        itemCount: state.asisDataSearch.length,
                        separatorBuilder: (_, index) =>
                            const SizedBox(height: 14),
                        itemBuilder: (_, index) => InkWell(
                          onTap: () async {
                            final result = await AddingAsiScreen.push(
                              context,
                              asi: state.asisDataSearch[index],
                            );
                            if (result != null && result is int) {
                              await cubit.initListData();
                            }
                          },
                          child: _AsiItem(state.asisDataSearch[index]),
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
  const _StatusFilterWidget({
    required this.text,
    this.isSelected = false,
  });

  final bool isSelected;
  final String text;

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

class _AsiItem extends StatefulWidget {
  const _AsiItem(this.asi);
  static const double _itemHorizontalPadding = 4;

  final Asi asi;

  @override
  State<_AsiItem> createState() => _AsiItemState();
}

class _AsiItemState extends State<_AsiItem> {
  final _compartmentName = ValueNotifier('');
  final _asiTypeName = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<RMAsiCubit>().state;
      _compartmentName.value =
          state.asiCompartments.firstWhereOrNull((element) {
                if (element.managementUnitId != null) {
                  return element.managementUnitId ==
                      widget.asi.managementUnitId;
                }

                if (element.localCompartmentId != null) {
                  return element.localCompartmentId ==
                      widget.asi.localCompartmentId;
                }

                return false;
              })?.unitNumber ??
              '';
      _asiTypeName.value = state.asiTypes
              .firstWhereOrNull(
                  (element) => element.asiTypeId == widget.asi.asiTypeId)
              ?.asiTypeName ??
          '';
    });
  }

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
              horizontal: _AsiItem._itemHorizontalPadding,
            ),
            child: Text(
              '${LocaleKeys.asi_no.tr()}: ${widget.asi.asiRegisterNo}',
              style: context.textStyles.bodyBold
                  .copyWith(color: context.colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _AsiItem._itemHorizontalPadding * 2,
              vertical: 6,
            ),
            child: Container(
              height: 1,
              color: context.colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                _AsiItem._itemHorizontalPadding, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.compartment.tr(),
                    style: context.textStyles.bodyNormal,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _compartmentName,
                  builder: (context, compartmentName, __) {
                    return Expanded(
                      child: Text(
                        compartmentName,
                        style: context.textStyles.bodyNormal,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                _AsiItem._itemHorizontalPadding, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.asiType.tr(),
                    style: context.textStyles.bodyNormal,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _asiTypeName,
                  builder: (context, asiTypeName, __) {
                    return Expanded(
                      child: Text(
                        asiTypeName,
                        style: context.textStyles.bodyNormal,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          ColoredBox(
            color: context.colors.greyLight1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  _AsiItem._itemHorizontalPadding, 8, 11, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.date.tr(),
                    style: context.textStyles.bodyNormal,
                  ),
                  Text(
                    widget.asi.date?.ddMMYyyy() ?? '',
                    style: context.textStyles.bodyNormal,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                _AsiItem._itemHorizontalPadding, 8, 11, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.general_comments.tr(),
                  style: context.textStyles.bodyNormal,
                ),
                Text(
                  widget.asi.comment ?? '',
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
