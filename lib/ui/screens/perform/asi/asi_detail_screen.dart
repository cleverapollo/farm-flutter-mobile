import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/date.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/rm_asi/asi_detail_cubit.dart';
import 'package:cmo/state/rm_asi/asi_detail_state.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/asi/asi_map_screen.dart';
import 'package:cmo/ui/screens/perform/asi/widgets/select_compartment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/screens/perform/asi/widgets/thumbnail_image.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ASIDetailScreen extends BaseStatefulWidget {
  ASIDetailScreen({
    super.key,
    this.farmName,
    this.isEditing = false,
  }) : super(
          screenName:
              isEditing ? LocaleKeys.asi_detail.tr() : LocaleKeys.add_asi.tr(),
        );

  final String? farmName;
  final bool isEditing;

  static Future<void> push(BuildContext context, {
    required Asi? asi,
    String? campId,
    String? farmId,
    String? farmName,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AsiDetailCubit(
              asi: asi,
              campId: campId,
              farmId: farmId,
            ),
            child: ASIDetailScreen(
              farmName: farmName,
              isEditing: asi != null,
            ),
          );
        },
      ),
    );
  }

  @override
  State<ASIDetailScreen> createState() => _ASIDetailScreenState();
}

class _ASIDetailScreenState extends BaseStatefulWidgetState<ASIDetailScreen> {
  late final AsiDetailCubit _asiDetailCubit;

  @override
  void initState() {
    super.initState();
    _asiDetailCubit = context.read<AsiDetailCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: widget.isEditing ? LocaleKeys.asi_detail.tr() : LocaleKeys.add_asi.tr(),
        subtitle: widget.farmName ?? '',
        trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: BlocBuilder<AsiDetailCubit, AsiDetailState>(
              builder: (context, state) {
                return _buildBody(context, state);
              },
            ),
          ),
          Positioned.fill(
            bottom: MediaQuery.of(context).padding.bottom,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, AsiDetailState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),
          CmoHeaderTile(title: LocaleKeys.details.tr()),
          const SizedBox(height: 12),
          buildSelectCompartment(
            context: context,
            compartmentName: state.asi.compartmentName ?? '',
            compartments: state.compartments,
            userRole: state.userRole,
          ),
          const SizedBox(height: 6),
          buildSelectASIType(
            context: context,
            asi: state.asi,
            types: state.types,
          ),
          const SizedBox(height: 6),
          buildLatLngWidget(),
          const SizedBox(height: 6),
          buildDatePicker(datetime: state.asi.date),
          const SizedBox(height: 6),
          AttributeItem(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 150,
              child: GeneralCommentWidget(
                initialValue: state.asi.comment,
                maxLines: 5,
                hintText: LocaleKeys.generalComments.tr(),
                hintTextStyle: context.textStyles.bodyBold.blueDark2,
                textStyle: context.textStyles.bodyNormal.blueDark2,
                onChanged: _asiDetailCubit.onCommentChanged,
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (state.listAsiPhotos.isNotBlank)
            ...state.listAsiPhotos.map(
              (asiPhoto) => ThumbnailImage(
                asiPhoto: asiPhoto,
                onRemoved: () => _asiDetailCubit.onRemoveAsiPhoto(asiPhoto),
                onChanged: _asiDetailCubit.onUpdateAsiPhoto,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return BlocBuilder<AsiDetailCubit, AsiDetailState>(
      builder: (context, state) {
        final currentDate = state.asi.date;
        return CmoFilledButton(
          title: LocaleKeys.save.tr(),
          loading: state.isLoading,
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.asi.latitude == null) {
              showSnackError(msg: LocaleKeys.location_is_required.tr());
              return;
            }

            if (currentDate == null) {
              showSnackError(msg: LocaleKeys.date_is_required.tr());
              return;
            }

            await _asiDetailCubit.saveAsi();
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  Widget buildSelectCompartment({
    required BuildContext context,
    required String compartmentName,
    required List<Compartment> compartments,
    UserRoleEnum? userRole,
  }) {
    return BottomSheetSelection(
      hintText: LocaleKeys.compartment.tr(),
      value: compartmentName,
      displayHorizontal: false,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      onTap: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        if (compartments.isBlank) return;
        await showCustomBottomSheet<void>(
          context,
          content: SelectCompartmentWidget(
            onSave: _asiDetailCubit.onCompartmentChanged,
            compartments: compartments,
            shouldShowSearchField: userRole == UserRoleEnum.regionalManager,
          ),
        );
      },
    );
  }

  Widget buildSelectASIType(
      {required BuildContext context,
      required Asi asi,
      required List<AsiType> types}) {
    return BottomSheetSelection(
      hintText: LocaleKeys.type.tr(),
      value: asi.asiTypeName,
      displayHorizontal: false,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      onTap: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        if (types.isBlank) return;
        await showCustomBottomSheet<void>(
          context,
          content: ListView.builder(
            itemCount: types.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  _asiDetailCubit.onAsiTypeChanged(
                    asiTypeId: types[index].asiTypeId,
                    asiTypeName: types[index].asiTypeName,
                  );
                  Navigator.pop(context);
                },
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    types[index].asiTypeName ?? '',
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
  }

  Widget buildLatLngWidget() {
    return BlocBuilder<AsiDetailCubit, AsiDetailState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            await AsiMapScreen.push(
              context,
              asi: state.asi,
              onSave: context.read<AsiDetailCubit>().onSelectLocation,
            );
            // final locationModel = LocationModel()
            //   ..latitude = state.asi.latitude
            //   ..longitude = state.asi.longitude;
            // final result = await SelectLocationScreen.push(
            //   context,
            //   title: LocaleKeys.asi_detail.tr(),
            //   farmName: widget.farmName,
            //   locationModel: locationModel,
            //   shouldShowPhotoButton: false,
            // );
            //
            // if (result == null) return;
            // final mapResult = result as LocationModel;
            // context.read<AsiDetailCubit>().onSelectLocation(mapResult);
          },
          child: AttributeItem(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Text(
                  LocaleKeys.lat_long.tr(),
                  style: context.textStyles.bodyBold.black,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Text(
                    state.asi.latitude == null || state.asi.longitude == null
                        ? ''
                        : '${state.asi.latitude!.toStringAsFixed(5)} | ${state.asi.longitude?.toStringAsFixed(5)}',
                    style: context.textStyles.bodyNormal.black,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 8,),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: context.colors.black,
                  size: 32,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildDatePicker({required DateTime? datetime}) {
    String? currentDate;
    if (datetime != null) {
      currentDate = datetime.yMd();
    }

    return DatePickerWidget(
      firstDate: DateTime(2018, 3, 5),
      lastDate: DateTime(DateTime.now().year + 5, 12, 31),
      initialDate: datetime,
      onConfirm: _asiDetailCubit.onDateChanged,
      child: BottomSheetSelection(
        hintText: LocaleKeys.date.tr(),
        value: currentDate,
        displayHorizontal: false,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        rightIconData: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            children: [
              if (datetime != null) Assets.icons.icTick.widget,
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.date_range_sharp,
                color: context.colors.black,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

