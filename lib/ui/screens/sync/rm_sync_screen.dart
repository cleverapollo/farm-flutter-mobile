import 'package:cmo/state/sync/rm/rm_sync_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RMSyncScreen extends StatefulWidget {
  const RMSyncScreen({super.key});

  static dynamic pushReplacement(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const RMSyncScreen(),
      ),
    );
  }

  @override
  State<RMSyncScreen> createState() => _RMSyncScreenState();
}

class _RMSyncScreenState extends State<RMSyncScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RMSyncCubit(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Center(
            child: BlocSelector<RMSyncCubit, RMSyncState, String?>(
              selector: (state) {
                return state.syncMessage;
              },
              builder: (context, state) {
                return Text(state ?? '');
              },
            ),
          ),
        ),
      ),
    );
  }
}
