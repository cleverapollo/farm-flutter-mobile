import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_cubit.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/thumbnail_image.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingAsiScreen extends StatefulWidget {
  const AddingAsiScreen({super.key});

  static Future<dynamic> push(BuildContext context, {Asi? asi}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => RMAsiCubit()..initAddData(initData: asi),
          child: const AddingAsiScreen(),
        ),
      ),
    );
  }

  @override
  State<AddingAsiScreen> createState() => _AddingAsiScreenState();
}

class _AddingAsiScreenState extends State<AddingAsiScreen> {
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RMAsiCubit, RMAsiState>(
      listenWhen: (previous, current) =>
          previous.asiData.comment != current.asiData.comment,
      listener: (_, state) {
        if (_commentController.text.isEmpty) {
          _commentController.text = state.asiData.comment ?? '';
        }
      },
      builder: (context, state) {
        final cubit = context.read<RMAsiCubit>();
        return Scaffold(
          appBar: CmoFarmAppBar.showTrailingAndFarmName(
            title: LocaleKeys.asi.tr(),
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCompartment(),
                      _buildAsiType(),
                      _buildLatLng(),
                      _buildAsiDate(),
                      const SizedBox(height: 24),
                      Text(
                        LocaleKeys.general_comments.tr(),
                        style: context.textStyles.bodyBold,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _commentController,
                        minLines: 10,
                        maxLines: 100,
                        onChanged: (value) =>
                            cubit.onChangeData(comment: value),
                        decoration: InputDecoration(
                          hintText: LocaleKeys.comments.tr(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      BlocSelector<RMAsiCubit, RMAsiState, List<AsiPhoto>>(
                        selector: (state) => state.asiPhotos,
                        builder: (context, asiPhotos) {
                          return Column(
                            children: asiPhotos
                                .map(
                                  (asiPhoto) => ThumbnailImage(
                                    isAllowUpdateName: false,
                                    asiPhoto: asiPhoto,
                                    isAllowUploadNewPhoto: false,
                                    onRemoved: () =>
                                        cubit.onRemoveAsiPhoto(asiPhoto),
                                    onChanged: cubit.onUpdateAsiPhoto,
                                  ),
                                )
                                .toList(),
                          );
                        },
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
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          // floatingActionButton: CmoFilledButton(
          //   title: LocaleKeys.save.tr(),
          //   onTap: () {
          //     cubit.onSave(context);
          //   },
          // ),
        );
      },
    );
  }

  Widget _buildCompartment() {
    return BlocSelector<RMAsiCubit, RMAsiState, List<Compartment>>(
        selector: (state) => state.asiCompartments,
        builder: (context, asiCompartments) {
          final cubit = context.read<RMAsiCubit>();
          final state = cubit.state;
          if (!state.isDataReady) {
            return const SizedBox.shrink();
          }
          final initValue = asiCompartments.firstWhereOrNull(
            (element) =>
                element.localCompartmentId == state.asiData.localCompartmentId,
          );

          return BottomSheetSelection(
            hintText: LocaleKeys.compartment.tr(),
            value: initValue?.unitNumber ?? '',
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            onTap: () async {
              FocusScope.of(context).unfocus();
              if (asiCompartments.isBlank) return;
              await showCustomBottomSheet<void>(
                context,
                content: ListView.builder(
                  itemCount: asiCompartments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        cubit.onChangeData(
                            asiCompartment: asiCompartments[index]);
                        Navigator.pop(context);
                      },
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          asiCompartments[index].unitNumber ?? '',
                          style: context.textStyles.bodyBold.copyWith(
                            color: context.colors.blueDark2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        });
  }

  Widget _buildAsiType() {
    return BlocSelector<RMAsiCubit, RMAsiState, List<AsiType>>(
        selector: (state) => state.asiTypes,
        builder: (context, asiTypes) {
          final cubit = context.read<RMAsiCubit>();
          final state = cubit.state;
          if (!state.isDataReady) {
            return const SizedBox.shrink();
          }
          final initValue = asiTypes.firstWhereOrNull(
            (element) => element.asiTypeId == state.asiData.asiTypeId,
          );

          return BottomSheetSelection(
            hintText: LocaleKeys.type.tr(),
            value: initValue?.asiTypeName ?? '',
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            onTap: () async {
              FocusScope.of(context).unfocus();
              if (asiTypes.isBlank) return;
              await showCustomBottomSheet<void>(
                context,
                content: ListView.builder(
                  itemCount: asiTypes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        cubit.onChangeData(asiType: asiTypes[index]);
                        Navigator.pop(context);
                      },
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          asiTypes[index].asiTypeName ?? '',
                          style: context.textStyles.bodyBold.copyWith(
                            color: context.colors.blueDark2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        });
  }

  Widget _buildLatLng() {
    return AttributeItem(
      child: BlocSelector<RMAsiCubit, RMAsiState, double?>(
        selector: (state) => state.asiData.latitude,
        builder: (context, latitude) {
          final cubit = context.read<RMAsiCubit>();
          final state = cubit.state;
          return CmoDropDownLayoutWidget(
            title: LocaleKeys.lat_long.tr(),
            subTitle: state.asiData.latitude == null
                ? ''
                : '${state.asiData.latitude?.toStringAsFixed(5)} | ${state.asiData.longitude?.toStringAsFixed(5)}',
            subTitleAlignment: Alignment.center,
            subTitleTextStyle: context.textStyles.bodyNormal.blueDark2,
            isHideBorder: true,
            onTap: () async {
              final locationModel = LocationModel()
                ..latitude = state.asiData.latitude
                ..longitude = state.asiData.longitude;
              final result = await SelectLocationScreen.push(
                context,
                title: LocaleKeys.asi.tr(),
                farmName: state.farmName,
                locationModel: locationModel,
              );
              if (result == null) return;
              final mapResult = result as LocationModel;

              cubit.onChangeData(
                lat: mapResult.latitude,
                lng: mapResult.longitude,
                selectAsiPhotoBase64s: mapResult.listImage,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildAsiDate() {
    return BlocSelector<RMAsiCubit, RMAsiState, DateTime?>(
        selector: (state) => state.asiData.date,
        builder: (context, date) {
          final cubit = context.read<RMAsiCubit>();
          final state = cubit.state;
          return GestureDetector(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: state.asiData.date ?? DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 1000000)),
              );

              if (date != null) {
                cubit.onChangeData(dateTimeCaptured: date);
              }
            },
            child: AttributeItem(
              child: SelectorAttributeItem(
                  hintText: LocaleKeys.date_captured.tr(),
                  text: date.yMd(),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  trailing: Assets.icons.icCalendar.svgBlack),
            ),
          );
        });
  }
}
