// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compartment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Compartment _$CompartmentFromJson(Map<String, dynamic> json) {
  return _Compartment.fromJson(json);
}

/// @nodoc
mixin _$Compartment {
  @JsonKey(name: 'CompartmentId')
  int? get compartmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompartmentName')
  String? get compartmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AreaTypeId')
  String? get areaTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductGroupTemplateId')
  String? get productGroupTemplateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductGroupTemplateName')
  String? get productGroupTemplateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SpeciesGroupTemplateId')
  String? get speciesGroupTemplateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SpeciesGroupTemplateName')
  String? get speciesGroupTemplateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PolygonArea')
  double? get polygonArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitNumber')
  String? get unitNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'EffectiveArea')
  double? get effectiveArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'Espacement')
  String? get espacement => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlannedPlantDT')
  String? get plannedPlantDT => throw _privateConstructorUsedError;
  @JsonKey(name: 'Survival')
  double? get survival => throw _privateConstructorUsedError;
  @JsonKey(name: 'StockingPercentage')
  double? get stockingPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'RotationNumber')
  double? get rotationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'UtilMAI')
  double? get utilMAI => throw _privateConstructorUsedError; //@ignore
//@JsonKey(includeToJson: false, includeFromJson: false)
  @JsonKey(name: 'Locations')
  String? get jsonLocations => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompartmentCopyWith<Compartment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompartmentCopyWith<$Res> {
  factory $CompartmentCopyWith(
          Compartment value, $Res Function(Compartment) then) =
      _$CompartmentCopyWithImpl<$Res, Compartment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CompartmentId')
          int? compartmentId,
      @JsonKey(name: 'CompartmentName')
          String? compartmentName,
      @JsonKey(name: 'AreaTypeId')
          String? areaTypeId,
      @JsonKey(name: 'ProductGroupTemplateId')
          String? productGroupTemplateId,
      @JsonKey(name: 'ProductGroupTemplateName')
          String? productGroupTemplateName,
      @JsonKey(name: 'SpeciesGroupTemplateId')
          String? speciesGroupTemplateId,
      @JsonKey(name: 'SpeciesGroupTemplateName')
          String? speciesGroupTemplateName,
      @JsonKey(name: 'PolygonArea')
          double? polygonArea,
      @JsonKey(name: 'UnitNumber')
          String? unitNumber,
      @JsonKey(name: 'EffectiveArea')
          double? effectiveArea,
      @JsonKey(name: 'Espacement')
          String? espacement,
      @JsonKey(name: 'PlannedPlantDT')
          String? plannedPlantDT,
      @JsonKey(name: 'Survival')
          double? survival,
      @JsonKey(name: 'StockingPercentage')
          double? stockingPercentage,
      @JsonKey(name: 'RotationNumber')
          double? rotationNumber,
      @JsonKey(name: 'UtilMAI')
          double? utilMAI,
      @JsonKey(name: 'Locations')
          String? jsonLocations,
      @JsonKey(name: 'IsActive')
          bool? isActive});
}

