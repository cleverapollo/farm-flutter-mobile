import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/cmo_database_company_service.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/screen/auth/login_screen.dart';
import 'package:cmo/ui/screen/dashboard/dashboard_screen.dart';
import 'package:cmo/ui/screen/screen_base.dart';
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
        final userInfoData = context.read<UserInfoCubit>().data;
        final userDeviceData = context.read<UserDeviceCubit>().data;
        await context.read<EntityCubit>().init();

        final haveInternet = (await Connectivity().checkConnectivity()) !=
            ConnectivityResult.none;

        // final db = CmoDatabaseCompanyService(companyId: 15);
        // await (await db.db)?.writeTxn(() async {
        //   await db.cachePlantation(Plantation(plantationId: 3));
        // });
        // final q = await db.getPlantations();

        
        
        // await (await cmoDatabaseService.db)?.writeTxn(() async {
        //   await cmoDatabaseService.cacheCompany(Company(companyId: 1234));
        // });
        // final q2 = await cmoDatabaseService.getAllCachedCompanys();

        authState.continued(
          (authorized) async {
            if (context.mounted && haveInternet && userInfoData == null) {
              await context.read<UserInfoCubit>().getUser(context);
            }
            if (context.mounted && haveInternet && userDeviceData == null) {
              await context.read<UserDeviceCubit>().createUserDevice(context);
            }

            _pushDashboard();
            return;
          },
          (unauthorized) async {
            if (!haveInternet) {
              _pushLogin();
              return;
            }

            if (haveInternet && context.mounted) {
              await context.read<AuthCubit>().logInWithSavedCredentials(
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
    // if (context.mounted) pushEntityScreen(context);
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
