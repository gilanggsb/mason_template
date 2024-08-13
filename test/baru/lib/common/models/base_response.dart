import 'package:freezed_annotation/freezed_annotation.dart';

import '../common.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    bool? status,
    String? message,
    Request? request,
    Info? info,
    Paging? paging,
    T? data,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    FromJsonT<T> fromJsonT,
  ) {
    return _$BaseResponseFromJson<T>(json, fromJsonT);
  }

  static BaseResponse<T> success<T>({T? data, String? message}) =>
      BaseResponse<T>(
        data: data,
        status: true,
        message: "Success",
      );

  static BaseResponse<T> failed<T>({T? data, String? message}) =>
      BaseResponse<T>(
        data: data,
        status: false,
        message: message,
      );
}