/// @nodoc
class _$CompartmentCopyWithImpl<$Res, $Val extends Compartment>
    implements $CompartmentCopyWith<$Res> {
  _$CompartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compartmentId = freezed,
    Object? compartmentName = freezed,
    Object? areaTypeId = freezed,
    Object? productGroupTemplateId = freezed,
    Object? productGroupTemplateName = freezed,
    Object? speciesGroupTemplateId = freezed,
    Object? speciesGroupTemplateName = freezed,
    Object? polygonArea = freezed,
    Object? unitNumber = freezed,
    Object? effectiveArea = freezed,
    Object? espacement = freezed,
    Object? plannedPlantDT = freezed,
    Object? survival = freezed,
    Object? stockingPercentage = freezed,
    Object? rotationNumber = freezed,
    Object? utilMAI = freezed,
    Object? jsonLocations = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      compartmentId: freezed == compartmentId
          ? _value.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      areaTypeId: freezed == areaTypeId
          ? _value.areaTypeId
          : areaTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      productGroupTemplateId: freezed == productGroupTemplateId
          ? _value.productGroupTemplateId
          : productGroupTemplateId // ignore: cast_nullable_to_non_nullable
              as String?,
      productGroupTemplateName: freezed == productGroupTemplateName
          ? _value.productGroupTemplateName
          : productGroupTemplateName // ignore: cast_nullable_to_non_nullable
              as String?,
      speciesGroupTemplateId: freezed == speciesGroupTemplateId
          ? _value.speciesGroupTemplateId
          : speciesGroupTemplateId // ignore: cast_nullable_to_non_nullable
              as String?,
      speciesGroupTemplateName: freezed == speciesGroupTemplateName
          ? _value.speciesGroupTemplateName
          : speciesGroupTemplateName // ignore: cast_nullable_to_non_nullable
              as String?,
      polygonArea: freezed == polygonArea
          ? _value.polygonArea
          : polygonArea // ignore: cast_nullable_to_non_nullable
              as double?,
      unitNumber: freezed == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveArea: freezed == effectiveArea
          ? _value.effectiveArea
          : effectiveArea // ignore: cast_nullable_to_non_nullable
              as double?,
      espacement: freezed == espacement
          ? _value.espacement
          : espacement // ignore: cast_nullable_to_non_nullable
              as String?,
      plannedPlantDT: freezed == plannedPlantDT
          ? _value.plannedPlantDT
          : plannedPlantDT // ignore: cast_nullable_to_non_nullable
              as String?,
      survival: freezed == survival
          ? _value.survival
          : survival // ignore: cast_nullable_to_non_nullable
              as double?,
      stockingPercentage: freezed == stockingPercentage
          ? _value.stockingPercentage
          : stockingPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      rotationNumber: freezed == rotationNumber
          ? _value.rotationNumber
          : rotationNumber // ignore: cast_nullable_to_non_nullable
              as double?,
      utilMAI: freezed == utilMAI
          ? _value.utilMAI
          : utilMAI // ignore: cast_nullable_to_non_nullable
              as double?,
      jsonLocations: freezed == jsonLocations
          ? _value.jsonLocations
          : jsonLocations // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompartmentCopyWith<$Res>
    implements $CompartmentCopyWith<$Res> {
  factory _$$_CompartmentCopyWith(
          _$_Compartment value, $Res Function(_$_Compartment) then) =
      __$$_CompartmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CompartmentId')
          int? compartmentId,
      @JsonKey(name: 'CompartmentName')
          String? compartmentName,
      @JsonKey(name: 'AreaTypeId')
          String? areaTypeId,
      @JsonKey(name: 'ProductGroupTemplateId')
          String? productGroupTemplateId,
      @JsonKey(name: 'ProductGroupTemplateName')
          String? productGroupTemplateName,
      @JsonKey(name: 'SpeciesGroupTemplateId')
          String? speciesGroupTemplateId,
      @JsonKey(name: 'SpeciesGroupTemplateName')
          String? speciesGroupTemplateName,
      @JsonKey(name: 'PolygonArea')
          double? polygonArea,
      @JsonKey(name: 'UnitNumber')
          String? unitNumber,
      @JsonKey(name: 'EffectiveArea')
          double? effectiveArea,
      @JsonKey(name: 'Espacement')
          String? espacement,
      @JsonKey(name: 'PlannedPlantDT')
          String? plannedPlantDT,
      @JsonKey(name: 'Survival')
          double? survival,
      @JsonKey(name: 'StockingPercentage')
          double? stockingPercentage,
      @JsonKey(name: 'RotationNumber')
          double? rotationNumber,
      @JsonKey(name: 'UtilMAI')
          double? utilMAI,
      @JsonKey(name: 'Locations')
          String? jsonLocations,
      @JsonKey(name: 'IsActive')
          bool? isActive});
}

