class CompartmentDetailState {
  const CompartmentDetailState({
    this.loading = false,
    this.error,
  });

  final Object? error;
  final bool loading;

  CompartmentDetailState copyWith({
    bool? loading,
    Object? error,
  }) {
    return CompartmentDetailState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
