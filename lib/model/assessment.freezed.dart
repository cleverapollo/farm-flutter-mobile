// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Assessment _$AssessmentFromJson(Map<String, dynamic> json) {
  return _Assessment.fromJson(json);
}

/// @nodoc
mixin _$Assessment {
  @JsonKey(name: 'AssessmentId')
  int? get assessmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyId')
  int? get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobCategoryId')
  int? get jobCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobDescriptionId')
  int? get jobDescriptionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlantationId')
  int? get plantationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContractorId')
  int? get contractorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TeamId')
  int? get teamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkerId')
  String? get workerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Lat')
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'Long')
  double? get long => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobCategoryName')
  String? get jobCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobDescriptionName')
  String? get jobDescriptionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlantationName')
  String? get plantationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContractorName')
  String? get contractorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TeamName')
  String? get teamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkerName')
  String? get workerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreateDT')
  String? get createDT => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdateDT')
  String? get updateDT => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentCopyWith<Assessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentCopyWith<$Res> {
  factory $AssessmentCopyWith(
          Assessment value, $Res Function(Assessment) then) =
      _$AssessmentCopyWithImpl<$Res, Assessment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AssessmentId') int? assessmentId,
      @JsonKey(name: 'CompanyId') int? companyId,
      @JsonKey(name: 'UserId') int? userId,
      @JsonKey(name: 'JobCategoryId') int? jobCategoryId,
      @JsonKey(name: 'JobDescriptionId') int? jobDescriptionId,
      @JsonKey(name: 'PlantationId') int? plantationId,
      @JsonKey(name: 'ContractorId') int? contractorId,
      @JsonKey(name: 'TeamId') int? teamId,
      @JsonKey(name: 'WorkerId') String? workerId,
      @JsonKey(name: 'Lat') double? lat,
      @JsonKey(name: 'Long') double? long,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'JobCategoryName') String? jobCategoryName,
      @JsonKey(name: 'JobDescriptionName') String? jobDescriptionName,
      @JsonKey(name: 'PlantationName') String? plantationName,
      @JsonKey(name: 'ContractorName') String? contractorName,
      @JsonKey(name: 'TeamName') String? teamName,
      @JsonKey(name: 'WorkerName') String? workerName,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT});
}

/// @nodoc
class _$AssessmentCopyWithImpl<$Res, $Val extends Assessment>
    implements $AssessmentCopyWith<$Res> {
  _$AssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentId = freezed,
    Object? companyId = freezed,
    Object? userId = freezed,
    Object? jobCategoryId = freezed,
    Object? jobDescriptionId = freezed,
    Object? plantationId = freezed,
    Object? contractorId = freezed,
    Object? teamId = freezed,
    Object? workerId = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? location = freezed,
    Object? jobCategoryName = freezed,
    Object? jobDescriptionName = freezed,
    Object? plantationName = freezed,
    Object? contractorName = freezed,
    Object? teamName = freezed,
    Object? workerName = freezed,
    Object? status = freezed,
    Object? isActive = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
  }) {
    return _then(_value.copyWith(
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      jobCategoryId: freezed == jobCategoryId
          ? _value.jobCategoryId
          : jobCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      jobDescriptionId: freezed == jobDescriptionId
          ? _value.jobDescriptionId
          : jobDescriptionId // ignore: cast_nullable_to_non_nullable
              as int?,
      plantationId: freezed == plantationId
          ? _value.plantationId
          : plantationId // ignore: cast_nullable_to_non_nullable
              as int?,
      contractorId: freezed == contractorId
          ? _value.contractorId
          : contractorId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      workerId: freezed == workerId
          ? _value.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      jobCategoryName: freezed == jobCategoryName
          ? _value.jobCategoryName
          : jobCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      jobDescriptionName: freezed == jobDescriptionName
          ? _value.jobDescriptionName
          : jobDescriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      plantationName: freezed == plantationName
          ? _value.plantationName
          : plantationName // ignore: cast_nullable_to_non_nullable
              as String?,
      contractorName: freezed == contractorName
          ? _value.contractorName
          : contractorName // ignore: cast_nullable_to_non_nullable
              as String?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
      workerName: freezed == workerName
          ? _value.workerName
          : workerName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createDT: freezed == createDT
          ? _value.createDT
          : createDT // ignore: cast_nullable_to_non_nullable
              as String?,
      updateDT: freezed == updateDT
          ? _value.updateDT
          : updateDT // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssessmentCopyWith<$Res>
    implements $AssessmentCopyWith<$Res> {
  factory _$$_AssessmentCopyWith(
          _$_Assessment value, $Res Function(_$_Assessment) then) =
      __$$_AssessmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AssessmentId') int? assessmentId,
      @JsonKey(name: 'CompanyId') int? companyId,
      @JsonKey(name: 'UserId') int? userId,
      @JsonKey(name: 'JobCategoryId') int? jobCategoryId,
      @JsonKey(name: 'JobDescriptionId') int? jobDescriptionId,
      @JsonKey(name: 'PlantationId') int? plantationId,
      @JsonKey(name: 'ContractorId') int? contractorId,
      @JsonKey(name: 'TeamId') int? teamId,
      @JsonKey(name: 'WorkerId') String? workerId,
      @JsonKey(name: 'Lat') double? lat,
      @JsonKey(name: 'Long') double? long,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'JobCategoryName') String? jobCategoryName,
      @JsonKey(name: 'JobDescriptionName') String? jobDescriptionName,
      @JsonKey(name: 'PlantationName') String? plantationName,
      @JsonKey(name: 'ContractorName') String? contractorName,
      @JsonKey(name: 'TeamName') String? teamName,
      @JsonKey(name: 'WorkerName') String? workerName,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT});
}

