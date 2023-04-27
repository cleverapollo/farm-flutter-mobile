import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class GeneralCommentsItem extends StatelessWidget {
  final String? comment;

  const GeneralCommentsItem({super.key, required this.comment,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.generalComments.tr(),
            style: context.textStyles.bodyNormal.black,
          ),
          Text(
            comment ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.bodyNormal.black,
          ),
        ],
      ),
    );
  }
}
