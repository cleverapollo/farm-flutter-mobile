import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
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
  });

  final FarmQuestion question;
  final int? auditId;

  static Future<bool?> push(
    BuildContext context, {
    required FarmQuestion auditQuestion,
    int? auditId,
  }) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditQuestionAddCommentScreen(
          question: auditQuestion,
          auditId: auditId,
        ),
      ),
    );
  }

  @override
  State<AuditQuestionAddCommentScreen> createState() => _AuditQuestionAddCommentScreenState();
}

class _AuditQuestionAddCommentScreenState extends State<AuditQuestionAddCommentScreen> {
  Timer? _debounceInputTimer;

  late FarmQuestion auditQuestion;
  final _formKey = GlobalKey<FormBuilderState>();

  String commentValue = '';
  bool loading = false;

  @override
  void initState() {
    super.initState();
    auditQuestion = widget.question;
    Future.microtask(() async {
      await context.read<AuditQuestionCommentCubit>().initialize(
            question: auditQuestion,
            auditId: widget.auditId,
          );
    });
  }

  Future<void> _addComment() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;

      if (value == null) return;
      setState(() {
        loading = true;
      });

      try {
        await hideInputMethod();
        if (context.mounted) {
          final rejectReasonId = value['rejectId'] as int;
          final comment = value['Comment']?.toString() ?? '';
          final success =
              await context.read<AuditQuestionCommentCubit>().addComment(
                    commentValue: comment,
                  );

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

      await refresh();
    }
  }

  Future<void> refresh() async {
    if (context.mounted) {
      await context.read<AuditListCubit>().refresh();
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
                if (auditQuestion.xBone ?? false)
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
                    // initialValue: widget.comment?.comment,
                  ),
                ),
                // Expanded(child: _buildAddComment()),
              ],
            ),
          ),
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          CmoFilledButton(
            onTap: _addComment,
            title: LocaleKeys.save.tr(),
            loading: loading,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionValue() {
    return Text(
      auditQuestion.questionValue ?? '',
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

  Widget _buildAddComment() {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 4,
      child: TextFormField(
        keyboardAppearance: Brightness.light,
        textAlign: TextAlign.left,
        style: context.textStyles.bodyBold.black,
        minLines: 1,
        maxLines: 1000,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: LocaleKeys.addComment.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        initialValue: context.read<AuditQuestionCommentCubit>().state.questionComment?.comment,
        onChanged: (text) {
          _debounceInputTimer?.cancel();
          _debounceInputTimer = Timer(
            const Duration(milliseconds: 200),
            () => setState(() {
              commentValue = text;
            }),
          );
        },
      ),
    );
  }
}
