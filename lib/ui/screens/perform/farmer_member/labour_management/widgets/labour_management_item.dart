import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
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
                '${farmerWorker.firstName ?? ''} ${farmerWorker.surname ?? ''}',
                style: context.textStyles.bodyBold.blue,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Assets.icons.icProfile.svgBlack,
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        farmerWorker.phoneNumber ?? '',
                        style: context.textStyles.bodyNormal.black,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    CmoTappable(
                      onTap: () async {
                        await CommonFunctions.sendSms(farmerWorker.phoneNumber);
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(child: Assets.icons.icSmsBlue.svg()),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CmoTappable(
                      onTap: () async {
                        await CommonFunctions.makePhoneCall(farmerWorker.phoneNumber);
                      },
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(child: Assets.icons.icCallBlue.svg()),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
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
