import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class InformationText extends StatelessWidget {
  final EdgeInsets? padding;

  InformationText({
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 25, 22, 6),
      child: Text(
        LocaleKeys.disciplinary_detail_text_information.tr(),
        style: context.textStyles.bodyNormal.blueDark3,
        maxLines: 2,
      ),
    );
  }
}
