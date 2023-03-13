import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/ui/screen/auth/login_screen.dart';
import 'package:cmo/ui/screen/dashboard/dashboard_screen.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen_base.dart';

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

        authState.continued(
          (authorized) {
            _pushDashboard();
            return;
          },
          (unauthorized) async {
            final haveInternet = (await Connectivity().checkConnectivity()) != ConnectivityResult.none;
            if (!haveInternet) {
              _pushLogin();
              return;
            }

            if (haveInternet && context.mounted) {
              await context.read<AuthCubit>().logInWithSavedCredentialsAuthEvent(
                onFailure: () {
                  _pushLogin();
                },
                onSuccess: () {
                  _pushDashboard();
                },
              );
            }
          },
        );
      },
    );
  }

  void _pushDashboard() {
    if (context.mounted) DashboardScreen.push(context);
  }

  void _pushLogin() {
    if (context.mounted) LoginScreen.push(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      child: Scaffold(
        body: Column(
          children: [
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
