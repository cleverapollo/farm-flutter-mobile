import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/screen/auth/language_picker.dart';
import 'package:cmo/ui/screen/entity/utils.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormBuilderState>();

  final scroller = ScrollController();
  bool isLoading = false;

  Future<void> onSubmit() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      setState(() {
        isLoading = true;
      });

      try {
        debugPrint(_formKey.currentState?.value.toString());
        await hideInputMethod();
        final username = _formKey.currentState?.value['email'];
        final password = _formKey.currentState?.value['password'];
        var success = false;

        if (context.mounted) {
          await context.read<AuthCubit>().logIn(
                LogInAuthEvent(
                  onFailure: () {
                    success = false;
                  },
                  onSuccess: () {
                    success = true;
                  },
                  password: password.toString(),
                  username: username.toString(),
                ),
              );
        }

        if (success && context.mounted) {
          await context.read<UserInfoCubit>().getUser(context);
        }

        if (success && context.mounted) {
          pushEntityScreen(context);
        }
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      debugPrint(_formKey.currentState?.value.toString());
      debugPrint('validation failed');
    }
  }

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
                // const SizedBox(height: 16),
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
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        _formKey.currentState!.save();
        debugPrint(_formKey.currentState!.value.toString());
      },
      autovalidateMode: autoValidateMode,
      child: AutofillGroup(
        child: Column(
          children: [
            CmoTextField(
              name: 'email',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
              prefixIcon: Center(child: Assets.icons.icUsername.svg()),
              hintText: LocaleKeys.username.tr(),
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.email, AutofillHints.name],
            ),
            const SizedBox(height: 14),
            CmoTextField(
              name: 'password',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
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
      ),
    );
  }
}
