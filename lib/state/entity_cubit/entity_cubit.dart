import 'package:cmo/di.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/model/entity.dart';
import 'package:cmo/service/cmo_api_service.dart';
import 'package:cmo/service/entity_service.dart';
import 'package:cmo/utils/json_converter.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'entity_state.dart';

class EntityCubit extends HydratedCubit<EntityState> {
  EntityCubit({EntityService? service}) : super(const EntityState()) {
    this.service = service ?? entityService;
  }

  late final EntityService service;

  Future<void> sync(Entity entity) async {
    emit(state.copyWith(isLoadingSync: true));

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      entity: entity,
      isLoadingSync: false,
    ));
  }

  Future<void> syncBehave({
    required BuildContext context,
    required Company company,
    required int? userDeviceId,
  }) async {
    if (userDeviceId == null) return;
    emit(state.copyWith(isLoadingSync: true));

    await cmoApi.createSystemEvent(
      context: context,
      primaryKey: 8,
      systemEventName: 'SyncAssessmentMasterData',
      userDeviceId: userDeviceId,
    );

    emit(
      state.copyWith(
        entity: Entity(
          name: company.companyName ?? '',
          type: EntityType.cpy,
        ),
        company: company,
        isLoadingSync: false,
      ),
    );
  }

  Future<void> getCompanies({
    required BuildContext context,
    required int? userId,
  }) async {
    if (userId == null) return;
    emit(state.copyWith(isLoading: true));

    final companies = await cmoApi.getCompaniesByUserId(
      context: context,
      userId: userId,
    );

    emit(
      state.copyWith(
        companies: companies,
        isLoading: false,
      ),
    );
  }

  @override
  Future<void> clear() async {
    emit(const EntityState());
    return super.clear();
  }

  @override
  EntityState? fromJson(Map<String, dynamic> json) {
    final entityRaw = Json.tryDecode(json['entity']) as Map<String, dynamic>?;
    final companyRaw = Json.tryDecode(json['company']) as Map<String, dynamic>?;
    final entity = entityRaw != null ? Entity.fromJson(entityRaw) : null;
    final company = companyRaw != null ? Company.fromJson(companyRaw) : null;

    return EntityState(
      entity: entity,
      company: company,
    );
  }

  @override
  Map<String, dynamic>? toJson(EntityState state) {
    return {
      'entity': Json.tryEncode(state.entity?.toJson()),
      'company': Json.tryEncode(state.company?.toJson()),
    };
  }
}
