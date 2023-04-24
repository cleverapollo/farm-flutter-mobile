import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/audit_list_questions_cubit/audit_list_questions_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditQuestionItem extends StatelessWidget {
  const AuditQuestionItem({
    super.key,
    required this.question,
    required this.compliances,
    required this.viewListPhoto,
    required this.viewComment,
    required this.addAnswer,
    this.answer,
  });

  final AuditQuestion question;
  final AuditQuestionAnswer? answer;
  final List<AuditCompliance> compliances;
  final VoidCallback viewListPhoto;
  final VoidCallback viewComment;
  final void Function(AuditCompliance) addAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${question.questionValue}',
                  style: context.textStyles.bodyNormal,
                ),
              ),
              if (question.xBone ?? false)
                Icon(
                  IconsaxOutline.danger,
                  size: 24.0,
                  color: context.colors.red,
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    for (final compliance in compliances)
                      CmoTappable(
                        onTap: () => addAnswer(compliance),
                        child: CmoCircelButton(
                          title: '${compliance.complianceName}',
                          color: answer != null && answer?.complianceId == compliance.complianceId
                              ? getComplianceActiveColor(context, compliance)
                              : context.colors.white,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              if (answer?.complianceId == AuditComplianceEnum.nc.data)
                Row(
                  children: [
                    CmoTappable(
                      onTap: viewListPhoto,
                      child: CmoCircelIconButton(
                        color: (answer?.havePhoto ?? false) ? context.colors.green : Colors.transparent,
                        icon: SizedBox(
                          width: 20,
                          height: 20,
                          child: Assets.icons.icCamera.svgBlack,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    CmoTappable(
                      onTap: viewComment,
                      child: CmoCircelIconButton(
                        color: (answer?.haveComment ?? false) ? context.colors.green : Colors.transparent,
                        icon: SizedBox(
                          width: 20,
                          height: 20,
                          child: Assets.icons.icComment.svgBlack,
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Color getComplianceActiveColor(
    BuildContext context,
    AuditCompliance auditCompliance,
  ) {
    switch (auditCompliance.complianceEnum) {
      case AuditComplianceEnum.n:
        return context.colors.green;
      case AuditComplianceEnum.nc:
        return context.colors.yellow;
      case AuditComplianceEnum.na:
        return context.colors.grey;
      case AuditComplianceEnum.unknown:
        return Colors.transparent;
    }
  }
}