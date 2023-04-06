import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/ui/screen/sync_summary/sync_summary_enum.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

class SyncSummaryScreen extends StatelessWidget {
  const SyncSummaryScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SyncSummaryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.syncSummary.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: BlocSelector<EntityCubit, EntityState, EntityState?>(
        selector: (state) {
          return state;
        },
        builder: (context, state) {
          final databaseService = cmoDatabaseMasterService;

          return FutureBuilder(
            future: databaseService.db,
            builder: (BuildContext context, AsyncSnapshot<Isar> snapshot) {
              if (snapshot.hasError) {
                return Text(
                  'Open db error: ${snapshot.error} - ${snapshot.stackTrace}',
                );
              }
              if (!snapshot.hasData) return const Text('loading db...');
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: SyncSummaryEnum.all.getViews
                          .withSpaceBetween(height: 16)
                        ..add(
                          const SizedBox(height: 60),
                        ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CmoFilledButton(
                          onTap: () {},
                          title: LocaleKeys.sync.tr(),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
