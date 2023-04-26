import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AttributeItem extends StatelessWidget {
  final Widget child;

  const AttributeItem({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: context.colors.grey),
        ),
      ),
      child: child,
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
          const TextSpan(
            text: 'Lat | Long',
          ),
          const TextSpan(
            text: ' ',
          ),
          TextSpan(
            text: latLong?.latitude.toStringAsFixed(6)  ?? '',
            style: context.textStyles.bodyNormal,
          ),
          TextSpan(
            text: ', ',
            style: context.textStyles.bodyNormal,
          ),
          TextSpan(
            text: latLong?.longitude.toStringAsFixed(6)  ?? '',
            style: context.textStyles.bodyNormal,
          ),
        ],
      ),
      style: context.textStyles.bodyBold,
    );
  }
}

class InputAttributeItem extends StatefulWidget {
  final String hintText;
  final int maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextStyle? hintTextStyle;

  const InputAttributeItem({
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.onChanged,
    this.hintTextStyle,
    super.key,
  });

  @override
  State<InputAttributeItem> createState() => _InputAttributeItemState();
}

class _InputAttributeItemState extends State<InputAttributeItem> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      onChanged: widget.onChanged,
      maxLines: _controller.text.isEmpty ? widget.maxLines : 1,
      controller: _controller,
      style: context.textStyles.bodyBold,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: _controller.text.isEmpty ? null : widget.hintText,
        labelStyle: context.textStyles.bodyNormal.copyWith(fontSize: 16, overflow: TextOverflow.ellipsis),
        hintStyle: widget.hintTextStyle ?? context.textStyles.bodyNormal.copyWith(color: context.colors.grey),
        contentPadding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}