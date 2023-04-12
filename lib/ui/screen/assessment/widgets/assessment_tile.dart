import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/assessment.dart';
import 'package:cmo/ui/screen/assessment/assessment_list_question_screen.dart';
import 'package:cmo/ui/screen/assessment/assessment_signature_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class AssessmentTile extends StatelessWidget {
  const AssessmentTile({
    super.key,
    required this.data,
    this.onRemovingCallback,
  });

  final Assessment data;
  final void Function(Assessment)? onRemovingCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: CmoTappable(
        onTap: () {
          AssessmentListQuestionScreen.push(context, data);
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.greyLight1,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: context.colors.shadow,
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${LocaleKeys.jobType.tr()}: ${data.jobCategoryName ?? data.jobCategoryId?.toString() ?? ''} ',
                                    style: context.textStyles.bodyBold.copyWith(
                                      color: context.colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Builder(
                                    builder: (context) {
                                      final created = DateTime.tryParse(
                                          data.createDT ?? '');

                                      return Text(
                                        '${LocaleKeys.created.tr()}: ${created?.day}-${created?.month}-${created?.year}',
                                        style: context.textStyles.bodyBold,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: context.colors.grey,
                          ),
                          CmoOptionTile(
                            height: 24,
                            title: LocaleKeys.jobDescription.tr(),
                            value: data.jobDescriptionName ??
                                data.jobDescriptionId?.toString(),
                            shouldShowArrow: false,
                            shouldAddPadding: false,
                            useFittedBox: false,
                          ),
                          CmoOptionTile(
                            height: 24,
                            title: LocaleKeys.plantation.tr(),
                            value: data.plantationName ??
                                data.plantationId?.toString(),
                            shouldShowArrow: false,
                            shouldAddPadding: false,
                            useFittedBox: false,
                          ),
                          CmoOptionTile(
                            height: 24,
                            title: LocaleKeys.contractor.tr(),
                            value: data.contractorName ??
                                data.contractorId?.toString(),
                            shouldShowArrow: false,
                            shouldAddPadding: false,
                            useFittedBox: false,
                          ),
                          CmoOptionTile(
                            height: 24,
                            title: LocaleKeys.team.tr(),
                            value: data.teamName ?? data.teamId?.toString(),
                            shouldShowArrow: false,
                            shouldAddPadding: false,
                            useFittedBox: false,
                          ),
                          CmoOptionTile(
                            height: 24,
                            title: LocaleKeys.worker.tr(),
                            value: data.workerName ?? data.workerId?.toString(),
                            shouldShowArrow: false,
                            shouldAddPadding: false,
                            useFittedBox: false,
                          ),
                          CmoOptionTile(
                            height: 24,
                            title: LocaleKeys.locationName.tr(),
                            value: data.location ?? '${data.lat}, ${data.long}',
                            shouldShowArrow: false,
                            shouldAddPadding: false,
                            shouldShowDivider: false,
                            useFittedBox: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Assets.icons.icArrowRight.svgBlack,
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CmoFilledButton(
                          onTap: () {
                            AssessmentSignatureScreen.push(context, data);
                          },
                          title: LocaleKeys.signature.tr(),
                          leading: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(
                              IconsaxBold.add_circle,
                              size: 18.0,
                              color: context.colors.white,
                            ),
                          ),
                        ),
                      ),
                      if (data.completed != true) ...[
                        const SizedBox(width: 8),
                        Expanded(
                          child: CmoFilledButton(
                            onTap: () async {
                              final shouldRemoved = await showDefaultAlert(
                                context,
                                title: LocaleKeys.removeAssessment.tr(),
                                content: LocaleKeys.removeAssessmentAlertContent
                                    .tr(),
                                actions: <Widget>[
                                  TextButton(
                                    child:
                                        Text(LocaleKeys.ok.tr().toUpperCase()),
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                        LocaleKeys.cancel.tr().toUpperCase()),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                              if (shouldRemoved != true) {
                                return;
                              }
                              onRemovingCallback?.call(data);
                            },
                            title: LocaleKeys.remove.tr(),
                            leading: Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Icon(
                                IconsaxBold.minus_cirlce,
                                size: 18.0,
                                color: context.colors.white,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
