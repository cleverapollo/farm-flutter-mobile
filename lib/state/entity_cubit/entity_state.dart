part of 'entity_cubit.dart';

class EntityState {
  final Entity? entity;
  final Company? company;

  final List<Company> companies;

  final bool isLoading;
  final bool isLoadingSync;

  const EntityState({
    this.entity,
    this.company,
    this.companies = const [],
    this.isLoading = false,
    this.isLoadingSync = false,
  });

  EntityState copyWith({
    Entity? entity,
    Company? company,
    List<Company>? companies,
    bool? isLoading,
    bool? isLoadingSync,
  }) {
    return EntityState(
      entity: entity ?? this.entity,
      company: company ?? this.company,
      companies: companies ?? this.companies,
      isLoading: isLoading ?? this.isLoading,
      isLoadingSync: isLoadingSync ?? this.isLoadingSync,
    );
  }
}
