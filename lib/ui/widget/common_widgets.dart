import 'package:cmo/extensions/string.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AttributeItem extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isShowError;
  final String? errorText;
  final bool isUnderErrorBorder;
  final bool inactive;
  final Color? underlineColor;

  const AttributeItem({
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 6),
    this.margin = EdgeInsets.zero,
    this.errorText,
    this.isShowError = false,
    this.isUnderErrorBorder = false,
    this.inactive = false,
    this.underlineColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                border: isShowError
                    ? errorBorder(context)
                    : Border(
                        bottom: BorderSide(
                          color: underlineColor ?? context.colors.blueDark2,
                          width: 2,
                        ),
                      ),
                borderRadius: isShowError && !isUnderErrorBorder ? BorderRadius.circular(4) : null,
              ),
              child: child,
            ),
            if (isShowError)
              Container(
                margin: margin,
                alignment: Alignment.centerLeft,
                child: Text(
                  errorText ?? LocaleKeys.required.tr(),
                  style: context.textStyles.bodyNormal.redError.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
        if (inactive)
          const InactiveWidget(),
      ],
    );
  }

  Border errorBorder(BuildContext context) {
    if (isUnderErrorBorder) {
      return Border(
        bottom: BorderSide(
          color: context.colors.redError,
          width: 2,
        ),
      );
    }
    return Border.all(
      color: context.colors.redError,
      width: 2,
    );
  }
}

class InactiveWidget extends StatelessWidget {

  final Color? inactiveColor;
  final EdgeInsets? margin;

  const InactiveWidget({
    super.key,
    this.inactiveColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: margin ?? EdgeInsets.zero,
          color: inactiveColor ?? context.colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}

class AutofillWidget extends StatelessWidget {

  final String title;
  final String? value;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final TextStyle? textStyle;
  final Color? underlineColor;

  const AutofillWidget({
    super.key,
    required this.title,
    required this.value,
    this.padding = const EdgeInsets.fromLTRB(10, 4, 10, 4),
    this.margin = EdgeInsets.zero,
    this.textStyle,
    this.underlineColor,
  });

  @override
  Widget build(BuildContext context) {
    return AttributeItem(
      margin: margin,
      underlineColor: underlineColor,
      child: Container(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: textStyle ?? context.textStyles.bodyBold.blueDark3,
                ),
              ],
            ),
            Text(
              value ?? '',
              style: textStyle ?? context.textStyles.bodyNormal.blueDark3,
            ),
          ],
        ),
      ),
    );
  }
}

class GeoLocationText extends StatelessWidget {
  final LatLng? latLong;

  const GeoLocationText({this.latLong, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: LocaleKeys.lat_long.tr(),
          ),
          const TextSpan(
            text: ' ',
          ),
          TextSpan(
            text: latLong?.latitude.toStringAsFixed(6) ?? '',
            style: context.textStyles.bodyNormal,
          ),
          if (latLong != null)
            TextSpan(
              text: ', ',
              style: context.textStyles.bodyNormal,
            ),
          TextSpan(
            text: latLong?.longitude.toStringAsFixed(6) ?? '',
            style: context.textStyles.bodyNormal,
          ),
        ],
      ),
      style: context.textStyles.bodyBold,
    );
  }
}

class InputAttributeItem extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final int maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? textStyle;
  final bool? isDense;
  final Widget? suffixIcon;

  final EdgeInsetsGeometry contentPadding;
  final FormFieldValidator<String?>? validator;
  final String? initialValue;
  final TextCapitalization? textCapitalization;

  final List<TextInputFormatter> inputFormatters;
  final TextEditingController? controller;
  final ScrollController? scrollController;
  final bool enabled;

  const InputAttributeItem({
    this.hintText,
    this.maxLines = 1,
    this.enabled = true,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.hintTextStyle,
    this.validator,
    this.initialValue,
    this.contentPadding = const EdgeInsets.fromLTRB(14, 4, 14, 4),
    this.textStyle,
    this.labelText,
    this.labelTextStyle,
    this.isDense = false,
    this.textCapitalization,
    super.key,
    this.inputFormatters = const <TextInputFormatter>[],
    this.controller,
    this.scrollController,
    this.suffixIcon,
  });

  @override
  State<InputAttributeItem> createState() => _InputAttributeItemState();
}

class _InputAttributeItemState extends State<InputAttributeItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollController: widget.scrollController,
      minLines: 1,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.sentences,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      onFieldSubmitted: widget.onSubmitted,
      maxLines: widget.maxLines,
      controller: _controller,
      style: widget.textStyle ?? context.textStyles.bodyBold,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator ??
          (value) {
            if (value.isBlank) {
              return widget.labelText ?? widget.hintText ?? '';
            } else {
              return null;
            }
          },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle ??
            context.textStyles.bodyNormal.copyWith(
              color: context.colors.grey,
            ),
        labelText: widget.labelText,
        labelStyle: widget.labelTextStyle ??
            context.textStyles.bodyNormal.copyWith(
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
            ),
        isDense: widget.isDense,
        contentPadding: widget.contentPadding,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints:
            const BoxConstraints(maxWidth: 30, maxHeight: 30),
      ),
    );
  }
}

class YesNoQuestion extends StatelessWidget {
  const YesNoQuestion({
    super.key,
    required this.title,
    required this.value,
    required this.onChangeValue,
    this.textStyle,
    this.padding,
  });

  final bool? value;
  final void Function(bool) onChangeValue;
  final TextStyle? textStyle;
  final String title;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textStyles.bodyBold.copyWith(
              color: context.colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              InkWell(
                onTap: () => onChangeValue(true),
                child: Container(
                  alignment: Alignment.center,
                  width: 110,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: buildColor(value, true),
                    border: Border.all(
                      width: 2,
                      color: (value ?? false)
                          ? Colors.transparent
                          : context.colors.blueDark2,
                    ),
                  ),
                  child: Text(
                    LocaleKeys.yes.tr(),
                    style: (textStyle ?? context.textStyles.bodyNormal).copyWith(
                      color: (value ?? false) ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () => onChangeValue(false),
                child: Container(
                  alignment: Alignment.center,
                  width: 110,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: buildColor(value, false),
                    border: Border.all(
                      width: 2,
                      color: (value ?? true) ? context.colors.blueDark2 : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    LocaleKeys.no.tr(),
                    style: (textStyle ?? context.textStyles.bodyNormal)
                        .copyWith(
                      color: !(value ?? true) ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color buildColor(bool? isSelect, bool isC) {
    if (isC) {
      if (isSelect == null) {
        return Colors.white;
      }
      if (isSelect) {
        return const Color(0xff2072B9);
      }
      return Colors.white;
    }

    if (isSelect == null) {
      return Colors.white;
    }
    if (isSelect) {
      return Colors.white;
    }
    return const Color(0xff2072B9);
  }
}

