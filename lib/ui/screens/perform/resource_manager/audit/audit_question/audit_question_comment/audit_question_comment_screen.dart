import 'dart:async';

import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditQuestionCommentScreen extends StatefulWidget {
  const AuditQuestionCommentScreen({
    super.key,
    required this.question,
    this.comment,
    this.answer,
  });

  final FarmQuestion question;
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
        builder: (_) => BlocProvider(
          create: (_) => AuditQuestionCommentCubit()..initialize(
            question: auditQuestion,
            auditId: auditId,
            questionAnswer: answer,
            comment: comment,
          ),
          child: AuditQuestionCommentScreen(
            question: auditQuestion,
            comment: comment,
            answer: answer,
          ),
        ),
      ),
    );
  }

  @override
  State<AuditQuestionCommentScreen> createState() => _AuditQuestionCommentScreenState();
}

class _AuditQuestionCommentScreenState extends State<AuditQuestionCommentScreen> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> save() async {
    await hideInputMethod();
    if (context.mounted) {
      await context.read<AuditListQuestionsCubit>().updateQuestionAnswer(
        questionId: widget.question.questionId,
        rejectReasonId: context
            .read<AuditQuestionCommentCubit>()
            .state
            .selectedRejectReason
            ?.rejectReasonId,
      );

      await context.read<AuditQuestionCommentCubit>().saveQuestionComment();

      if (context.mounted) {
        Navigator.of(context).pop(true);
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
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                if (widget.question.xBone ?? false)
                  Icon(
                    IconsaxOutline.danger,
                    size: 30.0,
                    color: context.colors.red,
                  ),
                const SizedBox(
                  height: 16,
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
                buildCommentTextField(),
                editIcon(),
              ],
            ),
          ),
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          BlocBuilder<AuditQuestionCommentCubit, AuditQuestionCommentState>(
            builder: (context, state) {
              return CmoFilledButton(
                disable: state.selectedRejectReason == null || state.questionComment!.comment.isBlank,
                onTap: save,
                title: LocaleKeys.save.tr(),
                loading: state.loading,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionValue() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '${widget.question.indicatorName ?? ''} ',
            style: context.textStyles.bodyBold.black,
          ),
          TextSpan(
            text: '${widget.question.questionValue}',
            style: context.textStyles.bodyNormal,
          ),
        ],
      ),
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
        BlocBuilder<AuditQuestionCommentCubit, AuditQuestionCommentState>(
          builder: (context, state) {
            return CmoCustomDropdown<RejectReason>(
              actionKey: 'reject_reason',
              enable: state.isEditing,
              listItems: state.rejectReasons
                  .map((item) => OptionItem<RejectReason>(id: item, title: item.rejectReasonName ?? ''))
                  .toList()..insert(
                0,
                OptionItem<RejectReason>(
                  id: const RejectReason(rejectReasonId: -1),
                  title: '${LocaleKeys.select.tr()} ${LocaleKeys.reason.tr().toLowerCase()}',
                ),
              ),
              hintText: '${LocaleKeys.select.tr()} ${LocaleKeys.reason.tr().toLowerCase()}',
              itemSelected: state.selectedRejectReason == null
                  ? null
                  : OptionItem<RejectReason>(
                id: state.selectedRejectReason!,
                title: state.selectedRejectReason!.rejectReasonName ?? '',
              ),
              onSelected: context.read<AuditQuestionCommentCubit>().setSelectedRejectReason,
            );
          },
        ),
      ],
    );
  }

  Widget buildCommentTextField() {
    return BlocBuilder<AuditQuestionCommentCubit, AuditQuestionCommentState>(
      builder: (context, state) {
        return Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.blueDark2,),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GeneralCommentWidget(
            hintText: LocaleKeys.addComment.tr(),
            enabled: state.isEditing,
            initialValue: widget.comment?.comment,
            textStyle: context.textStyles.bodyNormal.black,
            hintTextStyle: context.textStyles.bodyNormalItalic.grey,
            onChanged: context.read<AuditQuestionCommentCubit>().updateComment,
          ),
        );
      },
    );
  }

  Widget editIcon() {
    return BlocSelector<AuditQuestionCommentCubit, AuditQuestionCommentState, bool>(
      selector: (state) => state.isEditing,
      builder: (context, isEditing) {
        if (isEditing) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: InkWell(
            onTap: () => context
                .read<AuditQuestionCommentCubit>()
                .setIsEditing(isEditing: true),
            child: Container(
              alignment: Alignment.center,
              child: SvgGenImage(Assets.icons.icEditBlueCircle.path).svg(
                height: 60,
                width: 60,
              ),
            ),
          ),
        );
      },
    );
  }
}
