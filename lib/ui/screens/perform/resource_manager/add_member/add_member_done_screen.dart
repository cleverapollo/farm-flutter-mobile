import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/ui/screens/cmo_dashboard_base.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberDone extends StatelessWidget {
  const AddMemberDone({super.key, this.farm});
  final Farm? farm;

  static Future<void> push(BuildContext context, {Farm? farm}) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => AddMemberDone(farm: farm)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CmoAppBarV2(
          title: LocaleKeys.addMember.tr(),
          subtitle: farm?.farmName ?? '',
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              children: [
                Text(
                    '${farm?.firstName ?? ''} ${farm?.lastName ?? ''} ${LocaleKeys.member_is_now_a_group_scheme_member.tr()}',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black)),
                Text(
                    LocaleKeys
                        .documentation_has_been_emailed_to_the_relevant_parties
                        .tr(),
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black)),
                const Spacer(),
                Center(
                    child: CmoFilledButton(
                        title: LocaleKeys.close.tr(),
                        onTap: () {
                          context.read<AddMemberCubit>().onDataChangeClose();
                          context.read<AddMemberCubit>().stepCount();
                          context
                              .read<DashboardCubit>()
                              .getResourceManagerMembers();
                          CmoDashboardBase.push(context);
                        })),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
