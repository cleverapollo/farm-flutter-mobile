import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'training_provider.freezed.dart';
part 'training_provider.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class TrainingProvider with _$TrainingProvider {
    const TrainingProvider._();

  @override
  Id get id => trainingProviderId;

  const factory TrainingProvider({
    @JsonKey(name: 'TrainingProviderId') required int  trainingProviderId,
    @JsonKey(name: 'TrainingProviderName') String? trainingProviderName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _TrainingProvider;

  factory TrainingProvider.fromJson(Map<String, dynamic> json) => _$TrainingProviderFromJson(json);
}
