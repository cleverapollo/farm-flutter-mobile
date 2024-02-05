import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/fire/fire_register.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/fire_cubit/fire_cubit.dart';
import 'package:cmo/state/fire_cubit/fire_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/fire/add_fire_management/add_fire_management_screen.dart';
import 'package:cmo/ui/components/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireManagementScreen extends BaseStatefulWidget {
  FireManagementScreen({super.key}) : super(screenName: LocaleKeys.fire.tr());

  @override
  State<StatefulWidget> createState() => _FireManagementScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider<FireCubit>(
          create: (_) => FireCubit()..initLoadData(),
          child: FireManagementScreen(),
        ),
      ),
    );
  }
}

class _FireManagementScreenState extends BaseStatefulWidgetState<FireManagementScreen> {
  Future<void> navigateToDetailFire({FireRegister? fireRegister}) async {
    final locationModel = LocationModel()
      ..latitude = fireRegister?.latitude
      ..longitude = fireRegister?.longitude;
    final shouldRefresh = await AddFireManagementScreen.push(
      context,
      fireRegister: fireRegister,
      locationModel: locationModel,
    );

    if (shouldRefresh != null) {
      await context.read<FireCubit>().initLoadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FireCubit, FireState>(
        builder: (context, state) {
          final cubit = context.read<FireCubit>();
          return Scaffold(
            appBar: CmoAppBar(
              title: LocaleKeys.fire.tr(),
              leading: Assets.icons.icBackButton.svgBlack,
              onTapLeading: Navigator.of(context).pop,
              trailing: Assets.icons.icUpdatedAddButton.svgBlack,
              onTapTrailing: navigateToDetailFire,
            ),
            body: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
                          child: CmoTextField(
                            name: LocaleKeys.search.tr(),
                            hintText: LocaleKeys.search.tr(),
                            suffixIcon: Assets.icons.icSearch.svg(),
                            onChanged: cubit.onSearch,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                cubit.onChangeStatus(true);
                              },
                              child: _StatusFilterWidget(
                                text: LocaleKeys.open.tr(),
                                isSelected: state.isOpen,
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                cubit.onChangeStatus(false);
                              },
                              child: _StatusFilterWidget(
                                text: LocaleKeys.close.tr(),
                                isSelected: !state.isOpen,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 22,
                            ),
                            itemCount: state.data.length,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 21,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => navigateToDetailFire(fireRegister: state.data[index]),
                                child: RegisterItem(
                                  title: '${LocaleKeys.fireNo.tr()}: ${state.data[index].fireRegisterNo?.toString()}',
                                  mapData: generateInformationMapData(state.data[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
    );
  }

  Map<String, String?> generateInformationMapData(FireRegister registerItem) {
    return {
      LocaleKeys.fireCause.tr(): registerItem.fireCauseName,
      LocaleKeys.dateDetected.tr(): convertDateTimeToLunar(registerItem.date).ddMMYyyy(),
      LocaleKeys.dateExtinguished.tr(): convertDateTimeToLunar(registerItem.extinguished).ddMMYyyy(),
      LocaleKeys.areaBurntHa.tr(): registerItem.areaBurnt?.toString(),
      LocaleKeys.commercialAreaLossHa.tr(): registerItem.commercialAreaLoss?.toString(),
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }
}

class _StatusFilterWidget extends StatelessWidget {
  const _StatusFilterWidget({
    required this.text,
    this.isSelected = false,
    super.key,
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
