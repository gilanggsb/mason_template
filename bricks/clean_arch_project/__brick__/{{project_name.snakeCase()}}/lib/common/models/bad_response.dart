// To parse this JSON data, do
//
//     final badResponse = badResponseFromJson(jsonString);

import 'dart:convert';

BadResponse badResponseFromJson(String str) =>
    BadResponse.fromJson(json.decode(str));

String badResponseToJson(BadResponse data) => json.encode(data.toJson());

class BadResponse {
  BadResponse({
    this.error,
    this.data,
    this.message,
  });

  final bool? error;
  final dynamic data;
  final String? message;

  factory BadResponse.fromJson(Map<String, dynamic> json) => BadResponse(
        error: json["error"] ?? false,
        data: json["data"],
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data == null ? null : List<dynamic>.from(data?.map((x) => x)),
        "message": message,
      };
}
