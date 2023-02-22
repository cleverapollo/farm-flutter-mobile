import 'package:cmo/di.dart';
import 'package:cmo/model/entity.dart';
import 'package:cmo/service/entity_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntityCubit extends Cubit<EntityState> {
  EntityCubit({EntityService? service}) : super(const EntityState()) {
    this.service = service ?? entityService;
  }

  late final EntityService service;

  Future<void> sync(Entity entity) async {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      entity: entity,
      isLoading: false,
    ));
  }

  Future<void> getAllNames() async {
    emit(state.copyWith(isLoading: true));
    final names = await service.getNames();
    emit(state.copyWith(
      names: names,
      isLoading: false,
    ));
  }
}

class EntityState {
  final Entity? entity;

  final List<String> names;

  final bool isLoading;

  const EntityState({
    this.entity,
    this.names = const [],
    this.isLoading = false,
  });

  EntityState copyWith({
    Entity? entity,
    List<String>? names,
    bool? isLoading,
  }) {
    return EntityState(
      entity: entity ?? this.entity,
      names: names ?? this.names,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
