class BaseSyncState {
  const BaseSyncState(
      {this.syncMessage, this.isLoading = false, this.isLoaded = false});

  final String? syncMessage;
  final bool isLoading;
  final bool isLoaded;
}
