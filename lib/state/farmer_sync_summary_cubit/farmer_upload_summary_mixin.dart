import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';

mixin FarmUploadSummaryMixin {
  String? get mixinFarmId => null;
  int? get mixinUserId => null;
  int? get mixinUserDeviceId => null;
  int? get mixinGroupSchemeId => null;
  int? get mixinRmuId => null;
  void Function(FarmerSyncSummaryState) get mixinEmit => ;

  FarmerSyncSummaryState get mixinState => const FarmerSyncSummaryState();
  String get masterTopic => 'Cmo.MasterData.';
  String get topicWorker => '$masterTopic$mixinFarmId.$mixinUserDeviceId';

  Future<void> onUploadingFarmData() async {
    final futures = <Future<void>>[];

    futures.add(_publishWorker());

    await Future.wait(futures);
  }

  Future<void> _publishWorker() async {
  }
}
