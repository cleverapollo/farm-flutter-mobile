enum UserRoleEnum {
  behave(0),
  regionalManager(1),
  farmerMember(2);

  const UserRoleEnum(this.value);

  final int value;

  bool get isBehave {
    if (this == UserRoleEnum.behave) {
      return true;
    }
    return false;
  }

  bool get isFarmerMember {
    if (this == UserRoleEnum.farmerMember) {
      return true;
    }
    return false;
  }

  bool get isResourceManager {
    if (this == UserRoleEnum.regionalManager) {
      return true;
    }
    return false;
  }
}