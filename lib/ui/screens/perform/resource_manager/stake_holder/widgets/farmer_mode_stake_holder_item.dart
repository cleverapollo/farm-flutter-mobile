import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class FarmerModeStakeHolderItem extends StatelessWidget {
  const FarmerModeStakeHolderItem({
    super.key,
    required this.model,
    required this.haveGreyBackground,
    required this.onTap,
  });

  final StakeHolder model;
  final bool haveGreyBackground;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: haveGreyBackground ? context.colors.greyLight1 : context.colors.white,
          border: haveGreyBackground ? null : Border.all(color: context.colors.greyD9D9),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CmoCardHeader(
                    title: model.stakeholderName ?? '',
                    maxLines: 2,
                    textStyle: context.textStyles.bodyBold.black,
                  ),
                  const SizedBox(height: 10),
                  CmoCardItemWithIcon(
                    icon: Assets.icons.icHome,
                    title: model.address1,
                    textStyle: context.textStyles.bodyNormal.black,
                    iconColor: context.colors.black,
                  ),
                  CmoCardItemWithIcon(
                    icon: Assets.icons.icProfile,
                    title: model.contactName,
                    textStyle: context.textStyles.bodyNormal.black,
                    iconColor: context.colors.black,
                  ),
                  CmoCardItemWithIcon(
                    icon: Assets.icons.icMail,
                    title: model.email,
                    textStyle: context.textStyles.bodyNormal.black,
                    iconColor: context.colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Assets.icons.icArrowRight.svgBlack,
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}
