import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class LabourManagementItem extends StatelessWidget {
  const LabourManagementItem({
    super.key,
    required this.farmerWorker,
    required this.onTap,
  });

  final FarmerWorker farmerWorker;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${farmerWorker.firstName ?? ''} ${farmerWorker.lastName ?? ''}',
                style: context.textStyles.bodyBold.blue,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Assets.icons.icProfile.svgBlack,
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        farmerWorker.jobTitle ?? '',
                        style: context.textStyles.bodyNormal.black,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Assets.icons.icSmsBlue.svg(),
                    const SizedBox(
                      width: 40,
                    ),
                    Assets.icons.icCallBlue.svg(),
                    const SizedBox(
                      width: 40,
                    ),
                    Assets.icons.icEdit.svg(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
