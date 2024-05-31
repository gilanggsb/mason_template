// To parse this JSON data, do
//
//     final meta = metaFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'meta.freezed.dart';
part 'meta.g.dart';

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));

String metaToJson(Meta data) => json.encode(data.toJson());

@Freezed(fromJson: false)
@JsonSerializable(fieldRename: FieldRename.snake)
class Meta with _$Meta {
  const factory Meta({
    int? currentPage,
    int? from,
    int? lastPage,
    String? path,
    String? perPage,
    int? to,
    int? total,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
