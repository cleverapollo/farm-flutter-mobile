class EntityService {
  Future<List<String>> getNames() async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      'CMO',
      'GAW Gabon',
      'Border Timbers',
      'Mondi',
      'Test',
      'Magic Forest',
    ];
  }
}