/// @nodoc
class __$$_AssessmentCopyWithImpl<$Res>
    extends _$AssessmentCopyWithImpl<$Res, _$_Assessment>
    implements _$$_AssessmentCopyWith<$Res> {
  __$$_AssessmentCopyWithImpl(
      _$_Assessment _value, $Res Function(_$_Assessment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentId = freezed,
    Object? companyId = freezed,
    Object? userId = freezed,
    Object? jobCategoryId = freezed,
    Object? jobDescriptionId = freezed,
    Object? plantationId = freezed,
    Object? contractorId = freezed,
    Object? teamId = freezed,
    Object? workerId = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? location = freezed,
    Object? jobCategoryName = freezed,
    Object? jobDescriptionName = freezed,
    Object? plantationName = freezed,
    Object? contractorName = freezed,
    Object? teamName = freezed,
    Object? workerName = freezed,
    Object? status = freezed,
    Object? isActive = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
  }) {
    return _then(_$_Assessment(
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      jobCategoryId: freezed == jobCategoryId
          ? _value.jobCategoryId
          : jobCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      jobDescriptionId: freezed == jobDescriptionId
          ? _value.jobDescriptionId
          : jobDescriptionId // ignore: cast_nullable_to_non_nullable
              as int?,
      plantationId: freezed == plantationId
          ? _value.plantationId
          : plantationId // ignore: cast_nullable_to_non_nullable
              as int?,
      contractorId: freezed == contractorId
          ? _value.contractorId
          : contractorId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      workerId: freezed == workerId
          ? _value.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      jobCategoryName: freezed == jobCategoryName
          ? _value.jobCategoryName
          : jobCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      jobDescriptionName: freezed == jobDescriptionName
          ? _value.jobDescriptionName
          : jobDescriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      plantationName: freezed == plantationName
          ? _value.plantationName
          : plantationName // ignore: cast_nullable_to_non_nullable
              as String?,
      contractorName: freezed == contractorName
          ? _value.contractorName
          : contractorName // ignore: cast_nullable_to_non_nullable
              as String?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
      workerName: freezed == workerName
          ? _value.workerName
          : workerName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createDT: freezed == createDT
          ? _value.createDT
          : createDT // ignore: cast_nullable_to_non_nullable
              as String?,
      updateDT: freezed == updateDT
          ? _value.updateDT
          : updateDT // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Assessment extends _Assessment {
  const _$_Assessment(
      {@JsonKey(name: 'AssessmentId') required this.assessmentId,
      @JsonKey(name: 'CompanyId') this.companyId,
      @JsonKey(name: 'UserId') this.userId,
      @JsonKey(name: 'JobCategoryId') this.jobCategoryId,
      @JsonKey(name: 'JobDescriptionId') this.jobDescriptionId,
      @JsonKey(name: 'PlantationId') this.plantationId,
      @JsonKey(name: 'ContractorId') this.contractorId,
      @JsonKey(name: 'TeamId') this.teamId,
      @JsonKey(name: 'WorkerId') this.workerId,
      @JsonKey(name: 'Lat') this.lat,
      @JsonKey(name: 'Long') this.long,
      @JsonKey(name: 'Location') this.location,
      @JsonKey(name: 'JobCategoryName') this.jobCategoryName,
      @JsonKey(name: 'JobDescriptionName') this.jobDescriptionName,
      @JsonKey(name: 'PlantationName') this.plantationName,
      @JsonKey(name: 'ContractorName') this.contractorName,
      @JsonKey(name: 'TeamName') this.teamName,
      @JsonKey(name: 'WorkerName') this.workerName,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'CreateDT') this.createDT,
      @JsonKey(name: 'UpdateDT') this.updateDT})
      : super._();

  factory _$_Assessment.fromJson(Map<String, dynamic> json) =>
      _$$_AssessmentFromJson(json);

  @override
  @JsonKey(name: 'AssessmentId')
  final int? assessmentId;
  @override
  @JsonKey(name: 'CompanyId')
  final int? companyId;
  @override
  @JsonKey(name: 'UserId')
  final int? userId;
  @override
  @JsonKey(name: 'JobCategoryId')
  final int? jobCategoryId;
  @override
  @JsonKey(name: 'JobDescriptionId')
  final int? jobDescriptionId;
  @override
  @JsonKey(name: 'PlantationId')
  final int? plantationId;
  @override
  @JsonKey(name: 'ContractorId')
  final int? contractorId;
  @override
  @JsonKey(name: 'TeamId')
  final int? teamId;
  @override
  @JsonKey(name: 'WorkerId')
  final String? workerId;
  @override
  @JsonKey(name: 'Lat')
  final double? lat;
  @override
  @JsonKey(name: 'Long')
  final double? long;
  @override
  @JsonKey(name: 'Location')
  final String? location;
  @override
  @JsonKey(name: 'JobCategoryName')
  final String? jobCategoryName;
  @override
  @JsonKey(name: 'JobDescriptionName')
  final String? jobDescriptionName;
  @override
  @JsonKey(name: 'PlantationName')
  final String? plantationName;
  @override
  @JsonKey(name: 'ContractorName')
  final String? contractorName;
  @override
  @JsonKey(name: 'TeamName')
  final String? teamName;
  @override
  @JsonKey(name: 'WorkerName')
  final String? workerName;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'CreateDT')
  final String? createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  final String? updateDT;

  @override
  String toString() {
    return 'Assessment(assessmentId: $assessmentId, companyId: $companyId, userId: $userId, jobCategoryId: $jobCategoryId, jobDescriptionId: $jobDescriptionId, plantationId: $plantationId, contractorId: $contractorId, teamId: $teamId, workerId: $workerId, lat: $lat, long: $long, location: $location, jobCategoryName: $jobCategoryName, jobDescriptionName: $jobDescriptionName, plantationName: $plantationName, contractorName: $contractorName, teamName: $teamName, workerName: $workerName, status: $status, isActive: $isActive, createDT: $createDT, updateDT: $updateDT)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Assessment &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.jobCategoryId, jobCategoryId) ||
                other.jobCategoryId == jobCategoryId) &&
            (identical(other.jobDescriptionId, jobDescriptionId) ||
                other.jobDescriptionId == jobDescriptionId) &&
            (identical(other.plantationId, plantationId) ||
                other.plantationId == plantationId) &&
            (identical(other.contractorId, contractorId) ||
                other.contractorId == contractorId) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.jobCategoryName, jobCategoryName) ||
                other.jobCategoryName == jobCategoryName) &&
            (identical(other.jobDescriptionName, jobDescriptionName) ||
                other.jobDescriptionName == jobDescriptionName) &&
            (identical(other.plantationName, plantationName) ||
                other.plantationName == plantationName) &&
            (identical(other.contractorName, contractorName) ||
                other.contractorName == contractorName) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.workerName, workerName) ||
                other.workerName == workerName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createDT, createDT) ||
                other.createDT == createDT) &&
            (identical(other.updateDT, updateDT) ||
                other.updateDT == updateDT));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        assessmentId,
        companyId,
        userId,
        jobCategoryId,
        jobDescriptionId,
        plantationId,
        contractorId,
        teamId,
        workerId,
        lat,
        long,
        location,
        jobCategoryName,
        jobDescriptionName,
        plantationName,
        contractorName,
        teamName,
        workerName,
        status,
        isActive,
        createDT,
        updateDT
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssessmentCopyWith<_$_Assessment> get copyWith =>
      __$$_AssessmentCopyWithImpl<_$_Assessment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssessmentToJson(
      this,
    );
  }
}

