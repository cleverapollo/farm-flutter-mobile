import 'package:cmo/model/model.dart';
import 'package:cmo/model/stakeholder/farm_stake_holder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'farm_stakeholder_payload.freezed.dart';
part 'farm_stakeholder_payload.g.dart';

@freezed
class FarmStakeholderPayLoad with _$FarmStakeholderPayLoad {
  const factory FarmStakeholderPayLoad({
    @JsonKey(name: 'Stakeholder') StakeHolder? stakeholder,
    @JsonKey(name: 'FarmStakeholder') FarmStakeHolder? farmStakeholder,
    @JsonKey(name: 'FarmStakeholderSocialUpliftments') List<FarmStakeholderSocialUpliftment>? farmStakeholderSocialUpliftments,
    @JsonKey(name: 'FarmStakeholderSpecialSites') List<FarmStakeholderSpecialSite>? farmStakeholderSpecialSites,
    @JsonKey(name: 'FarmStakeholderCustomaryUseRights') List<FarmStakeholderCustomaryUseRight>? farmStakeholderCustomaryUseRights,
  }) = _FarmStakeholderPayLoad;
  factory FarmStakeholderPayLoad.fromJson(Map<String, dynamic> json) =>
      _$FarmStakeholderPayLoadFromJson(json);
}