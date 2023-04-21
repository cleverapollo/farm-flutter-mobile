// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_production.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnualProduction _$AnnualProductionFromJson(Map<String, dynamic> json) {
  return _AnnualProduction.fromJson(json);
}

/// @nodoc
mixin _$AnnualProduction {
  @JsonKey(name: 'AnnualProductionId')
  int? get annualProductionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AnnualProductionName')
  String? get annualProductionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Workers')
  int? get workers => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductionPerWorker')
  int? get productionPerWorker => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductionPerTeam')
  int? get productionPerTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'BiomassRemoved')
  int? get biomassRemoved => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkCycles')
  double? get workCycles => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreateDT')
  String? get createDT => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdateDT')
  String? get updateDT => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLocal')
  bool? get isLocal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnualProductionCopyWith<AnnualProduction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnualProductionCopyWith<$Res> {
  factory $AnnualProductionCopyWith(
          AnnualProduction value, $Res Function(AnnualProduction) then) =
      _$AnnualProductionCopyWithImpl<$Res, AnnualProduction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AnnualProductionId') int? annualProductionId,
      @JsonKey(name: 'AnnualProductionName') String? annualProductionName,
      @JsonKey(name: 'Workers') int? workers,
      @JsonKey(name: 'ProductionPerWorker') int? productionPerWorker,
      @JsonKey(name: 'ProductionPerTeam') int? productionPerTeam,
      @JsonKey(name: 'BiomassRemoved') int? biomassRemoved,
      @JsonKey(name: 'WorkCycles') double? workCycles,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class _$AnnualProductionCopyWithImpl<$Res, $Val extends AnnualProduction>
    implements $AnnualProductionCopyWith<$Res> {
  _$AnnualProductionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annualProductionId = freezed,
    Object? annualProductionName = freezed,
    Object? workers = freezed,
    Object? productionPerWorker = freezed,
    Object? productionPerTeam = freezed,
    Object? biomassRemoved = freezed,
    Object? workCycles = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_value.copyWith(
      annualProductionId: freezed == annualProductionId
          ? _value.annualProductionId
          : annualProductionId // ignore: cast_nullable_to_non_nullable
              as int?,
      annualProductionName: freezed == annualProductionName
          ? _value.annualProductionName
          : annualProductionName // ignore: cast_nullable_to_non_nullable
              as String?,
      workers: freezed == workers
          ? _value.workers
          : workers // ignore: cast_nullable_to_non_nullable
              as int?,
      productionPerWorker: freezed == productionPerWorker
          ? _value.productionPerWorker
          : productionPerWorker // ignore: cast_nullable_to_non_nullable
              as int?,
      productionPerTeam: freezed == productionPerTeam
          ? _value.productionPerTeam
          : productionPerTeam // ignore: cast_nullable_to_non_nullable
              as int?,
      biomassRemoved: freezed == biomassRemoved
          ? _value.biomassRemoved
          : biomassRemoved // ignore: cast_nullable_to_non_nullable
              as int?,
      workCycles: freezed == workCycles
          ? _value.workCycles
          : workCycles // ignore: cast_nullable_to_non_nullable
              as double?,
      createDT: freezed == createDT
          ? _value.createDT
          : createDT // ignore: cast_nullable_to_non_nullable
              as String?,
      updateDT: freezed == updateDT
          ? _value.updateDT
          : updateDT // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnualProductionCopyWith<$Res>
    implements $AnnualProductionCopyWith<$Res> {
  factory _$$_AnnualProductionCopyWith(
          _$_AnnualProduction value, $Res Function(_$_AnnualProduction) then) =
      __$$_AnnualProductionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AnnualProductionId') int? annualProductionId,
      @JsonKey(name: 'AnnualProductionName') String? annualProductionName,
      @JsonKey(name: 'Workers') int? workers,
      @JsonKey(name: 'ProductionPerWorker') int? productionPerWorker,
      @JsonKey(name: 'ProductionPerTeam') int? productionPerTeam,
      @JsonKey(name: 'BiomassRemoved') int? biomassRemoved,
      @JsonKey(name: 'WorkCycles') double? workCycles,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class __$$_AnnualProductionCopyWithImpl<$Res>
    extends _$AnnualProductionCopyWithImpl<$Res, _$_AnnualProduction>
    implements _$$_AnnualProductionCopyWith<$Res> {
  __$$_AnnualProductionCopyWithImpl(
      _$_AnnualProduction _value, $Res Function(_$_AnnualProduction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annualProductionId = freezed,
    Object? annualProductionName = freezed,
    Object? workers = freezed,
    Object? productionPerWorker = freezed,
    Object? productionPerTeam = freezed,
    Object? biomassRemoved = freezed,
    Object? workCycles = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_$_AnnualProduction(
      annualProductionId: freezed == annualProductionId
          ? _value.annualProductionId
          : annualProductionId // ignore: cast_nullable_to_non_nullable
              as int?,
      annualProductionName: freezed == annualProductionName
          ? _value.annualProductionName
          : annualProductionName // ignore: cast_nullable_to_non_nullable
              as String?,
      workers: freezed == workers
          ? _value.workers
          : workers // ignore: cast_nullable_to_non_nullable
              as int?,
      productionPerWorker: freezed == productionPerWorker
          ? _value.productionPerWorker
          : productionPerWorker // ignore: cast_nullable_to_non_nullable
              as int?,
      productionPerTeam: freezed == productionPerTeam
          ? _value.productionPerTeam
          : productionPerTeam // ignore: cast_nullable_to_non_nullable
              as int?,
      biomassRemoved: freezed == biomassRemoved
          ? _value.biomassRemoved
          : biomassRemoved // ignore: cast_nullable_to_non_nullable
              as int?,
      workCycles: freezed == workCycles
          ? _value.workCycles
          : workCycles // ignore: cast_nullable_to_non_nullable
              as double?,
      createDT: freezed == createDT
          ? _value.createDT
          : createDT // ignore: cast_nullable_to_non_nullable
              as String?,
      updateDT: freezed == updateDT
          ? _value.updateDT
          : updateDT // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnnualProduction extends _AnnualProduction {
  const _$_AnnualProduction(
      {@JsonKey(name: 'AnnualProductionId') this.annualProductionId,
      @JsonKey(name: 'AnnualProductionName') this.annualProductionName,
      @JsonKey(name: 'Workers') this.workers,
      @JsonKey(name: 'ProductionPerWorker') this.productionPerWorker,
      @JsonKey(name: 'ProductionPerTeam') this.productionPerTeam,
      @JsonKey(name: 'BiomassRemoved') this.biomassRemoved,
      @JsonKey(name: 'WorkCycles') this.workCycles,
      @JsonKey(name: 'CreateDT') this.createDT,
      @JsonKey(name: 'UpdateDT') this.updateDT,
      @JsonKey(name: 'IsActive') this.isActive = true,
      @JsonKey(name: 'IsLocal') this.isLocal = true})
      : super._();

  factory _$_AnnualProduction.fromJson(Map<String, dynamic> json) =>
      _$$_AnnualProductionFromJson(json);

  @override
  @JsonKey(name: 'AnnualProductionId')
  final int? annualProductionId;
  @override
  @JsonKey(name: 'AnnualProductionName')
  final String? annualProductionName;
  @override
  @JsonKey(name: 'Workers')
  final int? workers;
  @override
  @JsonKey(name: 'ProductionPerWorker')
  final int? productionPerWorker;
  @override
  @JsonKey(name: 'ProductionPerTeam')
  final int? productionPerTeam;
  @override
  @JsonKey(name: 'BiomassRemoved')
  final int? biomassRemoved;
  @override
  @JsonKey(name: 'WorkCycles')
  final double? workCycles;
  @override
  @JsonKey(name: 'CreateDT')
  final String? createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  final String? updateDT;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'IsLocal')
  final bool? isLocal;

  @override
  String toString() {
    return 'AnnualProduction(annualProductionId: $annualProductionId, annualProductionName: $annualProductionName, workers: $workers, productionPerWorker: $productionPerWorker, productionPerTeam: $productionPerTeam, biomassRemoved: $biomassRemoved, workCycles: $workCycles, createDT: $createDT, updateDT: $updateDT, isActive: $isActive, isLocal: $isLocal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnualProduction &&
            (identical(other.annualProductionId, annualProductionId) ||
                other.annualProductionId == annualProductionId) &&
            (identical(other.annualProductionName, annualProductionName) ||
                other.annualProductionName == annualProductionName) &&
            (identical(other.workers, workers) || other.workers == workers) &&
            (identical(other.productionPerWorker, productionPerWorker) ||
                other.productionPerWorker == productionPerWorker) &&
            (identical(other.productionPerTeam, productionPerTeam) ||
                other.productionPerTeam == productionPerTeam) &&
            (identical(other.biomassRemoved, biomassRemoved) ||
                other.biomassRemoved == biomassRemoved) &&
            (identical(other.workCycles, workCycles) ||
                other.workCycles == workCycles) &&
            (identical(other.createDT, createDT) ||
                other.createDT == createDT) &&
            (identical(other.updateDT, updateDT) ||
                other.updateDT == updateDT) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      annualProductionId,
      annualProductionName,
      workers,
      productionPerWorker,
      productionPerTeam,
      biomassRemoved,
      workCycles,
      createDT,
      updateDT,
      isActive,
      isLocal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnualProductionCopyWith<_$_AnnualProduction> get copyWith =>
      __$$_AnnualProductionCopyWithImpl<_$_AnnualProduction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnualProductionToJson(
      this,
    );
  }
}

abstract class _AnnualProduction extends AnnualProduction {
  const factory _AnnualProduction(
      {@JsonKey(name: 'AnnualProductionId') final int? annualProductionId,
      @JsonKey(name: 'AnnualProductionName') final String? annualProductionName,
      @JsonKey(name: 'Workers') final int? workers,
      @JsonKey(name: 'ProductionPerWorker') final int? productionPerWorker,
      @JsonKey(name: 'ProductionPerTeam') final int? productionPerTeam,
      @JsonKey(name: 'BiomassRemoved') final int? biomassRemoved,
      @JsonKey(name: 'WorkCycles') final double? workCycles,
      @JsonKey(name: 'CreateDT') final String? createDT,
      @JsonKey(name: 'UpdateDT') final String? updateDT,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'IsLocal') final bool? isLocal}) = _$_AnnualProduction;
  const _AnnualProduction._() : super._();

  factory _AnnualProduction.fromJson(Map<String, dynamic> json) =
      _$_AnnualProduction.fromJson;

  @override
  @JsonKey(name: 'AnnualProductionId')
  int? get annualProductionId;
  @override
  @JsonKey(name: 'AnnualProductionName')
  String? get annualProductionName;
  @override
  @JsonKey(name: 'Workers')
  int? get workers;
  @override
  @JsonKey(name: 'ProductionPerWorker')
  int? get productionPerWorker;
  @override
  @JsonKey(name: 'ProductionPerTeam')
  int? get productionPerTeam;
  @override
  @JsonKey(name: 'BiomassRemoved')
  int? get biomassRemoved;
  @override
  @JsonKey(name: 'WorkCycles')
  double? get workCycles;
  @override
  @JsonKey(name: 'CreateDT')
  String? get createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  String? get updateDT;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'IsLocal')
  bool? get isLocal;
  @override
  @JsonKey(ignore: true)
  _$$_AnnualProductionCopyWith<_$_AnnualProduction> get copyWith =>
      throw _privateConstructorUsedError;
}
