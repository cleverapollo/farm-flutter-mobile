import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class CmoSwitch extends StatelessWidget {
  const CmoSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.title = '',
  });

  final String title;

  final void Function(bool)? onChanged;

  final bool value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.textStyles.bodyBold.blueDark2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: context.colors.blue71B8,
            thumbColor: context.colors.blueDark2,
            trackColor: context.colors.grey,
          ),
        ],
      ),
    );
  }
}
