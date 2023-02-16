import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CmoLogo(),
              const SizedBox(height: 42),
              Padding(
                padding: const EdgeInsets.all(18),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: context.colors.grey, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 12),
                        Assets.icons.icUser.svg(),
                        const SizedBox(height: 77),
                        CmoTextField(
                          prefixIcon:
                              Center(child: Assets.icons.icUsername.svg()),
                          hintText: LocaleKeys.username.tr(),
                        ),
                        const SizedBox(height: 14),
                        CmoTextField(
                          prefixIcon:
                              Center(child: Assets.icons.icPassword.svg()),
                          suffixIcon:
                              Center(child: Assets.icons.icVisible.svg()),
                          hintText: LocaleKeys.password.tr(),
                          obscureText: true,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          LocaleKeys.forgotPassword.tr(),
                          style: context.textStyles.bodyNormal
                              .copyWith(color: context.colors.blueDark2),
                        ),
                        const SizedBox(height: 19),
                        CmoFilledButton(
                          title: LocaleKeys.login.tr(),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CmoTappable(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Assets.images.icLang.image(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
