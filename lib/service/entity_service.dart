import 'package:cmo/utils/utils.dart';

class EntityService {
  Future<List<String>> getNames() async {
    await delay(1000);
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