abstract class _Assessment extends Assessment {
  const factory _Assessment(
      {@JsonKey(name: 'AssessmentId') required final int? assessmentId,
      @JsonKey(name: 'CompanyId') final int? companyId,
      @JsonKey(name: 'UserId') final int? userId,
      @JsonKey(name: 'JobCategoryId') final int? jobCategoryId,
      @JsonKey(name: 'JobDescriptionId') final int? jobDescriptionId,
      @JsonKey(name: 'PlantationId') final int? plantationId,
      @JsonKey(name: 'ContractorId') final int? contractorId,
      @JsonKey(name: 'TeamId') final int? teamId,
      @JsonKey(name: 'WorkerId') final String? workerId,
      @JsonKey(name: 'Lat') final double? lat,
      @JsonKey(name: 'Long') final double? long,
      @JsonKey(name: 'Location') final String? location,
      @JsonKey(name: 'JobCategoryName') final String? jobCategoryName,
      @JsonKey(name: 'JobDescriptionName') final String? jobDescriptionName,
      @JsonKey(name: 'PlantationName') final String? plantationName,
      @JsonKey(name: 'ContractorName') final String? contractorName,
      @JsonKey(name: 'TeamName') final String? teamName,
      @JsonKey(name: 'WorkerName') final String? workerName,
      @JsonKey(name: 'Status') final int? status,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'CreateDT') final String? createDT,
      @JsonKey(name: 'UpdateDT') final String? updateDT}) = _$_Assessment;
  const _Assessment._() : super._();

  factory _Assessment.fromJson(Map<String, dynamic> json) =
      _$_Assessment.fromJson;

  @override
  @JsonKey(name: 'AssessmentId')
  int? get assessmentId;
  @override
  @JsonKey(name: 'CompanyId')
  int? get companyId;
  @override
  @JsonKey(name: 'UserId')
  int? get userId;
  @override
  @JsonKey(name: 'JobCategoryId')
  int? get jobCategoryId;
  @override
  @JsonKey(name: 'JobDescriptionId')
  int? get jobDescriptionId;
  @override
  @JsonKey(name: 'PlantationId')
  int? get plantationId;
  @override
  @JsonKey(name: 'ContractorId')
  int? get contractorId;
  @override
  @JsonKey(name: 'TeamId')
  int? get teamId;
  @override
  @JsonKey(name: 'WorkerId')
  String? get workerId;
  @override
  @JsonKey(name: 'Lat')
  double? get lat;
  @override
  @JsonKey(name: 'Long')
  double? get long;
  @override
  @JsonKey(name: 'Location')
  String? get location;
  @override
  @JsonKey(name: 'JobCategoryName')
  String? get jobCategoryName;
  @override
  @JsonKey(name: 'JobDescriptionName')
  String? get jobDescriptionName;
  @override
  @JsonKey(name: 'PlantationName')
  String? get plantationName;
  @override
  @JsonKey(name: 'ContractorName')
  String? get contractorName;
  @override
  @JsonKey(name: 'TeamName')
  String? get teamName;
  @override
  @JsonKey(name: 'WorkerName')
  String? get workerName;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'CreateDT')
  String? get createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  String? get updateDT;
  @override
  @JsonKey(ignore: true)
  _$$_AssessmentCopyWith<_$_Assessment> get copyWith =>
      throw _privateConstructorUsedError;
}
