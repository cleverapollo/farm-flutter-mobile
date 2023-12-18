import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/ui/screens/cmo_dashboard_base.dart';
import 'package:cmo/ui/screens/cmo_screen_base.dart';
import 'package:cmo/ui/screens/onboarding/login/login_screen.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
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
        await checkForUpdate();
      },
    );
  }

  Future<void> checkForUpdate() async {
    final forceUpdateModel = await appInfoService.checkUpdate();
    if (forceUpdateModel == null) {
      return;
    }

    if (forceUpdateModel.forceUpdate) {
      showUpdateDialog(
        context,
        canPopWithBackButtonAndroid: false,
        functionRight: () {
          appInfoService.goToStore();
        },
      );
    } else if (forceUpdateModel.shouldUpdate) {
      showUpdateDialog(
        context,
        canPopWithBackButtonAndroid: false,
        isShow2Button: true,
        functionLeft: () {
          Navigator.of(context).pop();
          processWithoutUpdate();
        },
        functionRight: () {
          Navigator.of(context).pop();
          appInfoService.goToStore();
        },
      );
    } else {
      await processWithoutUpdate();
    }
  }

  Future<void> processWithoutUpdate() async {
    await context.read<EntityCubit>().init();

    await context.read<AuthCubit>().checkFirstLaunch();

    final haveInternet = (await Connectivity().checkConnectivity()) != ConnectivityResult.none;

    final isAuthorized = await configService.isAuthorized();
    await Future.delayed( const Duration(seconds: 3));
    if (isAuthorized) {
      return pushDashboard();
    } else {
      if (haveInternet) {
        return logInWithSavedCredentials();
      } else {
        return pushLogin();
      }
    }
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
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Assets.images.splashBg.image(fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
