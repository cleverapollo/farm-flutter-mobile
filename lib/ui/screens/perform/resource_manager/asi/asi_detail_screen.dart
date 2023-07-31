import 'dart:convert';
import 'dart:io';

import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/state/rm_asi/asi_detail_cubit.dart';
import 'package:cmo/state/rm_asi/asi_detail_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/utils/utils.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ASIDetailScreen extends StatefulWidget {
  const ASIDetailScreen({super.key, this.locationModel, this.farmName});

  final LocationModel? locationModel;
  final String? farmName;

  static Future push(
    BuildContext context, {
    LocationModel? locationModel,
    required String farmId,
    String? farmName,
    String? campId,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AsiDetailCubit(
              farmId ?? '',
              locationModel: locationModel,
              campId: campId,
            )..fetchData(),
            child: ASIDetailScreen(
              locationModel: locationModel,
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
  String currentDate = '';
  Asi _asi = Asi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CmoHeaderTile(title: LocaleKeys.asiNumber.tr()),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: buildASINoWidget(),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: buildSelectCompartment(),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: buildSelectASIType(),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: buildLatLngWidget(),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: buildDatePicker(),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CmoTextField(
                        inputDecoration: _buildInputDecoration(
                          context,
                          LocaleKeys.comments.tr(),
                        ),
                        maxLines: 5,
                        onChanged: (value) {
                          _asi = _asi.copyWith(comment: value);
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (widget.locationModel!.imageUri.isNotBlank)
                      buildImageItem(
                        imageUri: widget.locationModel!.imageUri,
                        onRemove: () {
                          setState(() {
                            widget.locationModel!.imageUri = null;
                          });
                        },
                      ),
                    if (widget.locationModel!.listImage.isNotBlank)
                      ...widget.locationModel!.listImage.map(
                            (e) =>
                            buildImageItem(
                              imageUri: e,
                              onRemove: () {
                                setState(() {
                                  widget.locationModel!.listImage.remove(e);
                                });
                              },
                            ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: MediaQuery.of(context).padding.bottom,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CmoFilledButton(
                title: LocaleKeys.save.tr(),
                onTap: () async {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }
                  if (widget.locationModel?.latitude == null) {
                    showSnackError(msg: LocaleKeys.location_is_required.tr());
                    return;
                  }
                  if (currentDate.isEmpty) {
                    showSnackError(msg: LocaleKeys.date_is_required.tr());
                    return;
                  }
                  await context.read<AsiDetailCubit>().saveAsi(
                        _asi,
                        widget.locationModel!.listImage.isBlank &&
                                widget.locationModel!.imageUri.isNotBlank
                            ? [widget.locationModel!.imageUri!]
                            : widget.locationModel!.listImage,
                      );
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildASINoWidget() {
    return CmoTextField(
      hintText: LocaleKeys.asi_no.tr(),
      validator: requiredValidator,
      inputDecoration: _buildInputDecoration(
        context,
        LocaleKeys.asi_no.tr(),
      ),
      onChanged: (value) {
        _asi = _asi.copyWith(asiRegisterNo: value);
      },
    );
  }

  Widget buildSelectCompartment() {
    return BlocSelector<AsiDetailCubit, AsiDetailState, List<Compartment>>(
      selector: (state) => state.compartments,
      builder: (context, compartments) {
        return BottomSheetSelection(
          hintText: LocaleKeys.compartment.tr(),
          value: _asi.compartmentName,
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
                      setState(() {
                        _asi = _asi.copyWith(
                          compartmentId: int.tryParse(compartments[index].managementUnitId ?? ''),
                          compartmentName: compartments[index].managementUnitName,
                        );
                      });

                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        compartments[index].managementUnitName ?? '',
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
      },
    );
  }

  Widget buildSelectASIType() {
    return BlocSelector<AsiDetailCubit, AsiDetailState, List<AsiType>?>(
      selector: (state) => state.types,
      builder: (context, types) {
        return BottomSheetSelection(
          hintText: LocaleKeys.type.tr(),
          value: _asi.asiTypeName,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (types.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: types!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        _asi = _asi.copyWith(
                          asiTypeId: types[index].asiTypeId,
                          asiTypeName: types[index].asiTypeName,
                        );
                      });

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
      },
    );
  }

  Widget buildLatLngWidget() {
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
              '${widget.locationModel?.latitude?.toStringAsFixed(5)} | ${widget
                  .locationModel?.longitude?.toStringAsFixed(5)}',
              style: context.textStyles.bodyNormal.black,
              textAlign: TextAlign.center,
            ),
          ),
          if (widget.locationModel?.latitude != null)
            Assets.icons.icTick.widget,
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: context.colors.black,
            size: 32,
          )
        ],
      ),
    );
  }

  Widget buildDatePicker() {
    return BottomSheetSelection(
      hintText: LocaleKeys.date.tr(),
      value: currentDate,
      rightIconData: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Row(
          children: [
            if (currentDate.isNotEmpty) Assets.icons.icTick.widget,
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
        final result = await DatePicker.showDatePicker(
          context,
          minTime: DateTime(2018, 3, 5),
          maxTime: DateTime(DateTime
              .now()
              .year + 5, 12, 31),
          onChanged: (date) {},
          onConfirm: (date) {},
          currentTime: DateTime.now(),
        );

        final format = DateFormat('dd MM yyyy');
        currentDate = format.format(result ?? DateTime.now());
        _asi = _asi.copyWith(date: result);
        if (mounted) setState(() {});
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

  Widget buildImageItem({
    String? imageUri,
    VoidCallback? onRemove,
  }) {
    if (imageUri.isBlank) return const SizedBox.shrink();
    return _ThumbnailImage(
      widget.locationModel!.imageUri!,
      onRemoved: () {
        setState(() {
          widget.locationModel!.imageUri = null;
        });
      },
      onChanged: (path) {
        setState(() {
          widget.locationModel!.imageUri = path;
        });
      },
    );
  }
}

class _ThumbnailImage extends StatefulWidget {
  final String uri;
  final Function()? onRemoved;
  final Function(String)? onChanged;

  const _ThumbnailImage(
    this.uri, {
    this.onRemoved,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<_ThumbnailImage> createState() => _ThumbnailImageState();
}

class _ThumbnailImageState extends State<_ThumbnailImage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.uri;
    context.read<AsiDetailCubit>().onPhotoNameChanged(_controller.text);
    _controller.addListener(() {
      context.read<AsiDetailCubit>().onPhotoNameChanged(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: context.colors.white,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              final imageProvider = FileImage(File(widget.uri));
              showImageViewer(context, imageProvider);
            },
            child: Image.file(
                File(widget.uri),
                fit: BoxFit.fitHeight,
                width: 74,
                height: 74,
              ),
            // Image.memory(
            //   base64Decode(widget.uri),
            //   fit: BoxFit.fitHeight,
            //   width: 74,
            //   height: 74,
            // ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: 1,
              style: context.textStyles.bodyBold.black,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              var path = (await ImagePickerService().pickImageFromGallery())?.path;
              if (path != null) {
                widget.onChanged?.call(path);
              }
            },
            child: Assets.icons.icSelectPhotoMap.svg(width: 32, height: 32),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              var path = (await ImagePickerService().pickImageFromCamera())?.path;
              if (path != null) {
                widget.onChanged?.call(path);
              }
            },
            child: Assets.icons.icTakePhotoMap.svg(width: 32, height: 32),
          ),
          const SizedBox(width: 8),
          CmoTappable(
            onTap: () => widget.onRemoved?.call(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Assets.icons.icClose.svgBlack,
            ),
          ),
        ],
      ),
    );
  }
}
