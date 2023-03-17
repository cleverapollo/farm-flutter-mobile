import 'package:cmo/service/cmo_database_company_service.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CmoCompanyServiceBuilder extends StatelessWidget {
  const CmoCompanyServiceBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(
    BuildContext context,
    CmoDatabaseCompanyService service,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EntityCubit, EntityState, EntityState?>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        final databaseService = state?.companyService;
        if (databaseService == null) return const SizedBox();
        return FutureBuilder(
          future: databaseService.db,
          builder: (context, snapshot) {
            return builder(context, databaseService);
          },
        );
      },
    );
  }
}
