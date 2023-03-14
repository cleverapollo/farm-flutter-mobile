// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_data_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MasterDataMessage _$$_MasterDataMessageFromJson(Map<String, dynamic> json) =>
    _$_MasterDataMessage(
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      message: (json['message'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MasterDataMessageToJson(
        _$_MasterDataMessage instance) =>
    <String, dynamic>{
      'paging': instance.paging?.toJson(),
      'message': instance.message?.map((e) => e.toJson()).toList(),
    };

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      properties: json['properties'],
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'properties': instance.properties,
      'body': instance.body,
    };

_$_Header _$$_HeaderFromJson(Map<String, dynamic> json) => _$_Header(
      client: json['client'] as String?,
      topic: json['topic'] as String?,
      messageId: json['messageId'] as int?,
      originalTopic: json['originalTopic'] as String?,
    );

Map<String, dynamic> _$$_HeaderToJson(_$_Header instance) => <String, dynamic>{
      'client': instance.client,
      'topic': instance.topic,
      'messageId': instance.messageId,
      'originalTopic': instance.originalTopic,
    };

_$_Paging _$$_PagingFromJson(Map<String, dynamic> json) => _$_Paging(
      pageNumber: json['pageNumber'] as int?,
      pageSize: json['pageSize'] as int?,
      totalRecords: json['totalRecords'] as int?,
      totalPages: json['totalPages'] as int?,
    );

Map<String, dynamic> _$$_PagingToJson(_$_Paging instance) => <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'totalPages': instance.totalPages,
    };
