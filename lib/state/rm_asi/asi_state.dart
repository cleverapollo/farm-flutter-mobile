import 'package:cmo/model/asi.dart';

class AsiState {
  const AsiState({
    this.listAsi = const <Asi>[],
    this.farmId = '',
    this.loading = false,
    this.error,
  });

  final Object? error;
  final bool loading;
  final List<Asi> listAsi;
  final String farmId;

  AsiState copyWith({
    bool? loading,
    Object? error,
    List<Asi>? listAsi,
    String? farmId,
  }) {
    return AsiState(
      loading: loading ?? this.loading,
      listAsi: listAsi ?? this.listAsi,
      error: error ?? this.error,
      farmId: farmId ?? this.farmId,
    );
  }
}
