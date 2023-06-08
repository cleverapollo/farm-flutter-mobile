import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/screens/cmo_dashboard_base.dart';
import 'package:cmo/ui/screens/cmo_screen_base.dart';
import 'package:cmo/ui/screens/onboarding/login/login_screen.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        await context.read<EntityCubit>().init();

        await context.read<AuthCubit>().checkFirstLaunch();

        final haveInternet = (await Connectivity().checkConnectivity()) !=
            ConnectivityResult.none;

        final isAuthorized = await configService.isAuthorized();
        if (isAuthorized) {
          return pushDashboard();
        } else {
          if (haveInternet) {
            return logInWithSavedCredentials();
          } else {
            return pushLogin();
          }
        }
      },
    );
  }

  Future<void> logInWithSavedCredentials() async {
    if (!context.mounted) return;

    return context.read<AuthCubit>().logInWithSavedCredentials(
      onFailure: () {
        pushLogin();
      },
      onSuccess: () {
        pushDashboard();
      },
    );
  }

  void pushDashboard() {
    if (context.mounted) CmoDashboardBase.push(context);
  }

  void pushLogin() {
    if (context.mounted) LoginScreen.push(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      child: Scaffold(
        body: Column(
          children: [
            Row(),
            const CmoLogo(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Assets.images.splashBg.image(fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
