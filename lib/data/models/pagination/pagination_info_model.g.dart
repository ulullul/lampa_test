// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationInfoModel _$PaginationInfoModelFromJson(Map<String, dynamic> json) =>
    PaginationInfoModel(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$PaginationInfoModelToJson(
        PaginationInfoModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
