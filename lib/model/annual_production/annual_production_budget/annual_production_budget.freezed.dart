// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_production_budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnualProductionBudget _$AnnualProductionBudgetFromJson(
    Map<String, dynamic> json) {
  return _AnnualProductionBudget.fromJson(json);
}

/// @nodoc
mixin _$AnnualProductionBudget {
  @JsonKey(name: 'FarmId')
  int? get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AnnualBudgetId')
  int? get annualBudgetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AnnualBudgetName')
  String? get annualBudgetName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AnnualFarmProductionId')
  int? get annualFarmProductionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'IncomeAmount')
  double? get incomeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpenseAmount')
  double? get expenseAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'BalanceAmount')
  double? get balanceAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLocal')
  bool? get isLocal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnualProductionBudgetCopyWith<AnnualProductionBudget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnualProductionBudgetCopyWith<$Res> {
  factory $AnnualProductionBudgetCopyWith(AnnualProductionBudget value,
          $Res Function(AnnualProductionBudget) then) =
      _$AnnualProductionBudgetCopyWithImpl<$Res, AnnualProductionBudget>;
  @useResult
  $Res call(
      {@JsonKey(name: 'FarmId') int? farmId,
      @JsonKey(name: 'AnnualBudgetId') int? annualBudgetId,
      @JsonKey(name: 'AnnualBudgetName') String? annualBudgetName,
      @JsonKey(name: 'AnnualFarmProductionId') int? annualFarmProductionId,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'IncomeAmount') double? incomeAmount,
      @JsonKey(name: 'ExpenseAmount') double? expenseAmount,
      @JsonKey(name: 'BalanceAmount') double? balanceAmount,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class _$AnnualProductionBudgetCopyWithImpl<$Res,
        $Val extends AnnualProductionBudget>
    implements $AnnualProductionBudgetCopyWith<$Res> {
  _$AnnualProductionBudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmId = freezed,
    Object? annualBudgetId = freezed,
    Object? annualBudgetName = freezed,
    Object? annualFarmProductionId = freezed,
    Object? year = freezed,
    Object? incomeAmount = freezed,
    Object? expenseAmount = freezed,
    Object? balanceAmount = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_value.copyWith(
      farmId: freezed == farmId
          ? _value.farmId
          : farmId // ignore: cast_nullable_to_non_nullable
              as int?,
      annualBudgetId: freezed == annualBudgetId
          ? _value.annualBudgetId
          : annualBudgetId // ignore: cast_nullable_to_non_nullable
              as int?,
      annualBudgetName: freezed == annualBudgetName
          ? _value.annualBudgetName
          : annualBudgetName // ignore: cast_nullable_to_non_nullable
              as String?,
      annualFarmProductionId: freezed == annualFarmProductionId
          ? _value.annualFarmProductionId
          : annualFarmProductionId // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      incomeAmount: freezed == incomeAmount
          ? _value.incomeAmount
          : incomeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      expenseAmount: freezed == expenseAmount
          ? _value.expenseAmount
          : expenseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceAmount: freezed == balanceAmount
          ? _value.balanceAmount
          : balanceAmount // ignore: cast_nullable_to_non_nullable
              as double?,
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
abstract class _$$_AnnualProductionBudgetCopyWith<$Res>
    implements $AnnualProductionBudgetCopyWith<$Res> {
  factory _$$_AnnualProductionBudgetCopyWith(_$_AnnualProductionBudget value,
          $Res Function(_$_AnnualProductionBudget) then) =
      __$$_AnnualProductionBudgetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'FarmId') int? farmId,
      @JsonKey(name: 'AnnualBudgetId') int? annualBudgetId,
      @JsonKey(name: 'AnnualBudgetName') String? annualBudgetName,
      @JsonKey(name: 'AnnualFarmProductionId') int? annualFarmProductionId,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'IncomeAmount') double? incomeAmount,
      @JsonKey(name: 'ExpenseAmount') double? expenseAmount,
      @JsonKey(name: 'BalanceAmount') double? balanceAmount,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class __$$_AnnualProductionBudgetCopyWithImpl<$Res>
    extends _$AnnualProductionBudgetCopyWithImpl<$Res,
        _$_AnnualProductionBudget>
    implements _$$_AnnualProductionBudgetCopyWith<$Res> {
  __$$_AnnualProductionBudgetCopyWithImpl(_$_AnnualProductionBudget _value,
      $Res Function(_$_AnnualProductionBudget) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmId = freezed,
    Object? annualBudgetId = freezed,
    Object? annualBudgetName = freezed,
    Object? annualFarmProductionId = freezed,
    Object? year = freezed,
    Object? incomeAmount = freezed,
    Object? expenseAmount = freezed,
    Object? balanceAmount = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_$_AnnualProductionBudget(
      farmId: freezed == farmId
          ? _value.farmId
          : farmId // ignore: cast_nullable_to_non_nullable
              as int?,
      annualBudgetId: freezed == annualBudgetId
          ? _value.annualBudgetId
          : annualBudgetId // ignore: cast_nullable_to_non_nullable
              as int?,
      annualBudgetName: freezed == annualBudgetName
          ? _value.annualBudgetName
          : annualBudgetName // ignore: cast_nullable_to_non_nullable
              as String?,
      annualFarmProductionId: freezed == annualFarmProductionId
          ? _value.annualFarmProductionId
          : annualFarmProductionId // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      incomeAmount: freezed == incomeAmount
          ? _value.incomeAmount
          : incomeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      expenseAmount: freezed == expenseAmount
          ? _value.expenseAmount
          : expenseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceAmount: freezed == balanceAmount
          ? _value.balanceAmount
          : balanceAmount // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$_AnnualProductionBudget extends _AnnualProductionBudget {
  const _$_AnnualProductionBudget(
      {@JsonKey(name: 'FarmId') this.farmId,
      @JsonKey(name: 'AnnualBudgetId') this.annualBudgetId,
      @JsonKey(name: 'AnnualBudgetName') this.annualBudgetName,
      @JsonKey(name: 'AnnualFarmProductionId') this.annualFarmProductionId,
      @JsonKey(name: 'Year') this.year,
      @JsonKey(name: 'IncomeAmount') this.incomeAmount,
      @JsonKey(name: 'ExpenseAmount') this.expenseAmount,
      @JsonKey(name: 'BalanceAmount') this.balanceAmount,
      @JsonKey(name: 'IsActive') this.isActive = true,
      @JsonKey(name: 'IsLocal') this.isLocal = true})
      : super._();

  factory _$_AnnualProductionBudget.fromJson(Map<String, dynamic> json) =>
      _$$_AnnualProductionBudgetFromJson(json);

  @override
  @JsonKey(name: 'FarmId')
  final int? farmId;
  @override
  @JsonKey(name: 'AnnualBudgetId')
  final int? annualBudgetId;
  @override
  @JsonKey(name: 'AnnualBudgetName')
  final String? annualBudgetName;
  @override
  @JsonKey(name: 'AnnualFarmProductionId')
  final int? annualFarmProductionId;
  @override
  @JsonKey(name: 'Year')
  final int? year;
  @override
  @JsonKey(name: 'IncomeAmount')
  final double? incomeAmount;
  @override
  @JsonKey(name: 'ExpenseAmount')
  final double? expenseAmount;
  @override
  @JsonKey(name: 'BalanceAmount')
  final double? balanceAmount;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'IsLocal')
  final bool? isLocal;

  @override
  String toString() {
    return 'AnnualProductionBudget(farmId: $farmId, annualBudgetId: $annualBudgetId, annualBudgetName: $annualBudgetName, annualFarmProductionId: $annualFarmProductionId, year: $year, incomeAmount: $incomeAmount, expenseAmount: $expenseAmount, balanceAmount: $balanceAmount, isActive: $isActive, isLocal: $isLocal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnualProductionBudget &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.annualBudgetId, annualBudgetId) ||
                other.annualBudgetId == annualBudgetId) &&
            (identical(other.annualBudgetName, annualBudgetName) ||
                other.annualBudgetName == annualBudgetName) &&
            (identical(other.annualFarmProductionId, annualFarmProductionId) ||
                other.annualFarmProductionId == annualFarmProductionId) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.incomeAmount, incomeAmount) ||
                other.incomeAmount == incomeAmount) &&
            (identical(other.expenseAmount, expenseAmount) ||
                other.expenseAmount == expenseAmount) &&
            (identical(other.balanceAmount, balanceAmount) ||
                other.balanceAmount == balanceAmount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      farmId,
      annualBudgetId,
      annualBudgetName,
      annualFarmProductionId,
      year,
      incomeAmount,
      expenseAmount,
      balanceAmount,
      isActive,
      isLocal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnualProductionBudgetCopyWith<_$_AnnualProductionBudget> get copyWith =>
      __$$_AnnualProductionBudgetCopyWithImpl<_$_AnnualProductionBudget>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnualProductionBudgetToJson(
      this,
    );
  }
}

abstract class _AnnualProductionBudget extends AnnualProductionBudget {
  const factory _AnnualProductionBudget(
      {@JsonKey(name: 'FarmId')
          final int? farmId,
      @JsonKey(name: 'AnnualBudgetId')
          final int? annualBudgetId,
      @JsonKey(name: 'AnnualBudgetName')
          final String? annualBudgetName,
      @JsonKey(name: 'AnnualFarmProductionId')
          final int? annualFarmProductionId,
      @JsonKey(name: 'Year')
          final int? year,
      @JsonKey(name: 'IncomeAmount')
          final double? incomeAmount,
      @JsonKey(name: 'ExpenseAmount')
          final double? expenseAmount,
      @JsonKey(name: 'BalanceAmount')
          final double? balanceAmount,
      @JsonKey(name: 'IsActive')
          final bool? isActive,
      @JsonKey(name: 'IsLocal')
          final bool? isLocal}) = _$_AnnualProductionBudget;
  const _AnnualProductionBudget._() : super._();

  factory _AnnualProductionBudget.fromJson(Map<String, dynamic> json) =
      _$_AnnualProductionBudget.fromJson;

  @override
  @JsonKey(name: 'FarmId')
  int? get farmId;
  @override
  @JsonKey(name: 'AnnualBudgetId')
  int? get annualBudgetId;
  @override
  @JsonKey(name: 'AnnualBudgetName')
  String? get annualBudgetName;
  @override
  @JsonKey(name: 'AnnualFarmProductionId')
  int? get annualFarmProductionId;
  @override
  @JsonKey(name: 'Year')
  int? get year;
  @override
  @JsonKey(name: 'IncomeAmount')
  double? get incomeAmount;
  @override
  @JsonKey(name: 'ExpenseAmount')
  double? get expenseAmount;
  @override
  @JsonKey(name: 'BalanceAmount')
  double? get balanceAmount;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'IsLocal')
  bool? get isLocal;
  @override
  @JsonKey(ignore: true)
  _$$_AnnualProductionBudgetCopyWith<_$_AnnualProductionBudget> get copyWith =>
      throw _privateConstructorUsedError;
}
