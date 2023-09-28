import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditProgressIndicator extends StatelessWidget {
  const AuditProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
      builder: (context, state) {
        final totalQuestions = state.questions.length;
        final answeredQuestion = state.getAnsweredQuestions().length;
        return Container(
          height: 8,
          color: context.colors.white,
          alignment: Alignment.centerLeft,
          child: totalQuestions == 0 || answeredQuestion == 0
              ? const SizedBox.shrink()
              : Container(
                  width: MediaQuery.of(context).size.width * answeredQuestion / totalQuestions,
                  height: 8,
                  decoration: BoxDecoration(
                    color: context.colors.blue,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(8),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
