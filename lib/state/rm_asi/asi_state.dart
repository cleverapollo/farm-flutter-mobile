import 'package:cmo/model/model.dart';

class AsiState {
  const AsiState({
    this.listAsi = const <Asi>[],
    this.filterAsi = const <Asi>[],
    this.asiTypes = const <AsiType>[],
    this.farmId = '',
    this.campId,
    this.loading = false,
    this.error,
  });

  final Object? error;
  final bool loading;
  final List<Asi> listAsi;
  final List<Asi> filterAsi;
  final List<AsiType> asiTypes;
  final String farmId;
  final String? campId;

  AsiState copyWith({
    bool? loading,
    Object? error,
    List<Asi>? listAsi,
    List<Asi>? filterAsi,
    List<AsiType>? asiTypes,
    String? farmId,
    String? campId,
  }) {
    return AsiState(
      loading: loading ?? this.loading,
      listAsi: listAsi ?? this.listAsi,
      filterAsi: filterAsi ?? this.filterAsi,
      error: error ?? this.error,
      asiTypes: asiTypes ?? this.asiTypes,
      farmId: farmId ?? this.farmId,
      campId: campId ?? this.campId,
    );
  }
}
