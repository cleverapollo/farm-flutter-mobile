import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AssessmentRaiseComment extends StatefulWidget {
  const AssessmentRaiseComment({
    super.key,
    required this.assessment,
    required this.question,
    required this.compliance,
    required this.onSaveSuccess,
    this.comment,
    this.rejectReasonId,
  });

  final Assessment assessment;
  final CompanyQuestion question;
  final Compliance? compliance;
  final QuestionComment? comment;
  final int? rejectReasonId;
  final void Function(QuestionComment, int?) onSaveSuccess;

  static Future<T?> push<T>(
    BuildContext context,
    Assessment assessment,
    CompanyQuestion question,
    Compliance? compliance,
    void Function(QuestionComment, int?) onSaveSuccess,
    QuestionComment? comment,
    int? rejectReasonId,
  ) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (_) => AssessmentRaiseComment(
          assessment: assessment,
          question: question,
          compliance: compliance,
          onSaveSuccess: onSaveSuccess,
          comment: comment,
          rejectReasonId: rejectReasonId,
        ),
      ),
    );
  }

  @override
  State<AssessmentRaiseComment> createState() => _AssessmentRaiseCommentState();
}

class _AssessmentRaiseCommentState extends State<AssessmentRaiseComment> {
  final _formKey = GlobalKey<FormBuilderState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  List<RejectReason> rejectReasons = <RejectReason>[];

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      setState(() {
        rejectReasons =
            context.read<AssessmentQuestionCubit>().getRejectReasons();
      });
    });
  }

  void _save() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final value = _formKey.currentState?.value;
      if (value == null) return;
      final latestIndex =
          await cmoDatabaseMasterService.getQuestionCommentsLatestIndex();
      final rejectReasonId = int.tryParse(value['RejectReason'].toString()) ??
          widget.rejectReasonId;
      final comment = value['Comment']?.toString() ?? '';

      final questionComment = widget.comment == null
          ? QuestionComment(
              commentId: latestIndex + 1,
              comment: comment,
              assessmentId: widget.assessment.assessmentId,
              questionId: widget.question.questionId,
            )
          : widget.comment!.copyWith(
              comment: comment,
            );
      widget.onSaveSuccess.call(
        questionComment,
        rejectReasonId,
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Scaffold(
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
            if (widget.question.xBone ?? false)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  IconsaxOutline.danger,
                  size: 24.0,
                  color: context.colors.red,
                ),
              ),
            Text(
              widget.question.questionValue ?? '',
              style: context.textStyles.bodyBold,
            ),
            const SizedBox(height: 16),
            CmoOptionTile(
              title: LocaleKeys.reason.tr(),
              shouldShowDividerTop: true,
              shouldShowDivider: false,
              arrowDirection: ArrowDirection.down,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CmoDropdown(
                  name: 'RejectReason',
                  hintText: LocaleKeys.reject_reason.tr(),
                  validator: requiredValidator,
                  initialValue: widget.rejectReasonId,
                  onChanged: (int? id) {
                    if (id == -1) {
                      _formKey.currentState!.fields['RejectReason']?.reset();
                    }
                  },
                  itemsData: rejectReasons
                      .map(
                        (e) => CmoDropdownItem(
                          id: e.rejectReasonId,
                          name: e.rejectReasonName ?? '',
                        ),
                      )
                      .toList()),
            ),
            const SizedBox(height: 8),
            CmoOptionTile(
              title: LocaleKeys.comments.tr(),
              shouldShowDividerTop: true,
              shouldShowDivider: false,
              shouldShowArrow: false,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0).copyWith(top: 0),
                child: CmoTextField(
                  name: 'Comment',
                  validator: requiredValidator,
                  hintText: LocaleKeys.addComment.tr(),
                  maxLines: 999,
                  autocorrect: true,
                  enableSuggestions: true,
                  initialValue: widget.comment?.comment,
                ),
              ),
            ),
            CmoFilledButton(
              onTap: _save,
              title: LocaleKeys.save.tr(),
            ),
            const SafeArea(top: false, child: SizedBox(height: 24))
          ],
        ),
      ),
    );
  }
}
