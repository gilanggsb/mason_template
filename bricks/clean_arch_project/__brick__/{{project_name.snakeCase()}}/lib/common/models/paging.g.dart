// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      totalItems: (json['total_items'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      startPage: (json['start_page'] as num?)?.toInt(),
      endPage: (json['end_page'] as num?)?.toInt(),
      startIndex: (json['start_index'] as num?)?.toInt(),
      endIndex: (json['end_index'] as num?)?.toInt(),
      pages: (json['pages'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'total_items': instance.totalItems,
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
      'total_pages': instance.totalPages,
      'start_page': instance.startPage,
      'end_page': instance.endPage,
      'start_index': instance.startIndex,
      'end_index': instance.endIndex,
      'pages': instance.pages,
    };

Map<String, dynamic> _$$PagingImplToJson(_$PagingImpl instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalPages': instance.totalPages,
      'startPage': instance.startPage,
      'endPage': instance.endPage,
      'startIndex': instance.startIndex,
      'endIndex': instance.endIndex,
      'pages': instance.pages,
    };
