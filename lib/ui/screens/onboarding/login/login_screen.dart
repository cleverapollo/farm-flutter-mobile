import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/user_role_config/user_role_config.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/global_entity.dart';
import 'package:cmo/ui/screens/onboarding/login/language_picker.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:cmo/utils/logger.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
  final _formKey = GlobalKey<FormBuilderState>();
  final scroller = ScrollController();
  final emailFieldName = 'email';
  final passwordFieldName = 'password';

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool passwordShown = false;
  bool selectingLang = false;
  bool isLoading = false;

  Future<void> onSubmit() async {
    logger.i('[LoginScreen] submit: ${_formKey.currentState?.value}');

    setState(() => autoValidateMode = AutovalidateMode.always);

    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      setState(() => isLoading = true);
      await hideInputMethod();
      final username = _formKey.currentState?.value[emailFieldName];
      final password = _formKey.currentState?.value[passwordFieldName];

      UserRoleConfig? _userRole;

      if (context.mounted) {
        await context.read<AuthCubit>().logIn(
              LogInAuthEvent(
                onResponse: (UserRoleConfig? userRole) {
                  _userRole = userRole;
                },
                password: password.toString(),
                username: username.toString(),
              ),
            );
      }

      // if (_userRole == null && context.mounted) {
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Login failed, please try again'),
      //   ));
      // }
      //
      // if (_userRole != null && context.mounted) {
      //   await context
      //       .read<UserInfoCubit>()
      //       .getUserDataAfterLogin(context, _userRole!)
      //       .then((_) => GlobalEntityScreen.pushReplacement(context));
      // }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void toggleSelectingLang() {
    setState(() => selectingLang = !selectingLang);
  }

  void toggleShowPassword() {
    setState(() => passwordShown = !passwordShown);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (!state.isUnauthorized) {
          GlobalEntityScreen.pushReplacement(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const CmoLogo(),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: context.colors.grey),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 24),
                          Assets.icons.icUser.svg(),
                          const SizedBox(height: 32),
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
                            loading: isLoading,
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
                  buildSelectLang(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputArea() {
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        _formKey.currentState!.save();
      },
      autovalidateMode: autoValidateMode,
      child: AutofillGroup(
        child: Column(
          children: [
            CmoTextField(
              name: emailFieldName,
              validator: emailValidator,
              prefixIcon: Center(child: Assets.icons.icUsername.svg()),
              hintText: LocaleKeys.username.tr(),
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.email, AutofillHints.name],
            ),
            const SizedBox(height: 14),
            CmoTextField(
              name: passwordFieldName,
              validator: requiredValidator,
              prefixIcon: Center(child: Assets.icons.icPassword.svg()),
              suffixIcon: CmoTappable(
                onTap: toggleShowPassword,
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
      ),
    );
  }

  Widget buildSelectLang() {
    if (selectingLang) return const SizedBox();

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox.square(
          dimension: 50,
          child: CmoTappable(
            onTap: toggleSelectingLang,
            child: Assets.images.icLang.image(),
          ),
        ),
      ),
    );
  }
}
