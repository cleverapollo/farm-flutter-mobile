enum UserRoleEnum {
  behave,
  resourceManager,
  farmerMember;

  const UserRoleEnum();

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
    if (this == UserRoleEnum.resourceManager) {
      return true;
    }
    return false;
  }
}