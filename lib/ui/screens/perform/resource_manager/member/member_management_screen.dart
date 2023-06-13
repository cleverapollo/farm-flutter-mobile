import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class MemberManagementScreen extends StatelessWidget {
  const MemberManagementScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => const MemberManagementScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CmoTappable(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          appBar: CmoAppBarV2(
            title: LocaleKeys.memberManagement.tr(),
            subtitle: '${LocaleKeys.rmu_name.tr()}: Border Timbers',
            showLeading: true,
            showTrailing: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: CmoTextField(
                  name: LocaleKeys.search.tr(),
                  prefixIcon: Assets.icons.icSearch.svg(),
                  hintText: LocaleKeys.search.tr(),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  CmoFilledButton(
                    onTap: () {},
                    disable: false,
                    title: LocaleKeys.incomplete.tr(),
                    titleStyle: context.textStyles.bodyBold.white
                        .copyWith(fontSize: 12),
                  ),
                  const SizedBox(width: 12),
                  CmoFilledButton(
                    onTap: () {},
                    disable: true,
                    title: LocaleKeys.members.tr(),
                    titleStyle: context.textStyles.bodyBold.white
                        .copyWith(fontSize: 12),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              CmoCard(
                margin: const EdgeInsets.symmetric(horizontal: 23),
                content: [
                  CmoCardHeader(title: 'Charter Sawerombi'),
                  CmoCardHeader(title: 'Soe Soap'),
                  CmoCardItem(title: LocaleKeys.incomplete.tr(), value: '8/10'),
                ],
              ),
              const SizedBox(height: 20),
              CmoCard(
                margin: const EdgeInsets.symmetric(horizontal: 23),
                content: [
                  CmoCardHeader(title: 'Charter Sawerombi'),
                  CmoCardHeader(title: 'Soe Soap'),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: constraints.minWidth / 2),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 19),
                              child: Text(
                                LocaleKeys.onboarded.tr(),
                                style: context.textStyles.bodyNormal
                                    .copyWith(color: context.colors.white),
                              ),
                            ),
                          ),
                          Assets.icons.icTick.svg(),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
