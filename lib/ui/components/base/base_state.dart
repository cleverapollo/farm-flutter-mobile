abstract class BaseState {
  const BaseState({
    this.isEditing = false,
    this.loading = false,
    this.error,
  });

  final bool isEditing;
  final Object? error;
  final bool loading;
}
