import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/screen/dashboard/dashboard_screen.dart';
import 'package:cmo/ui/screen/login/login_screen.dart';
import 'package:cmo/ui/screen/screen_base.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';

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

        final haveInternet = (await Connectivity().checkConnectivity()) !=
            ConnectivityResult.none;

        authState.continued(
          (authorized) async {
            if (haveInternet) {
              await getUser();
              await createUserDevice();
            }

            return pushDashboard();
          },
          (unauthorized) async {
            if (haveInternet) {
              return logInWithSavedCredentials();
            } else {
              return pushLogin();
            }
          },
        );
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
    if (!context.mounted) return;

    final data = context.read<UserInfoCubit>().data;
    if (data == null) {
      await context.read<UserInfoCubit>().getUser(context);
    }
  }

  Future<void> createUserDevice() async {
    if (!context.mounted) return;

    final data = context.read<UserDeviceCubit>().data;
    if (data == null) {
      await context.read<UserDeviceCubit>().createUserDevice(context);
    }
  }

  void pushDashboard() {
    if (context.mounted) DashboardScreen.push(context);
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
