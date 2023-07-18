import 'package:cmo/model/asi.dart';

class AsiState {
  const AsiState({
    this.listAsi = const <Asi>[],
    this.filterAsi = const <Asi>[],
    this.farmId = '',
    this.campId,
    this.loading = false,
    this.error,
  });

  final Object? error;
  final bool loading;
  final List<Asi> listAsi;
  final List<Asi> filterAsi;
  final String farmId;
  final String? campId;

  AsiState copyWith({
    bool? loading,
    Object? error,
    List<Asi>? listAsi,
    List<Asi>? filterAsi,
    String? farmId,
    String? campId,
  }) {
    return AsiState(
      loading: loading ?? this.loading,
      listAsi: listAsi ?? this.listAsi,
      filterAsi: filterAsi ?? this.filterAsi,
      error: error ?? this.error,
      farmId: farmId ?? this.farmId,
      campId: campId ?? this.campId,
    );
  }
}
