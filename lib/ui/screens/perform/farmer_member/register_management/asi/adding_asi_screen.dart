import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_cubit.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/location_and_photos_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingAsiScreen extends StatefulWidget {
  const AddingAsiScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => RMAsiCubit()..initAddData(),
                  child: const AddingAsiScreen(),
                )));
  }

  @override
  State<AddingAsiScreen> createState() => _AddingAsiScreenState();
}

class _AddingAsiScreenState extends State<AddingAsiScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RMAsiCubit, RMAsiState>(
      builder: (context, state) {
        final cubit = context.read<RMAsiCubit>();
        return Scaffold(
          appBar: CmoAppBarV2(
            title: LocaleKeys.asi.tr(),
            showLeading: true,
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    children: [
                      CmoDropdown<AsiType>(
                        name: 'asiType',
                        style: context.textStyles.bodyBold
                            .copyWith(color: context.colors.black),
                        inputDecoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                          isDense: true,
                          hintText: 'Asi Type',
                          hintStyle: context.textStyles.bodyNormal.grey,
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.grey)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.colors.blue)),
                        ),
                        itemsData: state.asiTypes
                            .map((e) => CmoDropdownItem<AsiType>(
                                id: e, name: e.asiTypeName ?? ''))
                            .toList(),
                        onChanged: (value) {
                          cubit.onChangeData(asiType: value);
                        },
                      ),
                      GestureDetector(
                        onTap: () async {
                          final result = await MapAndPhotoScreen.push(context,
                              title: LocaleKeys.asi.tr());
                          if (result == null) return;
                          final mapResult = result as LocationResult;

                          cubit.onChangeData(
                            lat: mapResult.latitude,
                            lng: mapResult.longitude,
                            selectAsiPhotoBase64s: mapResult.photoBase64,
                          );
                        },
                        child: AttributeItem(
                          child: SelectorAttributeItem(
                            hintText: LocaleKeys.lat_long.tr(),
                            text: state.asiData.latitude == null
                                ? ''
                                : '${state.asiData.latitude?.toStringAsFixed(5)} | ${state.asiData.longitude?.toStringAsFixed(5)}',
                            contentPadding: const EdgeInsets.all(4),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: state.asiData.date ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now()
                                .add(const Duration(days: 1000000)),
                          );

                          if (date != null) {
                            cubit.onChangeData(dateTimeCaptured: date);
                          }
                        },
                        child: AttributeItem(
                          child: SelectorAttributeItem(
                              hintText: LocaleKeys.date_captured.tr(),
                              text: state.asiData.date.yMd(),
                              contentPadding: const EdgeInsets.all(4),
                              trailing: Assets.icons.icCalendar.svgBlack),
                        ),
                      ),
                      AttributeItem(
                        child: SelectorAttributeItem(
                          hintText: LocaleKeys.car_raised.tr(),
                          text: LocaleKeys.car_raised.tr(),
                          contentPadding: const EdgeInsets.all(4),
                          trailing: SizedBox(
                            width: 24,
                            child: Switch(
                              value: state.asiData.carRaisedDate != null,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (bool value) {
                                cubit.onChangeData(carRaised: value);
                              },
                            ),
                          ),
                        ),
                      ),
                      AttributeItem(
                        child: SelectorAttributeItem(
                          hintText: LocaleKeys.car_closed.tr(),
                          text: LocaleKeys.car_closed.tr(),
                          contentPadding: const EdgeInsets.all(4),
                          trailing: SizedBox(
                            width: 24,
                            child: Switch(
                              value: state.asiData.carClosedDate != null,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (bool value) {
                                cubit.onChangeData(carClosed: value);
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: TextField(
                          minLines: 10,
                          maxLines: 100,
                          onChanged: (value) {
                            cubit.onChangeData(comment: value);
                          },
                          decoration: InputDecoration(
                            hintText: LocaleKeys.comments.tr(),
                          ),
                        ),
                      ),
                      Center(
                        child: CmoFilledButton(
                          title: LocaleKeys.save.tr(),
                          onTap: () {
                            cubit.onSave(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
