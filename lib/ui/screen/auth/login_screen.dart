import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screen/auth/language_picker.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordShown = false;
  bool selectingLang = false;

  final scroller = ScrollController();

  void onSubmit() {}

  void toggleSelectingLang() {
    setState(() => selectingLang = !selectingLang);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 32),
                        Assets.icons.icUser.svg(),
                        const SizedBox(height: 77),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: buildInputArea(),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          LocaleKeys.forgotPassword.tr(),
                          style: context.textStyles.bodyNormal
                              .copyWith(color: context.colors.blueDark2),
                        ),
                        const SizedBox(height: 16),
                        CmoFilledButton(
                          title: LocaleKeys.login.tr(),
                          onTap: onSubmit,
                        ),
                        const SizedBox(height: 16),
                        LanguagePicker(
                          hidden: !selectingLang,
                          onPick: toggleSelectingLang,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox.square(
                      dimension: 50,
                      child: selectingLang
                          ? null
                          : CmoTappable(
                              onTap: toggleSelectingLang,
                              child: Assets.images.icLang.image(),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputArea() {
    return AutofillGroup(
      child: Column(
        children: [
          CmoTextField(
            prefixIcon: Center(child: Assets.icons.icUsername.svg()),
            hintText: LocaleKeys.username.tr(),
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email, AutofillHints.name],
          ),
          const SizedBox(height: 14),
          CmoTextField(
            prefixIcon: Center(child: Assets.icons.icPassword.svg()),
            suffixIcon: CmoTappable(
              onTap: () {
                setState(() => passwordShown = !passwordShown);
              },
              child: Center(child: Assets.icons.icVisible.svg()),
            ),
            hintText: LocaleKeys.password.tr(),
            obscureText: !passwordShown,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.password],
            onEditingComplete: onSubmit,
          ),
        ],
      ),
    );
  }
}
