part of 'compartment_cubit.dart';

class CompartmentState {
  const CompartmentState({
    this.listCompartment = const <Compartment>[],
    this.loading = false,
    this.error,
  });

  final Object? error;
  final bool loading;
  final List<Compartment> listCompartment;

  CompartmentState copyWith({
    bool? loading,
    Object? error,
    List<Compartment>? listCompartment,
  }) {
    return CompartmentState(
      loading: loading ?? this.loading,
      listCompartment: listCompartment ?? this.listCompartment,
      error: error ?? this.error,
    );
  }
}
