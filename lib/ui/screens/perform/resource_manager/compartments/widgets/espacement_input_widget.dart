import 'package:flutter/cupertino.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Espacement { w, l }

class EspacementInputWidget extends StatefulWidget {
  const EspacementInputWidget({
    required this.widthValue,
    required this.lengthValue,
    required this.onWidthChanged,
    required this.onLengthChanged,
    super.key,
  });

  final ValueChanged<String?> onWidthChanged;
  final ValueChanged<String?> onLengthChanged;
  final String widthValue;
  final String lengthValue;

  @override
  State<EspacementInputWidget> createState() => _EspacementInputState();
}

class _EspacementInputState extends State<EspacementInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildBody(
          value: widget.widthValue,
          espacement: Espacement.w,
          onWidthLengthChanged: widget.onWidthChanged,
        ),
        const SizedBox(width: 16),
        _buildBody(
          value: widget.lengthValue,
          espacement: Espacement.l,
          onWidthLengthChanged: widget.onLengthChanged,
        )
      ],
    );
  }

  Widget _buildBody({
    required String value,
    required Espacement espacement,
    required ValueChanged<String?> onWidthLengthChanged,
  }) {
    return SizedBox(
      width: 64,
      height: 38,
      child: CmoTextField(
        hintText: espacement == Espacement.w ? 'W' : 'L',
        textAlign: TextAlign.center,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: value,
        hintStyle: context.textStyles.bodyNormal,
        onChanged: onWidthLengthChanged,
      ),
    );
  }
}
