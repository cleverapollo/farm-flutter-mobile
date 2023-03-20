extension ListX<T> on List<T> {
  List<T> get removeDuplicate => [
        ...{...this},
      ];
  List<T> get removeEmpty {
    removeWhere((e) => e?.toString().isEmpty ?? true);

    return this;
  }

  List<T> get removeNull {
    removeWhere((e) => e == null);

    return this;
  }

  T? indexExists(int key) {
    final itemMap = asMap();
    final exists = itemMap.containsKey(key);
    final item = itemMap[key];
    if (exists && item != null) {
      return item;
    }
    return null;
  }

  T? elementAtOrNull(int index) {
    var elementIndex = 0;
    for (final element in this) {
      if (index == elementIndex) return element;
      elementIndex++;
    }
    return null;
  }
}

List<T> listRemoveNull<T>(List<T?> data) {
  final dataNotNull = <T>[];
  for (final item in data) {
    if (item != null) {
      dataNotNull.add(item);
    }
  }
  return dataNotNull;
}