/// @nodoc
class __$$_CompartmentCopyWithImpl<$Res>
    extends _$CompartmentCopyWithImpl<$Res, _$_Compartment>
    implements _$$_CompartmentCopyWith<$Res> {
  __$$_CompartmentCopyWithImpl(
      _$_Compartment _value, $Res Function(_$_Compartment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compartmentId = freezed,
    Object? compartmentName = freezed,
    Object? areaTypeId = freezed,
    Object? productGroupTemplateId = freezed,
    Object? productGroupTemplateName = freezed,
    Object? speciesGroupTemplateId = freezed,
    Object? speciesGroupTemplateName = freezed,
    Object? polygonArea = freezed,
    Object? unitNumber = freezed,
    Object? effectiveArea = freezed,
    Object? espacement = freezed,
    Object? plannedPlantDT = freezed,
    Object? survival = freezed,
    Object? stockingPercentage = freezed,
    Object? rotationNumber = freezed,
    Object? utilMAI = freezed,
    Object? jsonLocations = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Compartment(
      compartmentId: freezed == compartmentId
          ? _value.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      areaTypeId: freezed == areaTypeId
          ? _value.areaTypeId
          : areaTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      productGroupTemplateId: freezed == productGroupTemplateId
          ? _value.productGroupTemplateId
          : productGroupTemplateId // ignore: cast_nullable_to_non_nullable
              as String?,
      productGroupTemplateName: freezed == productGroupTemplateName
          ? _value.productGroupTemplateName
          : productGroupTemplateName // ignore: cast_nullable_to_non_nullable
              as String?,
      speciesGroupTemplateId: freezed == speciesGroupTemplateId
          ? _value.speciesGroupTemplateId
          : speciesGroupTemplateId // ignore: cast_nullable_to_non_nullable
              as String?,
      speciesGroupTemplateName: freezed == speciesGroupTemplateName
          ? _value.speciesGroupTemplateName
          : speciesGroupTemplateName // ignore: cast_nullable_to_non_nullable
              as String?,
      polygonArea: freezed == polygonArea
          ? _value.polygonArea
          : polygonArea // ignore: cast_nullable_to_non_nullable
              as double?,
      unitNumber: freezed == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveArea: freezed == effectiveArea
          ? _value.effectiveArea
          : effectiveArea // ignore: cast_nullable_to_non_nullable
              as double?,
      espacement: freezed == espacement
          ? _value.espacement
          : espacement // ignore: cast_nullable_to_non_nullable
              as String?,
      plannedPlantDT: freezed == plannedPlantDT
          ? _value.plannedPlantDT
          : plannedPlantDT // ignore: cast_nullable_to_non_nullable
              as String?,
      survival: freezed == survival
          ? _value.survival
          : survival // ignore: cast_nullable_to_non_nullable
              as double?,
      stockingPercentage: freezed == stockingPercentage
          ? _value.stockingPercentage
          : stockingPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      rotationNumber: freezed == rotationNumber
          ? _value.rotationNumber
          : rotationNumber // ignore: cast_nullable_to_non_nullable
              as double?,
      utilMAI: freezed == utilMAI
          ? _value.utilMAI
          : utilMAI // ignore: cast_nullable_to_non_nullable
              as double?,
      jsonLocations: freezed == jsonLocations
          ? _value.jsonLocations
          : jsonLocations // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Compartment extends _Compartment {
  const _$_Compartment(
      {@JsonKey(name: 'CompartmentId') this.compartmentId,
      @JsonKey(name: 'CompartmentName') this.compartmentName,
      @JsonKey(name: 'AreaTypeId') this.areaTypeId,
      @JsonKey(name: 'ProductGroupTemplateId') this.productGroupTemplateId,
      @JsonKey(name: 'ProductGroupTemplateName') this.productGroupTemplateName,
      @JsonKey(name: 'SpeciesGroupTemplateId') this.speciesGroupTemplateId,
      @JsonKey(name: 'SpeciesGroupTemplateName') this.speciesGroupTemplateName,
      @JsonKey(name: 'PolygonArea') this.polygonArea,
      @JsonKey(name: 'UnitNumber') this.unitNumber,
      @JsonKey(name: 'EffectiveArea') this.effectiveArea,
      @JsonKey(name: 'Espacement') this.espacement,
      @JsonKey(name: 'PlannedPlantDT') this.plannedPlantDT,
      @JsonKey(name: 'Survival') this.survival,
      @JsonKey(name: 'StockingPercentage') this.stockingPercentage,
      @JsonKey(name: 'RotationNumber') this.rotationNumber,
      @JsonKey(name: 'UtilMAI') this.utilMAI,
      @JsonKey(name: 'Locations') this.jsonLocations,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_Compartment.fromJson(Map<String, dynamic> json) =>
      _$$_CompartmentFromJson(json);

  @override
  @JsonKey(name: 'CompartmentId')
  final int? compartmentId;
  @override
  @JsonKey(name: 'CompartmentName')
  final String? compartmentName;
  @override
  @JsonKey(name: 'AreaTypeId')
  final String? areaTypeId;
  @override
  @JsonKey(name: 'ProductGroupTemplateId')
  final String? productGroupTemplateId;
  @override
  @JsonKey(name: 'ProductGroupTemplateName')
  final String? productGroupTemplateName;
  @override
  @JsonKey(name: 'SpeciesGroupTemplateId')
  final String? speciesGroupTemplateId;
  @override
  @JsonKey(name: 'SpeciesGroupTemplateName')
  final String? speciesGroupTemplateName;
  @override
  @JsonKey(name: 'PolygonArea')
  final double? polygonArea;
  @override
  @JsonKey(name: 'UnitNumber')
  final String? unitNumber;
  @override
  @JsonKey(name: 'EffectiveArea')
  final double? effectiveArea;
  @override
  @JsonKey(name: 'Espacement')
  final String? espacement;
  @override
  @JsonKey(name: 'PlannedPlantDT')
  final String? plannedPlantDT;
  @override
  @JsonKey(name: 'Survival')
  final double? survival;
  @override
  @JsonKey(name: 'StockingPercentage')
  final double? stockingPercentage;
  @override
  @JsonKey(name: 'RotationNumber')
  final double? rotationNumber;
  @override
  @JsonKey(name: 'UtilMAI')
  final double? utilMAI;
//@ignore
//@JsonKey(includeToJson: false, includeFromJson: false)
  @override
  @JsonKey(name: 'Locations')
  final String? jsonLocations;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Compartment(compartmentId: $compartmentId, compartmentName: $compartmentName, areaTypeId: $areaTypeId, productGroupTemplateId: $productGroupTemplateId, productGroupTemplateName: $productGroupTemplateName, speciesGroupTemplateId: $speciesGroupTemplateId, speciesGroupTemplateName: $speciesGroupTemplateName, polygonArea: $polygonArea, unitNumber: $unitNumber, effectiveArea: $effectiveArea, espacement: $espacement, plannedPlantDT: $plannedPlantDT, survival: $survival, stockingPercentage: $stockingPercentage, rotationNumber: $rotationNumber, utilMAI: $utilMAI, jsonLocations: $jsonLocations, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Compartment &&
            (identical(other.compartmentId, compartmentId) ||
                other.compartmentId == compartmentId) &&
            (identical(other.compartmentName, compartmentName) ||
                other.compartmentName == compartmentName) &&
            (identical(other.areaTypeId, areaTypeId) ||
                other.areaTypeId == areaTypeId) &&
            (identical(other.productGroupTemplateId, productGroupTemplateId) ||
                other.productGroupTemplateId == productGroupTemplateId) &&
            (identical(
                    other.productGroupTemplateName, productGroupTemplateName) ||
                other.productGroupTemplateName == productGroupTemplateName) &&
            (identical(other.speciesGroupTemplateId, speciesGroupTemplateId) ||
                other.speciesGroupTemplateId == speciesGroupTemplateId) &&
            (identical(
                    other.speciesGroupTemplateName, speciesGroupTemplateName) ||
                other.speciesGroupTemplateName == speciesGroupTemplateName) &&
            (identical(other.polygonArea, polygonArea) ||
                other.polygonArea == polygonArea) &&
            (identical(other.unitNumber, unitNumber) ||
                other.unitNumber == unitNumber) &&
            (identical(other.effectiveArea, effectiveArea) ||
                other.effectiveArea == effectiveArea) &&
            (identical(other.espacement, espacement) ||
                other.espacement == espacement) &&
            (identical(other.plannedPlantDT, plannedPlantDT) ||
                other.plannedPlantDT == plannedPlantDT) &&
            (identical(other.survival, survival) ||
                other.survival == survival) &&
            (identical(other.stockingPercentage, stockingPercentage) ||
                other.stockingPercentage == stockingPercentage) &&
            (identical(other.rotationNumber, rotationNumber) ||
                other.rotationNumber == rotationNumber) &&
            (identical(other.utilMAI, utilMAI) || other.utilMAI == utilMAI) &&
            (identical(other.jsonLocations, jsonLocations) ||
                other.jsonLocations == jsonLocations) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      compartmentId,
      compartmentName,
      areaTypeId,
      productGroupTemplateId,
      productGroupTemplateName,
      speciesGroupTemplateId,
      speciesGroupTemplateName,
      polygonArea,
      unitNumber,
      effectiveArea,
      espacement,
      plannedPlantDT,
      survival,
      stockingPercentage,
      rotationNumber,
      utilMAI,
      jsonLocations,
      isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompartmentCopyWith<_$_Compartment> get copyWith =>
      __$$_CompartmentCopyWithImpl<_$_Compartment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompartmentToJson(
      this,
    );
  }
}

abstract class _Compartment extends Compartment {
  const factory _Compartment(
      {@JsonKey(name: 'CompartmentId')
          final int? compartmentId,
      @JsonKey(name: 'CompartmentName')
          final String? compartmentName,
      @JsonKey(name: 'AreaTypeId')
          final String? areaTypeId,
      @JsonKey(name: 'ProductGroupTemplateId')
          final String? productGroupTemplateId,
      @JsonKey(name: 'ProductGroupTemplateName')
          final String? productGroupTemplateName,
      @JsonKey(name: 'SpeciesGroupTemplateId')
          final String? speciesGroupTemplateId,
      @JsonKey(name: 'SpeciesGroupTemplateName')
          final String? speciesGroupTemplateName,
      @JsonKey(name: 'PolygonArea')
          final double? polygonArea,
      @JsonKey(name: 'UnitNumber')
          final String? unitNumber,
      @JsonKey(name: 'EffectiveArea')
          final double? effectiveArea,
      @JsonKey(name: 'Espacement')
          final String? espacement,
      @JsonKey(name: 'PlannedPlantDT')
          final String? plannedPlantDT,
      @JsonKey(name: 'Survival')
          final double? survival,
      @JsonKey(name: 'StockingPercentage')
          final double? stockingPercentage,
      @JsonKey(name: 'RotationNumber')
          final double? rotationNumber,
      @JsonKey(name: 'UtilMAI')
          final double? utilMAI,
      @JsonKey(name: 'Locations')
          final String? jsonLocations,
      @JsonKey(name: 'IsActive')
          final bool? isActive}) = _$_Compartment;
  const _Compartment._() : super._();

  factory _Compartment.fromJson(Map<String, dynamic> json) =
      _$_Compartment.fromJson;

  @override
  @JsonKey(name: 'CompartmentId')
  int? get compartmentId;
  @override
  @JsonKey(name: 'CompartmentName')
  String? get compartmentName;
  @override
  @JsonKey(name: 'AreaTypeId')
  String? get areaTypeId;
  @override
  @JsonKey(name: 'ProductGroupTemplateId')
  String? get productGroupTemplateId;
  @override
  @JsonKey(name: 'ProductGroupTemplateName')
  String? get productGroupTemplateName;
  @override
  @JsonKey(name: 'SpeciesGroupTemplateId')
  String? get speciesGroupTemplateId;
  @override
  @JsonKey(name: 'SpeciesGroupTemplateName')
  String? get speciesGroupTemplateName;
  @override
  @JsonKey(name: 'PolygonArea')
  double? get polygonArea;
  @override
  @JsonKey(name: 'UnitNumber')
  String? get unitNumber;
  @override
  @JsonKey(name: 'EffectiveArea')
  double? get effectiveArea;
  @override
  @JsonKey(name: 'Espacement')
  String? get espacement;
  @override
  @JsonKey(name: 'PlannedPlantDT')
  String? get plannedPlantDT;
  @override
  @JsonKey(name: 'Survival')
  double? get survival;
  @override
  @JsonKey(name: 'StockingPercentage')
  double? get stockingPercentage;
  @override
  @JsonKey(name: 'RotationNumber')
  double? get rotationNumber;
  @override
  @JsonKey(name: 'UtilMAI')
  double? get utilMAI;
  @override //@ignore
//@JsonKey(includeToJson: false, includeFromJson: false)
  @JsonKey(name: 'Locations')
  String? get jsonLocations;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_CompartmentCopyWith<_$_Compartment> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) {
  return _GeoLocation.fromJson(json);
}

/// @nodoc
mixin _$GeoLocation {
  @JsonKey(name: 'Latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Longitude')
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoLocationCopyWith<GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoLocationCopyWith<$Res> {
  factory $GeoLocationCopyWith(
          GeoLocation value, $Res Function(GeoLocation) then) =
      _$GeoLocationCopyWithImpl<$Res, GeoLocation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Latitude') double? latitude,
      @JsonKey(name: 'Longitude') double? longitude});
}

/// @nodoc
class _$GeoLocationCopyWithImpl<$Res, $Val extends GeoLocation>
    implements $GeoLocationCopyWith<$Res> {
  _$GeoLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeoLocationCopyWith<$Res>
    implements $GeoLocationCopyWith<$Res> {
  factory _$$_GeoLocationCopyWith(
          _$_GeoLocation value, $Res Function(_$_GeoLocation) then) =
      __$$_GeoLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Latitude') double? latitude,
      @JsonKey(name: 'Longitude') double? longitude});
}

/// @nodoc
class __$$_GeoLocationCopyWithImpl<$Res>
    extends _$GeoLocationCopyWithImpl<$Res, _$_GeoLocation>
    implements _$$_GeoLocationCopyWith<$Res> {
  __$$_GeoLocationCopyWithImpl(
      _$_GeoLocation _value, $Res Function(_$_GeoLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_GeoLocation(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoLocation implements _GeoLocation {
  const _$_GeoLocation(
      {@JsonKey(name: 'Latitude') this.latitude,
      @JsonKey(name: 'Longitude') this.longitude});

  factory _$_GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$$_GeoLocationFromJson(json);

  @override
  @JsonKey(name: 'Latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'Longitude')
  final double? longitude;

  @override
  String toString() {
    return 'GeoLocation(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoLocation &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoLocationCopyWith<_$_GeoLocation> get copyWith =>
      __$$_GeoLocationCopyWithImpl<_$_GeoLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoLocationToJson(
      this,
    );
  }
}

abstract class _GeoLocation implements GeoLocation {
  const factory _GeoLocation(
      {@JsonKey(name: 'Latitude') final double? latitude,
      @JsonKey(name: 'Longitude') final double? longitude}) = _$_GeoLocation;

  factory _GeoLocation.fromJson(Map<String, dynamic> json) =
      _$_GeoLocation.fromJson;

  @override
  @JsonKey(name: 'Latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'Longitude')
  double? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_GeoLocationCopyWith<_$_GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
