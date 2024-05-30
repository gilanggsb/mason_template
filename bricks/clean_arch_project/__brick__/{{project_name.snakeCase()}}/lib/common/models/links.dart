// To parse this JSON data, do
//
//     final links = linksFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'links.freezed.dart';
part 'links.g.dart';

Links linksFromJson(String str) => Links.fromJson(json.decode(str));

String linksToJson(Links data) => json.encode(data.toJson());

@freezed
class Links with _$Links {
    const factory Links({
        String? first,
        String? last,
        dynamic prev,
        String? next,
    }) = _Links;

    factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}
