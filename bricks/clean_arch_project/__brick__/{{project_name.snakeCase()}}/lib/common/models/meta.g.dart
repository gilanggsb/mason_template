// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      currentPage: (json['current_page'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      path: json['path'] as String?,
      perPage: json['per_page'] as String?,
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'from': instance.from,
      'lastPage': instance.lastPage,
      'path': instance.path,
      'perPage': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };
