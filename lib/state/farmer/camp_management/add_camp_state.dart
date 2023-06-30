class AddCampState {
  AddCampState({
    this.loading = false,
  });

  final bool loading;

  AddCampState copyWith({
    bool? loading,
  }) {
    return AddCampState(
      loading: loading ?? this.loading,
    );
  }
}
