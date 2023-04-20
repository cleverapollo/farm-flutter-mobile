import 'dart:async';

import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/validator.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AuditListCommentScreen extends StatefulWidget {
  const AuditListCommentScreen({
    super.key,
    required this.questionId,
    required this.auditQuestion,
  });

  final int? questionId;
  final AuditQuestion auditQuestion;

  static void push(
    BuildContext context, {
    required int? questionId,
    required AuditQuestion auditQuestion,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditListCommentScreen(
          questionId: questionId,
          auditQuestion: auditQuestion,
        ),
      ),
    );
  }

  @override
  State<AuditListCommentScreen> createState() => _AuditListCommentScreenState();
}

class _AuditListCommentScreenState extends State<AuditListCommentScreen> {
  Timer? _debounceInputTimer;

  late AuditQuestion auditQuestion;
  final _formKey = GlobalKey<FormBuilderState>();

  String commentValue = '';
  String rejectReason = '';
  int rejectId = -1;

  @override
  void initState() {
    super.initState();
    auditQuestion = widget.auditQuestion;
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
              _selectReasonDropdown(),
              const SizedBox(
                height: 15,
              ),
              Expanded(child: _buildAddComment()),
            ],
          ),
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          CmoFilledButton(
            onTap: () {
              context.read<AuditListQuestionsCubit>().addComment(
                    rejectId: rejectId,
                    rejectReason: rejectReason,
                    questionId: widget.questionId,
                    commentValue: commentValue,
                  );
              Navigator.of(context).pop();
            },
            title: LocaleKeys.save.tr(),
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

  Widget _selectReasonDropdown() {
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
                  _formKey.currentState!.fields['reasonId']?.reset();
                }

                setState(() {
                  final reason = rejectReasons.firstWhereOrNull((element) => element.rejectReasonId == id)?.rejectReasonName;
                  rejectReason = reason ?? LocaleKeys.reason.tr();
                  rejectId = id ?? -1;
                });
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
