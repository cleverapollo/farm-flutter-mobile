import 'package:cmo/extensions/date.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/rm_asi/asi_detail_cubit.dart';
import 'package:cmo/state/rm_asi/asi_detail_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/thumbnail_image.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ASIDetailScreen extends StatefulWidget {
  const ASIDetailScreen({super.key, this.farmName});

  final String? farmName;

  static Future<void> push(
    BuildContext context, {
    required Asi asi,
    required LocationModel? locationModel,
    String? farmName,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AsiDetailCubit(
              locationModel: locationModel,
              asi: asi,
            )..fetchData(),
            child: ASIDetailScreen(
              farmName: farmName,
            ),
          );
        },
      ),
    );
  }

  @override
  State<ASIDetailScreen> createState() => _ASIDetailScreenState();
}

class _ASIDetailScreenState extends State<ASIDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late final AsiDetailCubit _asiDetailCubit;

  @override
  void initState() {
    super.initState();
    _asiDetailCubit = context.read<AsiDetailCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CmoAppBarV2(
          title: LocaleKeys.addASI.tr(),
          subtitle: widget.farmName ?? '',
          showTrailing: true,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: FormBuilder(
                key: _formKey,
                child: BlocBuilder<AsiDetailCubit, AsiDetailState>(
                  builder: (context, state) {
                    return _buildBody(context, state);
                  },
                ),
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
      ),
    );
  }

  Widget _buildBody(BuildContext context, AsiDetailState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CmoHeaderTile(title: LocaleKeys.asi.tr()),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: buildSelectCompartment(
              context: context,
              compartmentName: state.asi.compartmentName ?? '',
              compartments: state.compartments,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: buildSelectASIType(
              context: context,
              asi: state.asi,
              types: state.types,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: buildLatLngWidget(state.locationModel),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: buildDatePicker(datetime: state.asi.date),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildCommentWidget(comment: state.asi.comment),
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
        final locationModel = state.locationModel;
        final currentDate = state.asi.date;
        return CmoFilledButton(
          title: LocaleKeys.save.tr(),
          loading: state.isLoading,
          onTap: () async {
            if (_formKey.currentState?.validate() == false) {
              return;
            }
            if (locationModel?.latitude == null) {
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
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  Widget _buildCommentWidget({required String? comment}) {
    return CmoTextField(
      inputDecoration: _buildInputDecoration(
        context,
        LocaleKeys.comments.tr(),
      ),
      name: comment ?? '',
      initialValue: comment,
      maxLines: 5,
      onChanged: (value) {
        _asiDetailCubit.onCommentChanged(comment: value);
      },
    );
  }

  Widget buildSelectCompartment({
    required BuildContext context,
    required String compartmentName,
    required List<Compartment> compartments,
  }) {
    return BottomSheetSelection(
      hintText: LocaleKeys.compartment.tr(),
      value: compartmentName,
      onTap: () async {
        FocusScope.of(context).unfocus();
        if (compartments.isBlank) return;
        await showCustomBottomSheet<void>(
          context,
          content: ListView.builder(
            itemCount: compartments.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  _asiDetailCubit.onCompartmentChanged(compartments[index]);
                  Navigator.pop(context);
                },
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    compartments[index].unitNumber ?? '',
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

  Widget buildSelectASIType(
      {required BuildContext context,
      required Asi asi,
      required List<AsiType> types}) {
    return BottomSheetSelection(
      hintText: LocaleKeys.type.tr(),
      value: asi.asiTypeName,
      onTap: () async {
        FocusScope.of(context).unfocus();
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

  Widget buildLatLngWidget(LocationModel? locationModel) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.grey),
        ),
      ),
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
              '${locationModel?.latitude?.toStringAsFixed(5)} | ${locationModel?.longitude?.toStringAsFixed(5)}',
              style: context.textStyles.bodyNormal.black,
              textAlign: TextAlign.center,
            ),
          ),
          if (locationModel?.latitude != null) Assets.icons.icTick.widget,
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: context.colors.black,
            size: 32,
          )
        ],
      ),
    );
  }

  Widget buildDatePicker({required DateTime? datetime}) {
    String? currentDate;
    if (datetime != null) {
      currentDate = datetime.yMd();
    }
    return BottomSheetSelection(
      hintText: LocaleKeys.date.tr(),
      value: currentDate,
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
      onTap: () async {
        FocusScope.of(context).unfocus();
        final result = await showDatePicker(
            context: context,
            initialDate: datetime ?? DateTime.now(),
            firstDate: DateTime(2018, 3, 5),
            lastDate: DateTime(DateTime.now().year + 5, 12, 31),
        );
        _asiDetailCubit.onDateChanged(date: result);
      },
    );
  }

  InputDecoration _buildInputDecoration(
    BuildContext context,
    String hintText,
  ) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      hintText: hintText,
      hintStyle: context.textStyles.bodyBold.black,
      isDense: true,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.blue),
      ),
    );
  }
}

