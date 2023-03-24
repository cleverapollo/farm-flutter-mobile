import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssessmentQuestionScreen extends StatefulWidget {
  const AssessmentQuestionScreen({
    super.key,
    required this.assessment,
  });

  final Assessment assessment;

  static void push(BuildContext context, Assessment assessment) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssessmentQuestionScreen(assessment: assessment),
      ),
    );
  }

  @override
  State<AssessmentQuestionScreen> createState() =>
      _AssessmentQuestionScreenState();
}

class _AssessmentQuestionScreenState extends State<AssessmentQuestionScreen> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context
          .read<AssessmentQuestionCubit>()
          .initialize(widget.assessment);
    });
  }

  @override
  Widget build(BuildContext context) {
    final assessment = context.watch<AssessmentQuestionCubit>().getAssessment();

    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.assessments.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Row(),
          Text('${assessment?.plantationName}')
        ],
      ),
    );
  }
}
