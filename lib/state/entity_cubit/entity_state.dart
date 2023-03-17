part of 'entity_cubit.dart';

class EntityState {
  const EntityState({
    this.entity,
    this.company,
    this.companies = const [],
    this.isLoading = false,
    this.isLoadingSync = false,
    this.syncMessage,
    this.countSchedules = 0,
    this.countWorkers = 0,
    this.countQuestion = 0,
  });
  final Entity? entity;
  final Company? company;

  final List<Company> companies;

  final bool isLoading;
  final bool isLoadingSync;
  final String? syncMessage;
  final int countSchedules;
  final int countWorkers;
  final int countQuestion;

  CmoDatabaseCompanyService? get companyService =>
      CmoDatabaseCompanyService(companyId: company?.companyId);

  EntityState copyWith({
    Entity? entity,
    Company? company,
    List<Company>? companies,
    bool? isLoading,
    bool? isLoadingSync,
    String? syncMessage,
    int? countSchedules,
    int? countWorkers,
    int? countQuestion,
  }) {
    return EntityState(
      entity: entity ?? this.entity,
      company: company ?? this.company,
      companies: companies ?? this.companies,
      isLoading: isLoading ?? this.isLoading,
      isLoadingSync: isLoadingSync ?? this.isLoadingSync,
      syncMessage: syncMessage ?? this.syncMessage,
      countSchedules: countSchedules ?? this.countSchedules,
      countWorkers: countWorkers ?? this.countWorkers,
      countQuestion: countQuestion ?? this.countQuestion,
    );
  }
}
