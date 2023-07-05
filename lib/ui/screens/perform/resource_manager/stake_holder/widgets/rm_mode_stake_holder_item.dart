import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class RmModeStakeHolderItem extends StatelessWidget {
  const RmModeStakeHolderItem({
    super.key,
    required this.model,
    required this.onTap,
  });

  final StakeHolder model;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: onTap,
      child: CmoCard(
        content: [
          CmoCardHeader(
            title: model.stakeholderName ?? '',
            maxLines: 2,
          ),
          const SizedBox(height: 10),
          CmoCardItemWithIcon(
            icon: Assets.icons.icHome,
            title: model.address1,
          ),
          CmoCardItemWithIcon(
            icon: Assets.icons.icProfile,
            title: model.contactName,
          ),
          CmoCardItemWithIcon(
            icon: Assets.icons.icMail,
            title: model.email,
          ),
        ],
      ),
    );
  }
}
