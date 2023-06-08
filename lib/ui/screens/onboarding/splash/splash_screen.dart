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
        final authState = context.read<AuthCubit>().state;

        await context.read<EntityCubit>().init();

        await context.read<AuthCubit>().checkFirstLaunch();

        final haveInternet = (await Connectivity().checkConnectivity()) !=
            ConnectivityResult.none;

        if (authState.isUnauthorized) {
          if (haveInternet) {
            return logInWithSavedCredentials();
          } else {
            return pushLogin();
          }
        } else {
          if (haveInternet) {
            await getUser();
            await createUserDevice();
          }

          return pushDashboard();
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

  Future<void> getUser() async {
    // final userInfoCubit = context.read<UserInfoCubit>();
    // if (userInfoCubit.data == null) {
    //   await context
    //       .read<UserInfoCubit>()
    //       .getUserInfoAndUserRoles(context, userInfoCubit.state.userRole!);
    // }
  }

  Future<void> createUserDevice() async {
    if (!context.mounted) return;
    final userInfoCubit = context.read<UserInfoCubit>();

    final data = context.read<UserDeviceCubit>().data;
    // if (data == null) {
    //   await context
    //       .read<UserDeviceCubit>()
    //       .createUserDevice(context, userInfoCubit.state.userRole!);
    // }
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
