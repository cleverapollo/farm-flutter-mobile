part of 'compartment_cubit.dart';

class CompartmentState {
  const CompartmentState({
    this.listCompartment = const <Compartment>[],
    this.farmId = '',
    this.campId,
    this.loading = false,
    this.error,
  });

  final Object? error;
  final bool loading;
  final List<Compartment> listCompartment;
  final String farmId;
  final String? campId;

  CompartmentState copyWith({
    bool? loading,
    Object? error,
    List<Compartment>? listCompartment,
    String? farmId,
    String? campId,
  }) {
    return CompartmentState(
      loading: loading ?? this.loading,
      listCompartment: listCompartment ?? this.listCompartment,
      error: error ?? this.error,
      farmId: farmId ?? this.farmId,
      campId: campId ?? this.campId,
    );
  }
}
