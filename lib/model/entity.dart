class Entity {
  final String name;

  final EntityType type;

  const Entity({
    required this.name,
    required this.type,
  });
}

enum EntityType { gs, rmu, cpy }
