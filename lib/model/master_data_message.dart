// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'master_data_message.freezed.dart';
part 'master_data_message.g.dart';

@freezed
class MasterDataMessage with _$MasterDataMessage {
  const factory MasterDataMessage({
    Paging? paging,
    List<Message>? message,
  }) = _MasterDataMessage;

  factory MasterDataMessage.fromJson(Map<String, dynamic> json) => _$MasterDataMessageFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    Header? header,
    dynamic properties,
    String? body,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

@freezed
class Header with _$Header {
  const factory Header({
    String? client,
    String? topic,
    int? messageId,
    String? originalTopic,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
class Paging with _$Paging {
  const factory Paging({
    int? pageNumber,
    int? pageSize,
    int? totalRecords,
    int? totalPages,
  }) = _Paging;

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);
}
