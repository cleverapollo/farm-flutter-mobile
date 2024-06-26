import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class GeneralCommentsItem extends StatelessWidget {
  const GeneralCommentsItem({
    super.key,
    required this.comment,
  });
  final String? comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.general_comments.tr(),
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
