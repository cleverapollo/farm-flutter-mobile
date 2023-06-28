import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_sign_contract_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/cmo_app_bar_v2.dart';

class AddMemberMembershipContractScreen extends StatelessWidget {
  const AddMemberMembershipContractScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => const AddMemberMembershipContractScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.addMember.tr(),
        subtitle: LocaleKeys.siteName.tr(),
        showTrailing: true,
      ),
      body: SizedBox.expand(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: size.width,
                color: context.colors.blueDark1,
                child: Text(LocaleKeys.membershipContract.tr(),
                    style: context.textStyles.titleBold
                        .copyWith(color: context.colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(LocaleKeys.membershipContract.tr(),
                        style: context.textStyles.bodyBold
                            .copyWith(color: context.colors.black)),
                    const SizedBox(height: 8),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        style: context.textStyles.bodyNormal
                            .copyWith(color: context.colors.black)),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                  child: CmoFilledButton(
                      title: LocaleKeys.accept.tr(),
                      onTap: () {
                        context
                            .read<AddMemberCubit>()
                            .onDataChangeMemberContract();
                        AddMemberSignContractScreen.push(context);
                      })),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
