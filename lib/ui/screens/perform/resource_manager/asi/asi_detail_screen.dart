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
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
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
              campId : campId,
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
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colors.white,
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                    child: CmoTextField(
                      hintText: LocaleKeys.asi_no.tr(),
                      onChanged: (value) {
                        _asi = _asi.copyWith(asiRegisterNo: value);
                      },
                      validator: requiredValidator,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      right: 8.0,
                      left: 8.0,
                    ),
                    child: BlocSelector<AsiDetailCubit, AsiDetailState,
                        List<Compartment>>(
                      selector: (state) => state.compartments,
                      builder: (context, compartments) {
                        return CmoDropdown<Compartment>(
                          name: '',
                          hintText: LocaleKeys.compartment.tr(),
                          onChanged: (Compartment? value) {
                            if (value != null) {
                              _asi = _asi.copyWith(
                                compartmentId: value.compartmentId,
                                compartmentName: value.compartmentName,
                              );
                            }
                          },
                          itemsData: compartments.isBlank
                              ? []
                              : compartments
                                  .map(
                                    (e) => CmoDropdownItem<Compartment>(
                                      id: e,
                                      name: e.compartmentName ?? '',
                                    ),
                                  )
                                  .toList(),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                    child: BlocSelector<AsiDetailCubit, AsiDetailState, List<AsiType>?>(
                      selector: (state) => state.types,
                      builder: (context, types) {
                        return CmoDropdown<AsiType>(
                          validator: requiredValidator,
                          name: '',
                          hintText: LocaleKeys.type.tr(),
                          onChanged: (AsiType? value) {
                            if (value != null) {
                              _asi = _asi.copyWith(
                                asiTypeId: value.asiTypeId,
                                asiTypeName: value.asiTypeName,
                              );
                            }
                          },
                          itemsData: types == null
                              ? []
                              : types
                                  .map(
                                    (e) => CmoDropdownItem<AsiType>(
                                      id: e,
                                      name: e.asiTypeName ?? '',
                                    ),
                                  )
                                  .toList(),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                    child: CmoDropDownLayoutWidget(
                      showTick: widget.locationModel?.latitude != null,
                      title: LocaleKeys.lat_long.tr(),
                      subTitle:
                          '${widget.locationModel?.latitude?.toStringAsFixed(5)} | ${widget.locationModel?.longitude?.toStringAsFixed(5)}',
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                    child: CmoDropDownLayoutWidget(
                      showTick: currentDate.isNotEmpty,
                      onTap: () async {
                        final result = await DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2018, 3, 5),
                            maxTime: DateTime(DateTime.now().year + 5, 12, 31),
                            onChanged: (date) {},
                            onConfirm: (date) {},
                            currentTime: DateTime.now());

                        final format = DateFormat('dd MM yyyy');
                        currentDate = format.format(result ?? DateTime.now());
                        _asi = _asi.copyWith(date: result);
                        if (mounted) setState(() {});
                      },
                      title: LocaleKeys.date.tr(),
                      subTitle: '$currentDate',
                      trailingWidget: const Icon(Icons.date_range_sharp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                    child: CmoTextField(
                      hintText: LocaleKeys.comments.tr(),
                      maxLines: 5,
                      onChanged: (value) {
                        _asi = _asi.copyWith(comment: value);
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  buildImageWidget(),
                  const SizedBox(height: 40),
                  CmoFilledButton(
                    title: LocaleKeys.save.tr(),
                    onTap: () async {
                      if (_formKey.currentState?.validate() == false) {
                        return;
                      }
                      if (widget.locationModel?.latitude == null) {
                        showSnackError(
                          msg: LocaleKeys.location_is_required.tr()
                        );
                        return;
                      }
                      if (currentDate.isEmpty) {
                        showSnackError(
                            msg: LocaleKeys.date_is_required.tr()
                        );
                        return;
                      }
                      await context.read<AsiDetailCubit>().saveAsi(
                            _asi,
                            widget.locationModel?.imageUri,
                          );
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageWidget() {
    if (widget.locationModel!.imageUri.isBlank) return const SizedBox.shrink();
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
            onTap: () {
              widget.onRemoved?.call();
            },
            child: Assets.icons.icClose.svgBlack,
          ),
        ],
      ),
    );
  }
}
