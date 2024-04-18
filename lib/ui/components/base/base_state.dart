abstract class BaseState {
  const BaseState({
    this.isDataReady = false,
    this.isEditing = false,
    this.loading = false,
    this.error,
  });

  final bool isDataReady;
  final bool isEditing;
  final Object? error;
  final bool loading;
}
