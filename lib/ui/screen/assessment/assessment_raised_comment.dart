import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class AssessmentRaiseComment extends StatelessWidget {
  const AssessmentRaiseComment({
    super.key,
    required this.assessment,
    required this.question,
    required this.compliance,
  });

  final Assessment assessment;
  final CompanyQuestion question;
  final Compliance compliance;

  static void push(
    BuildContext context,
    Assessment assessment,
    CompanyQuestion question,
    Compliance compliance,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssessmentRaiseComment(
          assessment: assessment,
          question: question,
          compliance: compliance,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.comments.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Row(),
          if (question.xBone ?? false)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Icon(
                IconsaxOutline.danger,
                size: 24.0,
                color: context.colors.red,
              ),
            ),
          Text(
            question.questionValue ?? '',
            style: context.textStyles.bodyBold,
          ),
          const SizedBox(height: 16),
          CmoOptionTile(
            title: LocaleKeys.reason.tr(),
            shouldShowDividerTop: true,
            arrowDirection: ArrowDirection.down,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: CmoTextField(
                name: 'comments',
                hintText: LocaleKeys.addComment.tr(),
                maxLines: 999,
              ),
            ),
          ),
          CmoFilledButton(
            title: LocaleKeys.save.tr(),
          ),
          const SafeArea(top: false, child: SizedBox(height: 24))
        ],
      ),
    );
  }
}
