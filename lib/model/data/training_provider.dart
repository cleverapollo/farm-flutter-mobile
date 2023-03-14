import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_provider.freezed.dart';
part 'training_provider.g.dart';

@freezed
class TrainingProvider with _$TrainingProvider {
  const factory TrainingProvider({
    @JsonKey(name: 'TrainingProviderId') int? trainingProviderId,
    @JsonKey(name: 'TrainingProviderName') String? trainingProviderName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _TrainingProvider;

  factory TrainingProvider.fromJson(Map<String, dynamic> json) => _$TrainingProviderFromJson(json);
}
