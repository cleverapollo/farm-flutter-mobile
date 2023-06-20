import 'dart:async';

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

class AuditQuestionAddCommentScreen extends StatefulWidget {
  const AuditQuestionAddCommentScreen({
    super.key,
    required this.question,
    this.auditId,
    this.comment,
    this.answer,
  });

  final FarmQuestion question;
  final int? auditId;
  final QuestionComment? comment;
  final QuestionAnswer? answer;

  static Future<bool?> push(
    BuildContext context, {
    required FarmQuestion auditQuestion,
    int? auditId,
    QuestionComment? comment,
    QuestionAnswer? answer,
  }) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditQuestionAddCommentScreen(
          question: auditQuestion,
          auditId: auditId,
          comment: comment,
          answer: answer,
        ),
      ),
    );
  }

  @override
  State<AuditQuestionAddCommentScreen> createState() => _AuditQuestionAddCommentScreenState();
}

class _AuditQuestionAddCommentScreenState extends State<AuditQuestionAddCommentScreen> {

  final _formKey = GlobalKey<FormBuilderState>();

  bool loading = false;

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AuditQuestionCommentCubit>().initialize(
            question: widget.question,
            auditId: widget.auditId,
          );
    });
  }

  Future<void> save() async {

    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;

      if (value == null) return;
      setState(() {
        loading = true;
      });

      try {
        await hideInputMethod();
        if (context.mounted) {
          final rejectReasonId =
              value['rejectId'] as int? ?? widget.answer?.rejectReasonId;
          final comment = value['Comment']?.toString() ?? '';
          var success = false;
          if (widget.comment == null) {
            success =
                await context.read<AuditQuestionCommentCubit>().addComment(
                      commentValue: comment,
                    );
          } else {
            success =
                await context.read<AuditQuestionCommentCubit>().updateComment(
                      commentValue: comment,
                      comment: widget.comment!,
                    );
          }

          await context.read<AuditListQuestionsCubit>().updateQuestionAnswer(
                questionId: widget.question.questionId,
                rejectReasonId: rejectReasonId,
              );

          if (success && context.mounted) {
            Navigator.of(context).pop(true);
          }
        }
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.comments.tr(),
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:  FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                if (widget.question.xBone ?? false)
                  Icon(
                    IconsaxOutline.danger,
                    size: 24.0,
                    color: context.colors.red,
                  ),
                _buildQuestionValue(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Divider(
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: context.colors.black,
                  ),
                ),
                _selectReasonDropdown(context),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
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
              ],
            ),
          ),
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          CmoFilledButton(
            onTap: save,
            title: LocaleKeys.save.tr(),
            loading: loading,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionValue() {
    return Text(
      widget.question.questionValue ?? '',
      maxLines: 2,
      style: context.textStyles.bodyBold.black,
    );
  }

  Widget _selectReasonDropdown(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.reason.tr(),
          style: context.textStyles.bodyBold.black,
        ),
        BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, List<RejectReason>>(
          selector: (state) {
            return state.rejectReasons;
          },
          builder: (context, rejectReasons) {
            return CmoDropdown(
              name: 'rejectId',
              hintText: LocaleKeys.reason.tr(),
              validator: requiredValidator,
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                hintText: '${LocaleKeys.select.tr()} ${LocaleKeys.reason.tr().toLowerCase()}',
                hintStyle: context.textStyles.bodyNormal.grey,
                border: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.grey)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.blue)),
              ),
              initialValue: widget.answer?.rejectReasonId,
              onChanged: (int? id) {
                if (id == -1) {
                  _formKey.currentState!.fields['rejectId']?.reset();
                }
              },
              itemsData: rejectReasons
                  .map(
                    (e) => CmoDropdownItem(
                  id: e.rejectReasonId,
                  name: e.rejectReasonName ?? '',
                ),
              )
                  .toList()
                ..insert(
                  0,
                  CmoDropdownItem(
                    id: -1,
                    name: LocaleKeys.reason.tr(),
                  ),
                ),
            );
          },
        )
      ],
    );
  }
}
