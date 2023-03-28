import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class AssessmentListCommentScreen extends StatelessWidget {
  const AssessmentListCommentScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AssessmentListCommentScreen(),
      ),
    );
  }

  _newComment() {
    // * open alert new comment
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.comments.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: const Placeholder(),
      persistentFooterButtons: [
        CmoFilledButton(
          onTap: Navigator.of(context).pop,
          title: 'Close',
        ),
        CmoFilledButton(
          onTap: _newComment,
          title: 'New Comment',
        ),
      ],
    );
  }
}
