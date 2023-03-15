import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

class AppMode extends Union3Impl<BehaveMode, ResourceManagerMode, FarmerMode> {
  factory AppMode.behave() => AppMode._(unions.first(const BehaveMode()));

  factory AppMode.resourceManager() =>
      AppMode._(unions.second(const ResourceManagerMode()));

  factory AppMode.farmer() => AppMode._(unions.third(const FarmerMode()));

  AppMode._(super.union);

  static const unions = Triplet<BehaveMode, ResourceManagerMode, FarmerMode>();
}

class BehaveMode {
  const BehaveMode();
}

class ResourceManagerMode {
  const ResourceManagerMode();
}

class FarmerMode {
  const FarmerMode();
}
